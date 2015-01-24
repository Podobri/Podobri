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

import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.EventDao;
import com.mmm.podobri.dao.UserDao;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.EventCostType;
import com.mmm.podobri.model.Opportunity;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.model.User;


@Service("eventService")
@Transactional
public class EventServiceImpl
    implements EventService
{
    @Autowired
    private EventDao eventDao;
    
    @Autowired
    private UserDao userDao;


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
}
