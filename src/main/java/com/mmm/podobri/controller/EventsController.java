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
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.ModelMap;
import org.springframework.util.AutoPopulatingList;
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
import com.mmm.podobri.model.EventsProgram;
import com.mmm.podobri.model.Lector;
import com.mmm.podobri.model.Opportunity;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.model.Sponsor;
import com.mmm.podobri.service.EventService;
import com.mmm.podobri.util.EventViewWrapper;
import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.util.MailTemplate;


@Controller
@RequestMapping("/events")
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
        binder.registerCustomEditor(List.class, "activities", new ActivityEditor(List.class, eventService.getDaoUtils()));
        binder.registerCustomEditor(List.class, "editParticipants", new CustomCollectionEditor(List.class)
        {
            @Override
            protected Object convertElement(Object element)
            {
                // if (element instanceof String)
                // {
                // byte activityId = Byte.parseByte((String)element);
                // Activity activity = daoUtils.getActivityById(activityId);
                // return activity;
                // }
                return super.convertElement(element);
            }
        });
    }


    @RequestMapping
    public ModelAndView eventsHome()
    {
        final ModelAndView model = new ModelAndView("events/events");
        EventsFilter filter = new EventsFilter();
        model.addObject("eventsFilter", filter);
        model.addObject("actualEvents", EventViewWrapper.buildEventViewWrapperList(eventService.findAll()));
        return loadSelects(model);
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView searchEvents(@Valid @ModelAttribute("eventsFilter") EventsFilter searchCriteria,
                                     BindingResult result,
                                     ModelMap model)
    {
        if (result.hasErrors())
        {
            // return model;
        }
        final ModelAndView m = new ModelAndView("events/events");
        List<Event> filteredEvents = eventService.search(searchCriteria);
        model.addAttribute("actualEvents", EventViewWrapper.buildEventViewWrapperList(filteredEvents));
        String filteredEventsMessage = "Found " + filteredEvents.size() + " results";
        model.addAttribute("filteredEventsMessage", filteredEventsMessage);
        m.addAllObjects(model);
        return loadSelects(m);
    }


    @RequestMapping(value = "/viewEvent/{id}", method = RequestMethod.GET)
    public ModelAndView viewEvent(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("events/eventsView");
        final Event event = eventService.findOne(id);
        EventViewWrapper eventWrapper = new EventViewWrapper(event);
        model.addObject("event", eventWrapper);
        return model;
    }


    @RequestMapping(value = "/deleteEvent/{id}", method = RequestMethod.GET)
    public String deleteEvent(@PathVariable Integer id)
    {
        // TODO remove comment
        // eventService.deleteById(id);
        return "redirect:/events/myEvents";
    }


    @RequestMapping(value = "/editEvent/{id}", method = RequestMethod.GET)
    public ModelAndView editEvent(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("events/eventsEdit");
        Event event = eventService.findOne(id);
        // initEventAutoPopulation(event); ???
        model.addObject("event", event);
        return loadSelects(model);
    }


    @RequestMapping(value = "/updateEvent", method = RequestMethod.POST)
    public ModelAndView updateEvent(@ModelAttribute("event") Event event, BindingResult result, ModelAndView model)
    {
        if (result.hasErrors())
        {
            return model;
        }
        eventService.update(event);
        return new ModelAndView("redirect:/events");
    }


    @RequestMapping(value = "/createEvent", method = RequestMethod.GET)
    public ModelAndView createEvent()
    {
        final ModelAndView model = new ModelAndView("events/eventsAdd");
        Event event = new Event();
        initEventAutoPopulation(event);
        model.addObject("event", event);
        return loadSelects(model);
    }


    @RequestMapping(value = "/createEventSubmit", method = RequestMethod.POST)
    public ModelAndView createEventSubmit(@ModelAttribute("event") Event event, BindingResult result, ModelAndView model)
    {
        if (result.hasErrors())
        {
            return model;
        }
        eventService.createNewEvent(event);
        return new ModelAndView("redirect:/events");
    }


    @RequestMapping(value = "/createInitiative", method = RequestMethod.GET)
    public ModelAndView createInitiative()
    {
        final ModelAndView model = new ModelAndView("events/eventsInit");
        model.addObject("event", new Event());
        return loadSelects(model);
    }


    @RequestMapping(value = "/apply/{id}", method = RequestMethod.GET)
    public ModelAndView apply(@PathVariable Integer id)
    {
        final Event event = eventService.findOne(id);
        eventService.apply(event);
        final ModelAndView model = new ModelAndView("events/eventsView");
        EventViewWrapper eventWrapper = new EventViewWrapper(event);
        model.addObject("event", eventWrapper);
        return model;
    }


    @RequestMapping(value = "/myEvents", method = RequestMethod.GET)
    public ModelAndView myEvents()
    {
        final ModelAndView model = new ModelAndView("events/myEvents");
        List<Event> myEvents = eventService.getMyEvents();
        List<EditEventParticipant> editParticipants = new AutoPopulatingList<EditEventParticipant>(EditEventParticipant.class);
        model.addObject("editParticipants", editParticipants);
        MailTemplate mailTemplate = new MailTemplate();
        model.addObject("mailTemplate", mailTemplate);
        model.addObject("events", EventViewWrapper.buildEventViewWrapperList(myEvents));
        return model;
    }


    @RequestMapping(value = "/updateParticipants", method = RequestMethod.POST)
    public String updateParticipants(ArrayList<EditEventParticipant> editParticipants, BindingResult result, ModelAndView model)
    {
        if (result.hasErrors())
        {}
        return "redirect:/events/myEvents";
    }

    @RequestMapping(value = "/myEvents/sendMailToParticipants/{id}", method = RequestMethod.POST)
    public String sendMailToParticipants(@PathVariable Integer id, @ModelAttribute("mailTemplate") MailTemplate template)
    {
        eventService.sendMailToAllParticipants(id, template);
        return "redirect:/events/myEvents";
    }


    @RequestMapping(value = "/myEvents/sendMailToParticipants/{id}/{userId}", method = RequestMethod.POST)
    public String sendMailToParticipant(@PathVariable Integer id,
                                        @PathVariable Integer userId,
                                        @ModelAttribute("mailTemplate") MailTemplate template)
    {

        eventService.sendMailToParticipant(id, userId, template);
        return "redirect:/events/myEvents";
    }


    private ModelAndView loadSelects(ModelAndView model)
    {
        model.addObject("categoriesList", categoriesList);
        model.addObject("opportunitiesList", opportunitiesList);
        model.addObject("activitiesList", activitiesList);
        model.addObject("countriesList", countriesList);
        model.addObject("citiesList", citiesList);
        model.addObject("costTypesList", costTypesList);
        return model;
    }


    private Event initEventAutoPopulation(Event event)
    {
        List<EventsProgram> eventsPrograms = new AutoPopulatingList<EventsProgram>(EventsProgram.class);
        event.setEventsPrograms(eventsPrograms);
        List<Sponsor> sponsors = new AutoPopulatingList<Sponsor>(Sponsor.class);
        event.setSponsors(sponsors);
        List<Lector> lectors = new AutoPopulatingList<Lector>(Lector.class);
        event.setLectors(lectors);
        return event;
    }

    public class EditEventParticipant
    {
        int eventId;
        int userId;
        int status;


        public EditEventParticipant()
        {}


        public int getEventId()
        {
            return eventId;
        }


        public void setEventId(int eventId)
        {
            this.eventId = eventId;
        }


        public int getUserId()
        {
            return userId;
        }


        public void setUserId(int userId)
        {
            this.userId = userId;
        }


        public int getStatus()
        {
            return status;
        }


        public void setStatus(int status)
        {
            this.status = status;
        }
    }
}
