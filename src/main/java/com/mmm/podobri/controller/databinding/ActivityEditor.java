/*
 * ActivitiesEditor.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller.databinding;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomCollectionEditor;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.model.Activity;

public class ActivityEditor
    extends CustomCollectionEditor
{
    private final DaoUtils daoUtils;


    public ActivityEditor(Class< ? extends Collection> collectionType, DaoUtils daoUtils)
    {
        super(collectionType);
        this.daoUtils = daoUtils;
    }


    @Override
    protected Object convertElement(Object element)
    {
        if (element instanceof String)
        {
            byte activityId = Byte.parseByte((String)element);
            Activity activity = daoUtils.getActivitiesById(activityId);
            return activity;
        }
        return null;
    }

}
