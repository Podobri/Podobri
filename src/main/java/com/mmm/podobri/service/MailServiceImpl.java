/*
 * MailService.java
 *
 * created at 27.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("mailService")
@Transactional
public class MailServiceImpl
    implements MailService
{
    private static final String SYSTEM = "system";

    @Autowired
    private MailSender mailSender;


    @Override
    public void sendMail(SimpleMailMessage... msg)
    {
        for (final SimpleMailMessage message : msg)
        {
            sendMailToServer(message);
        }
    }


    @Override
    public void sendMail(String from, String to, String subject, String... msg)
    {
        for (final String m : msg)
        {
            SimpleMailMessage message = createMessage(from, to, subject, m);
            sendMailToServer(message);
        }
    }


    @Override
    public void sendSystemMail(SimpleMailMessage... msg)
    {
        for (final SimpleMailMessage message : msg)
        {
            if (message != null)
            {
                message.setFrom(SYSTEM);
                sendMailToServer(message);
            }
        }
    }


    @Override
    public void sendSystemMail(String to, String subject, String... msg)
    {
        for (final String m : msg)
        {
            SimpleMailMessage createMessage = createMessage(SYSTEM, to, subject, m);
            sendMailToServer(createMessage);
        }
    }


    private SimpleMailMessage createMessage(String from, String to, String subject, String msg)
    {
        final SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        return message;
    }


    @Async
    private void sendMailToServer(SimpleMailMessage msg)
    {
        if (msg != null)
        {
            msg.setSentDate(new Date());
            mailSender.send(msg);
        }
    }
}
