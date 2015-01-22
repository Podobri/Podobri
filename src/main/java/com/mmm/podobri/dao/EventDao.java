/*
 * EventDao.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.dao;

import java.util.List;

import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.model.Event;


public interface EventDao extends BaseDao<Event>
{
    public List<Event> search(EventsFilter filter);
}



