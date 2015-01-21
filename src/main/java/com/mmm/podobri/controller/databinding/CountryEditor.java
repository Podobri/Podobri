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
import com.mmm.podobri.model.Country;


public class CountryEditor extends CustomCollectionEditor
{
    private static final List<Country> countriesList = new ArrayList<Country>();
    
    @Autowired
    private DaoUtils daoUtils;
    
    public CountryEditor(Class< ? extends Collection> collectionType)
    {
        super(collectionType);
        if (countriesList.isEmpty())
        {
            countriesList.addAll(daoUtils.findAllCountries());
        }
    }
    
    @Override
    protected Object convertElement(Object element)
    {
        if (element instanceof String)
        {
            int countryId = Integer.parseInt((String)element);
            for (Country c : countriesList)
            {
                if (c.getId() == countryId)
                {
                    return c;
                }
            }
        }
        return null;
    }

}



