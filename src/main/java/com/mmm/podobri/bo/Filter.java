/*
 * Filter.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;

import java.util.List;

import com.mmm.podobri.model.Activity;


public class Filter
{
    private List<Activity> activities;
    private byte countryId;
    private int cityId;

    public Filter()
    {
        
    }

    
    public List<Activity> getActivities()
    {
        return activities;
    }


    public void setActivities(List<Activity> activities)
    {
        this.activities = activities;
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
}


