/*
 * FileUploadUtil.java
 *
 * created at 29.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.util;


import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class FileUploadUtil
{
    private static int THUMBNAIL_SIZE_128x128 = 128;
    private static int THUMBNAIL_SIZE_WIDTH_400 = 400;
    private static int THUMBNAIL_SIZE_HEIGHT_250 = 250;

    private static String CONTENT_TYPE_JPEG = "image/jpeg";
    private static String CONTENT_TYPE_PNG = "image/png";

    private static String JBOSS_SERVER_HOME = "jboss.server.home.dir";
    private static String IMAGES_PATH = File.separator + "data" + File.separator + "images" + File.separator;
    private static String THUMBNAIL_PATH_SIZE_128 = IMAGES_PATH + File.separator + "thumbnail128x128";
    private static String THUMBNAIL_PATH_SIZE_400x250 = IMAGES_PATH + File.separator + "thumbnail400x25";

    private static boolean renderingHintEnabled = false;


    public static Path getImagesStore()
    {
        return getImagesStore(IMAGES_PATH);
    }


    public static Path getImagesThumb128Store()
    {
        return getImagesStore(THUMBNAIL_PATH_SIZE_128);
    }


    public static Path getImagesThumb450x200Store()
    {
        return getImagesStore(THUMBNAIL_PATH_SIZE_400x250);
    }


    private static Path getImagesStore(String type)
    {
        String jbossHome = System.getProperty(JBOSS_SERVER_HOME);
        Path path = Paths.get(jbossHome, type);
        File storage = path.toFile();
        if (!storage.exists())
        {
            storage.mkdirs();
        }
        return path;
    }


    private static BufferedImage resizeImage(BufferedImage originalImage, int type, int width, int height)
    {

        BufferedImage resizedImage = new BufferedImage(width, height, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, width, height, null);
        g.dispose();

        if (renderingHintEnabled)
        {
            g.setComposite(AlphaComposite.Src);
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
            g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
            g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        }

        return resizedImage;
    }


    public static String processImages(CommonsMultipartFile image, boolean makeThumb128, boolean makeThumb450)
    {
        try
        {
            String contentType = image.getFileItem().getContentType();
            if (!(contentType.equalsIgnoreCase(CONTENT_TYPE_JPEG) || contentType.equalsIgnoreCase(CONTENT_TYPE_PNG)))
            {
                throw new IOException("content type of file is not allowed:" + contentType);
            }

            InputStream inputStream = image.getInputStream();
            String fileName = image.getOriginalFilename();
            String finalFileName = System.currentTimeMillis() + fileName;
            BufferedImage originalImage = ImageIO.read(inputStream);
            int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
            ImageIO.write(originalImage, "jpg", Paths.get(getImagesStore().toString(), finalFileName).toFile());
            if (makeThumb128)
            {
                BufferedImage resizeImage128x128 = resizeImage(originalImage,
                                                               type,
                                                               THUMBNAIL_SIZE_128x128,
                                                               THUMBNAIL_SIZE_128x128);
                ImageIO.write(resizeImage128x128, "jpg", Paths.get(getImagesThumb128Store().toString(), finalFileName).toFile());
            }

            if (makeThumb450)
            {
                BufferedImage resizeImage400x250 = resizeImage(originalImage,
                                                               type,
                                                               THUMBNAIL_SIZE_WIDTH_400,
                                                               THUMBNAIL_SIZE_HEIGHT_250);
                ImageIO.write(resizeImage400x250, "jpg", Paths.get(getImagesThumb450x200Store().toString(), finalFileName)
                                                              .toFile());
            }

            return finalFileName;
        }
        catch (IOException e)
        {
            System.out.println("Error while uploading file");
        }
        return "Error";
    }
}
