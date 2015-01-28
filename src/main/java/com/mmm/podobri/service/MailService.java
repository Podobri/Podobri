/*
 * MailService.java
 *
 * created at 27.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;

import org.springframework.mail.SimpleMailMessage;


public interface MailService
{
    public void sendMail(SimpleMailMessage... msg);
    public void sendMail(String from, String to, String subject, String... msg);
    public void sendSystemMail(SimpleMailMessage... msg);
    public void sendSystemMail(String to, String subject, String... msg);
}



