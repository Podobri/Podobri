/*
 * ActivitiesEditor.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller.databinding;


import java.util.Collection;

import org.springframework.beans.propertyeditors.CustomCollectionEditor;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.model.Language;


public class LanguageEditor
    extends CustomCollectionEditor
{
    private final DaoUtils daoUtils;


    public LanguageEditor(Class< ? extends Collection> collectionType, DaoUtils daoUtils)
    {
        super(collectionType);
        this.daoUtils = daoUtils;
    }


    @Override
    protected Object convertElement(Object element)
    {
        if (element instanceof String)
        {
            Byte languageId = Byte.parseByte((String)element);
            Language lang = daoUtils.getLanguageById(languageId);
            return lang;
        }
        return null;
    }
}
