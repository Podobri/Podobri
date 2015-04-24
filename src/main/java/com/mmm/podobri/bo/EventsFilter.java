/*
 * EventsFilter.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;

import java.util.Date;


public class EventsFilter extends Filter
{
    private byte categoryId;
    private byte opportunityId;
    private Date startDate;
    private Date deadline;
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


    public byte getCostTypeId()
    {
        return costTypeId;
    }


    public void setCostTypeId(byte costTypeId)
    {
        this.costTypeId = costTypeId;
    }
}


