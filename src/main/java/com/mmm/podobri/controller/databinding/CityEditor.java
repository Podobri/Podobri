/*
 * ActivitiesEditor.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller.databinding;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.model.City;


public class CityEditor extends CustomCollectionEditor
{
    private static final List<City> citiesList = new ArrayList<City>();
    
    @Autowired
    private DaoUtils daoUtils;
    
    public CityEditor(Class< ? extends Collection> collectionType)
    {
        super(collectionType);
        if (citiesList.isEmpty())
        {
            citiesList.addAll(daoUtils.findAllCities());
        }
    }
    
    @Override
    protected Object convertElement(Object element)
    {
        if (element instanceof String)
        {
            int cityId = Integer.parseInt((String)element);
            for (City c : citiesList)
            {
                if (c.getId() == cityId)
                {
                    return c;
                }
            }
        }
        return null;
    }

}



