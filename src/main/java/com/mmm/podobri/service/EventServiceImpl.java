/*
 * EventServiceImpl.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.EventDao;
import com.mmm.podobri.model.Event;


@Service("eventService")
@Transactional
public class EventServiceImpl
    implements EventService
{
    @Autowired
    private EventDao eventDao;


    @Override
    public Event findOne(long id)
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
    public void deleteById(long id)
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
        return event;
    }
}
