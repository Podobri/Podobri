/*
 * EventViewWrapper.java
 *
 * created at 24.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.util;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mmm.podobri.model.Event;
import com.mmm.podobri.service.EventService.EventStatus;


public class EventViewWrapper
{
    private final Event event;
    private final int eventParticipantsSize;
    private final String country;
    private final String city;
    private final String category;
    private final String opportunity;
    private final String costType;
    private final String organizator;
    private final String status;
    private final int dateFromDayOfMonth;
    private final String dateFromDayOfWeek;
    private final String dateFromMonth;
    private final String dateFromDate;
    private final String dateFromTime;
    private final int dateToDayOfMonth;
    private final String dateToDayOfWeek;
    private final String dateToMonth;
    private final String dateToDate;
    private final String dateToTime;
    private final int deadlineDayOfMonth;
    private final String deadlineDayOfWeek;
    private final String deadlineMonth;
    private final String deadlineDate;
    private final String deadlineTime;


    public EventViewWrapper(final Event event)
    {
        this.event = event;
        this.eventParticipantsSize = event.getEventsParticipants().size();
        this.country = event.getCountry().getCountry();
        this.city = event.getCity().getCity();
        this.category = event.getOpportunityCategory().getCategory();
        this.opportunity = event.getOpportunity().getOpportunity();
        this.costType = event.getEventCostType().getCost();
        this.organizator = event.getUser().getUsername();
        this.status = EventStatus.getStatusName(event.getStatus());
        final Date dateFrom = event.getDateFrom();
        this.dateFromDayOfMonth = CalendarUtil.getDayOfMonth(dateFrom);
        this.dateFromDayOfWeek = CalendarUtil.getDayOfWeek(dateFrom);
        this.dateFromMonth = CalendarUtil.getMonth(dateFrom);
        this.dateFromDate = CalendarUtil.getDate(dateFrom);
        this.dateFromTime = CalendarUtil.getTime(dateFrom);
        final Date dateTo = event.getDateTo();
        this.dateToDayOfMonth = CalendarUtil.getDayOfMonth(dateTo);
        this.dateToDayOfWeek = CalendarUtil.getDayOfWeek(dateTo);
        this.dateToMonth = CalendarUtil.getMonth(dateTo);
        this.dateToDate = CalendarUtil.getDate(dateTo);
        this.dateToTime = CalendarUtil.getTime(dateTo);
        final Date deadline = event.getDeadline();
        this.deadlineDayOfMonth = CalendarUtil.getDayOfMonth(deadline);
        this.deadlineDayOfWeek = CalendarUtil.getDayOfWeek(deadline);
        this.deadlineMonth = CalendarUtil.getMonth(deadline);
        this.deadlineDate = CalendarUtil.getDate(deadline);
        this.deadlineTime = CalendarUtil.getTime(deadline);
    }

    public Event getEvent()
    {
        return event;
    }


    public int getEventParticipantsSize()
    {
        return eventParticipantsSize;
    }


    public int getDateFromDayOfMonth()
    {
        return dateFromDayOfMonth;
    }


    public String getDateFromDayOfWeek()
    {
        return dateFromDayOfWeek;
    }


    public String getDateFromMonth()
    {
        return dateFromMonth;
    }


    public String getDateFromDate()
    {
        return dateFromDate;
    }


    public String getDateFromTime()
    {
        return dateFromTime;
    }


    public int getDateToDayOfMonth()
    {
        return dateToDayOfMonth;
    }


    public String getDateToDayOfWeek()
    {
        return dateToDayOfWeek;
    }


    public String getDateToMonth()
    {
        return dateToMonth;
    }


    public String getDateToDate()
    {
        return dateToDate;
    }


    public String getDateToTime()
    {
        return dateToTime;
    }


    public int getDeadlineDayOfMonth()
    {
        return deadlineDayOfMonth;
    }


    public String getDeadlineDayOfWeek()
    {
        return deadlineDayOfWeek;
    }


    public String getDeadlineMonth()
    {
        return deadlineMonth;
    }


    public String getDeadlineDate()
    {
        return deadlineDate;
    }


    public String getDeadlineTime()
    {
        return deadlineTime;
    }


    public String getCountry()
    {
        return country;
    }


    public String getCity()
    {
        return city;
    }


    public String getCategory()
    {
        return category;
    }


    public String getOpportunity()
    {
        return opportunity;
    }


    public String getCostType()
    {
        return costType;
    }


    public String getOrganizator()
    {
        return organizator;
    }


    public String getStatus()
    {
        return status;
    }


    public static List<EventViewWrapper> buildEventViewWrapperList(List<Event> events)
    {
        List<EventViewWrapper> result = new ArrayList<EventViewWrapper>();
        for (final Event e : events)
        {
            EventViewWrapper wrapper = new EventViewWrapper(e);
            result.add(wrapper);
        }
        return result;
    }
}
