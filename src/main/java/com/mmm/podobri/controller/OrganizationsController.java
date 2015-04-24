/*
 * UsersController.java
 *
 * created at 12.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mmm.podobri.bo.EventViewWrapper;
import com.mmm.podobri.bo.Filter;
import com.mmm.podobri.bo.OrganizationsFilter;
import com.mmm.podobri.controller.databinding.ActivityEditor;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.Organization;
import com.mmm.podobri.service.OrganizationService;


@Controller
@RequestMapping("/organizations")
public class OrganizationsController
{
    @Autowired
    private OrganizationService organizationService;


    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        binder.registerCustomEditor(List.class, "activities", new ActivityEditor(List.class, organizationService.getDaoUtils()));
    }


    @RequestMapping
    public ModelAndView organizationsHome()
    {
        final ModelAndView model = new ModelAndView("organizations/organizations");
        Filter filter = new OrganizationsFilter();
        model.addObject("organizationsFilter", filter);
        model.addObject("organizations", organizationService.findAll());
        return loadSelects(model);
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView searchOrganizations(@Valid @ModelAttribute("organizationsFilter") Filter searchCriteria,
                                     BindingResult result,
                                     ModelMap model)
    {
        if (result.hasErrors())
        {
            // return model;
        }
        final ModelAndView m = new ModelAndView("organizations/organizations");
        List<Organization> filteredOrganizations = organizationService.searchOrganization((OrganizationsFilter)searchCriteria);
        model.addAttribute("organizations", filteredOrganizations);
        String filteredOrganizationsMessage = "Found " + filteredOrganizations.size() + " results";
        model.addAttribute("filteredOrganizationsMessage", filteredOrganizationsMessage);
        m.addAllObjects(model);
        return loadSelects(m);
    }


    @RequestMapping(value = "/viewOrganization/{id}", method = RequestMethod.GET)
    public ModelAndView viewOrganization(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("organizations/organizationsView");
        final Organization organization = organizationService.findOne(id);
        model.addObject("organization", organization);
        return model;
    }


    private ModelAndView loadSelects(ModelAndView model)
    {
        model.addObject("organizationTypes", organizationService.getDaoUtils().getAllOrganizationTypes());
        model.addObject("activitiesList", organizationService.getDaoUtils().getAllActivities());
        model.addObject("countriesList", organizationService.getDaoUtils().getAllCountries());
        model.addObject("citiesList", organizationService.getDaoUtils().getAllCities());
        return model;
    }
}
