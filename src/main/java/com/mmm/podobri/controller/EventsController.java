/*
 * EventsController.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mmm.podobri.controller.databinding.ActivityEditor;
import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.model.Activity;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.EventCostType;
import com.mmm.podobri.model.Opportunity;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.service.EventService;
import com.mmm.podobri.util.EventsFilter;


@Controller
public class EventsController
{
    @Autowired
    private EventService eventService;

    public final List<OpportunityCategory> categoriesList = new ArrayList<OpportunityCategory>();
    public final List<Opportunity> opportunitiesList = new ArrayList<Opportunity>();
    public final List<Activity> activitiesList = new ArrayList<Activity>();
    public final List<Country> countriesList = new ArrayList<Country>();
    public final List<City> citiesList = new ArrayList<City>();
    public final List<EventCostType> costTypesList = new ArrayList<EventCostType>();


    @Autowired
    public void init(PlatformTransactionManager transactionManager)
    {
        new TransactionTemplate(transactionManager).execute(new TransactionCallback<Object>()
        {
            @Override
            public Object doInTransaction(TransactionStatus transactionStatus)
            {
                if (eventService != null)
                {
                    final DaoUtils daoUtils = eventService.getDaoUtils();
                    categoriesList.addAll(daoUtils.getAllOpportunityCategories());
                    opportunitiesList.addAll(daoUtils.getAllOpportunities());
                    activitiesList.addAll(daoUtils.getAllActivities());
                    countriesList.addAll(daoUtils.getAllCountries());
                    citiesList.addAll(daoUtils.getAllCities());
                    costTypesList.addAll(daoUtils.getAllEventCostTypes());
                }
                return null;
            }
        });
    }


    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(List.class,
                                    "activities",
                                    new ActivityEditor(List.class, eventService.getDaoUtils()));
    }


    @RequestMapping("/events")
    public ModelAndView eventsHome()
    {
        final ModelAndView model = new ModelAndView("events");
        EventsFilter filter = new EventsFilter();
        model.addObject("eventsFilter", filter);
        model.addObject("actualEvents", eventService.findAll());
        return addStaticObjects(model);
    }
    
    
    @RequestMapping(value = "/events/viewEvent", method = RequestMethod.GET)
    public ModelAndView viewEvent(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("eventsView");
//        final Event event = eventService.findOne(id);
//        model.addObject("userForView", event);
        return model;
    }


    @RequestMapping(value = "/events/search", method = RequestMethod.POST)
    public ModelMap searchEvents(@Valid @ModelAttribute("eventsFilter") EventsFilter searchCriteria, BindingResult result, ModelMap model)
    {
        if (result.hasErrors())
        {
            return model;
        }
        List<Event> filteredEvents = eventService.search(searchCriteria);
        model.put("actualEvents", filteredEvents);
        String filteredEventsMessage = "Found " + filteredEvents.size() + " results";
        model.put("filteredEventsMessage", filteredEventsMessage);
        return model;
    }
    
    
    @RequestMapping(value = "/events/createEvent", method = RequestMethod.GET)
    public ModelAndView createEvent()
    {
        final ModelAndView model = new ModelAndView("eventsAdd");
        model.addObject("event", new Event());
        return addStaticObjects(model);
    }
    
    @RequestMapping(value = "/events/createEvent", method = RequestMethod.POST)
    public ModelAndView registerIndividual(@ModelAttribute("event") Event event, BindingResult result, ModelAndView model)
    {
        if (result.hasErrors())
        {
            return model;
        }
        eventService.createNewEvent(event);
        return new ModelAndView("redirect:/events");
    }
    
    private ModelAndView addStaticObjects(ModelAndView model)
    {
        model.addObject("categoriesList", categoriesList);
        model.addObject("opportunitiesList", opportunitiesList);
        model.addObject("activitiesList", activitiesList);
        model.addObject("countriesList", countriesList);
        model.addObject("citiesList", citiesList);
        model.addObject("costTypesList", costTypesList);
        return model;
    }
}
