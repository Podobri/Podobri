/*
 * EventsFilter.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;

import java.util.Date;
import java.util.List;

import com.mmm.podobri.model.Activity;


public class EventsFilter
{
    private byte categoryId;
    private byte opportunityId;
    private List<Activity> activities;
    private Date startDate;
    private Date deadline;
    private byte countryId;
    private int cityId;
    private byte costTypeId;

    public EventsFilter()
    {
        
    }

    public byte getCategoryId()
    {
        return categoryId;
    }


    public void setCategoryId(byte categoryId)
    {
        this.categoryId = categoryId;
    }


    public byte getOpportunityId()
    {
        return opportunityId;
    }


    public void setOpportunityId(byte opportunityId)
    {
        this.opportunityId = opportunityId;
    }


    public List<Activity> getActivities()
    {
        return activities;
    }


    public void setActivities(List<Activity> activities)
    {
        this.activities = activities;
    }


    public Date getStartDate()
    {
        return startDate;
    }


    public void setStartDate(Date startDate)
    {
        this.startDate = startDate;
    }


    public Date getDeadline()
    {
        return deadline;
    }


    public void setDeadline(Date deadline)
    {
        this.deadline = deadline;
    }


    public byte getCountryId()
    {
        return countryId;
    }


    public void setCountryId(byte countryId)
    {
        this.countryId = countryId;
    }


    public int getCityId()
    {
        return cityId;
    }


    public void setCityId(int cityId)
    {
        this.cityId = cityId;
    }


    public byte getCostTypeId()
    {
        return costTypeId;
    }


    public void setCostTypeId(byte costTypeId)
    {
        this.costTypeId = costTypeId;
    }
}


