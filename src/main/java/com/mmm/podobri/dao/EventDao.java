/*
 * EventDao.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.dao;

import java.util.List;

import com.mmm.podobri.bo.EventsFilter;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.User;


public interface EventDao extends BaseDao<Event>
{
    public List<Event> search(EventsFilter filter);
    public List<Event> findEventsByOrganizator(int userId);
    public List<Event> findEventsByParticipant(User user);
}



