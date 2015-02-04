/*
 * ExcelBuilder.java
 *
 * created at 1.02.2015 ã. by Mariyan
 */
package com.mmm.podobri.view.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.EventsParticipant;
import com.mmm.podobri.model.Individual;


public class ExcelBuilder
    extends AbstractExcelView
{

    @Override
    protected void buildExcelDocument(Map<String, Object> model,
                                      HSSFWorkbook workbook,
                                      HttpServletRequest request,
                                      HttpServletResponse response)
        throws Exception
    {
        // get data model which is passed by the Spring container
        Event event = (Event)model.get("event");
        List<EventsParticipant> participants = (List<EventsParticipant>)event.getEventsParticipants();

        // create a new Excel sheet
        HSSFSheet sheet = workbook.createSheet("Participants " + event.getTitle());
        sheet.setDefaultColumnWidth(30);

        // create style for header cells
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);

        // create header row
        HSSFRow header = sheet.createRow(0);

        header.createCell(0).setCellValue("Firstname");
        header.getCell(0).setCellStyle(style);

        header.createCell(1).setCellValue("Lastname");
        header.getCell(1).setCellStyle(style);

        header.createCell(2).setCellValue("Birthdate");
        header.getCell(2).setCellStyle(style);

        header.createCell(3).setCellValue("Email address");
        header.getCell(3).setCellStyle(style);

        header.createCell(4).setCellValue("Status");
        header.getCell(4).setCellStyle(style);

        // create data rows
        int rowCount = 1;

        for (EventsParticipant participant : participants)
        {
            byte status = participant.getStatus();
            String statusText;
            if (status == 1)
            {
                statusText = "Approved";
            }
            else
            {
                statusText = "Not approved";
            }

            Individual individual = participant.getIndividual();

            HSSFRow aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(individual.getFirstName());
            aRow.createCell(1).setCellValue(individual.getLastName());
            aRow.createCell(2).setCellValue(individual.getBirthdate().toString());
            aRow.createCell(3).setCellValue(individual.getUser().getEmail());
            aRow.createCell(4).setCellValue(statusText);
        }
    }
}
