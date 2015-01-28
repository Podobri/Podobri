/*
 * CalendarUtil.java
 *
 * created at 26.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.springframework.context.i18n.LocaleContextHolder;


public class CalendarUtil
{
    private static final String DATE_FORMAT_MINUTES = "HH:mm";
    private static final String DATE_FORMAT_DATE = "dd.MM.yyyy";


    public static String getDate(Date date)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT_DATE);
        return dateFormat.format(date);
    }


    public static String getTime(Date date)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT_MINUTES);
        return dateFormat.format(date);
    }


    public static String getDayOfWeek(Date date)
    {
        Calendar calendar = getCalendar(date);
        String dayOfWeekName = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, getLocale());
        return dayOfWeekName;
    }


    public static String getMonth(Date date)
    {
        Calendar calendar = getCalendar(date);
        String monthName = calendar.getDisplayName(Calendar.MONTH, Calendar.LONG, getLocale());
        return monthName;
    }


    public static int getDayOfMonth(Date date)
    {
        Calendar calendar = getCalendar(date);
        return calendar.get(Calendar.DAY_OF_MONTH);
    }


    public static Calendar getCalendar(Date date)
    {
        Calendar calendar = Calendar.getInstance(getLocale());
        calendar.setTime(date);
        return calendar;
    }


    public static Locale getLocale()
    {
        Locale locale = LocaleContextHolder.getLocale();
        if (locale == null)
        {
            locale = Locale.getDefault();
        }
        return locale;
    }
}
