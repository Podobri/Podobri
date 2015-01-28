/*
 * EventServiceImpl.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.EventDao;
import com.mmm.podobri.dao.UserDao;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.EventCostType;
import com.mmm.podobri.model.EventsParticipant;
import com.mmm.podobri.model.EventsProgram;
import com.mmm.podobri.model.Opportunity;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.model.User;
import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.util.MailTemplate;


@Service("eventService")
@Transactional
public class EventServiceImpl
    implements EventService
{
    @Autowired
    private EventDao eventDao;

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private MailService mailService;


    @Override
    public Event findOne(int id)
    {
        return eventDao.findOne(id);
    }


    @Override
    public List<Event> findAll()
    {
        return eventDao.findAll();
    }


    @Override
    public void save(Event entity)
    {
        eventDao.save(entity);
    }


    @Override
    public Event update(Event entity)
    {
        entity.setModified(new Date());
        return eventDao.update(entity);
    }


    @Override
    public void delete(Event entity)
    {
        eventDao.delete(entity);
    }


    @Override
    public void deleteById(int id)
    {
        eventDao.deleteById(id);
    }


    @Override
    public DaoUtils getDaoUtils()
    {
        return eventDao.getDaoUtils();
    }


    @Override
    public void saveInTransaction(Serializable... entities)
    {
        eventDao.saveInTransaction(entities);
    }


    @Override
    public List<Event> search(EventsFilter filter)
    {
        return eventDao.search(filter);
    }


    @Override
    public Event createNewEvent(Event event)
    {
        Date dateFrom = event.getDateFrom();
        Date dateTo = event.getDateTo();
        Date deadline = event.getDeadline();
        boolean isDateValid = validateDate(dateFrom, dateTo, deadline);
        if (!isDateValid)
        {

        }

        for (EventsProgram ep : event.getEventsPrograms())
        {
            ep.setEvent(event);
        }

        DaoUtils daoUtils = getDaoUtils();
        byte opportunityCaregoryId = event.getOpportunityCategory().getId();
        OpportunityCategory opportunityCategory = daoUtils.getOpportunityCategoryById(opportunityCaregoryId);
        byte opportunityId = event.getOpportunity().getId();
        Opportunity opportunity = daoUtils.getOpportunityById(opportunityId);
        byte costTypeId = event.getEventCostType().getId();
        EventCostType eventCostType = daoUtils.getEventCostTypeById(costTypeId);
        byte countryId = event.getCountry().getId();
        Country country = daoUtils.getCountryById(countryId);
        int cityId = event.getCity().getId();
        City city = daoUtils.getCityById(cityId);

        event.setOpportunityCategory(opportunityCategory);
        event.setOpportunity(opportunity);
        event.setEventCostType(eventCostType);
        event.setCountry(country);
        event.setCity(city);

        event.setStatus(EventStatus.INCOMING.getStatus());
        Date currentDate = new Date();
        event.setCreated(currentDate);
        event.setModified(currentDate);
        User user = userDao.findOne(1);
        event.setUser(user);
        save(event);
        return event;
    }


    public boolean apply(Event event)
    {
        // TODO
        // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // String username = auth.getName(); //get logged in username
        String username = "test";
        User currentUser = userDao.findByUserName(username);
        EventsParticipant participant = new EventsParticipant();
        event.addEventsParticipant(participant);
        currentUser.getIndividual().addEventsParticipant(participant);
        participant.setStatus(ApplyStatus.APPLIED.getStatus());
        eventDao.update(event);
        return true;
    }


    public boolean confirmApplication(Event event, int userId)
    {
        List<EventsParticipant> eventsParticipants = event.getEventsParticipants();
        for (EventsParticipant ep : eventsParticipants)
        {
            if (ep.getUserId() == userId && ep.getEventId() == event.getId())
            {
                ep.setStatus(ApplyStatus.APPROVED.getStatus());
                break;
            }
        }
        eventDao.update(event);
        return true;
    }


    private boolean validateDate(Date dateFrom, Date dateTo, Date deadline)
    {
        if (dateTo.equals(dateFrom) || dateTo.before(dateFrom))
        {
            return false;
        }

        if (deadline.after(dateTo) || deadline.before(dateFrom))
        {
            return false;
        }
        return true;
    }


    public List<Event> getMyEvents()
    {
        // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // String username = auth.getName(); //get logged in username
        String username = "test";
        User currentUser = userDao.findByUserName(username);
        int currentUserId = currentUser.getId();
        List<Event> myEvents = eventDao.findEventsByOrganizator(currentUserId);
        return myEvents;
    }


    @Override
    public void sendMailToAllParticipants(int eventId, MailTemplate template)
    {
        Event event = findOne(eventId);
        List<EventsParticipant> eventsParticipants = event.getEventsParticipants();
        for (EventsParticipant ep : eventsParticipants)
        {
            int userId = ep.getUserId();
            sendMailToParticipant(eventId, userId, template);
        }
    }


    @Override
    public void sendMailToParticipant(int eventId, int userId, MailTemplate template)
    {
     // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // String username = auth.getName(); //get logged in username
        String username = "test";
        User currentUser = userDao.findByUserName(username);
        template.setFrom(currentUser.getUsername());
        User toUser = userDao.findOne(userId);
        template.setTo(toUser.getUsername());
        mailService.sendMail(template.toMailMessage());
    }
}
