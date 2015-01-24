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
    public enum EventStatus 
    { 
        NEW(0), INCOMING(1), PAST(2), INPROGRESS(3), REJECTED(4), FAILED(5);
        
        private final byte status;
        private EventStatus(int status)
        {
            this.status = (byte)status;
        }
        
        public byte getStatus()
        {
            return status;
        }
    }
    public List<Event> search(EventsFilter filter);
    public Event createNewEvent(Event event);
}



