/*
 * AjaxController.java
 *
 * created at 20.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.model.City;

@Controller
public class AjaxController
{
    @Autowired
    public DaoUtils daoUtils;
    
    @RequestMapping(value = "/ajax/getCities", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE) 
    public @ResponseBody List<City> getCitiesByCountry(@PathVariable byte id, ModelMap model)
    {
        List<City> cities = daoUtils.findAllCitiesByCountryId(id);
        return cities;
    }
}



