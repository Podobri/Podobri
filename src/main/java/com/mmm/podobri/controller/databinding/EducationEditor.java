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
import com.mmm.podobri.model.Education;


public class EducationEditor extends CustomCollectionEditor
{
    private static final List<Education> educationsList = new ArrayList<Education>();
    
    @Autowired
    private DaoUtils daoUtils;
    
    public EducationEditor(Class< ? extends Collection> collectionType)
    {
        super(collectionType);
        if (educationsList.isEmpty())
        {
            educationsList.addAll(daoUtils.findAllEducations());
        }
    }
    
    @Override
    protected Object convertElement(Object element)
    {
        if (element instanceof String)
        {
            int educationId = Integer.parseInt((String)element);
            for (Education e : educationsList)
            {
                if (e.getId() == educationId)
                {
                    return e;
                }
            }
        }
        return null;
    }

}



