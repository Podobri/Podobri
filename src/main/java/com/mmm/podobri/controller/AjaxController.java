/*
 * AjaxController.java
 *
 * created at 20.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Opportunity;


@Controller
@RequestMapping("**/ajax")
public class AjaxController
{
    @Autowired
    private DaoUtils daoUtils;


    @RequestMapping(value = "/getOpportunitiesByCategory/{id}", method = RequestMethod.GET)
    public @ResponseBody List<Opportunity> getOpportunitiesByCategory(@PathVariable byte id)
    {
        List<Opportunity> opportunities = daoUtils.findAllOpportunitiesByCategoryId(id);
        return opportunities;
    }


    @RequestMapping(value = "/getCitiesByCountry/{id}", method = RequestMethod.GET)
    public @ResponseBody List<City> getCitiesByCountry(@PathVariable byte id)
    {
        List<City> cities = daoUtils.findAllCitiesByCountryId(id);
        return cities;
    }
}
