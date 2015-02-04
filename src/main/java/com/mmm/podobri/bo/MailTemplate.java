/*
 * MailTemplate.java
 *
 * created at 28.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;


import org.springframework.mail.SimpleMailMessage;


public class MailTemplate
{
    String from;
    String to;
    String subject;
    String content;


    public MailTemplate()
    {

    }


    public String getFrom()
    {
        return from;
    }


    public void setFrom(String from)
    {
        this.from = from;
    }


    public String getTo()
    {
        return to;
    }


    public void setTo(String to)
    {
        this.to = to;
    }


    public String getSubject()
    {
        return subject;
    }


    public void setSubject(String subject)
    {
        this.subject = subject;
    }


    public String getContent()
    {
        return content;
    }


    public void setContent(String content)
    {
        this.content = content;
    }


    public SimpleMailMessage toMailMessage()
    {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        message.setReplyTo(from);
        return message;
    }
}
