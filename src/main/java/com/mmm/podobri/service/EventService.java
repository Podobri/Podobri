/*
 * EventService.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;

import java.util.List;

import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.model.Event;


public interface EventService extends BaseDaoServices<Event>
{
    public List<Event> search(EventsFilter filter);
    public Event createNewEvent(Event event);
}



