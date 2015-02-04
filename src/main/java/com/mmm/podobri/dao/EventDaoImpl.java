/*
 * EventDaoImpl.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.dao;


import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.bo.EventsFilter;
import com.mmm.podobri.model.Activity;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.User;


@Repository
@Transactional
public class EventDaoImpl
    extends BaseDaoImpl<Event>
    implements EventDao
{

    public EventDaoImpl()
    {
        setClazz(Event.class);
    }


    @SuppressWarnings("unchecked")
    @Override
    public List<Event> search(EventsFilter filter)
    {
        byte category = filter.getCategoryId();
        byte opportunityId = filter.getOpportunityId();
        List<Activity> activities = filter.getActivities();
        Date startFrom = filter.getStartDate();
        Date deadline = filter.getDeadline();
        byte countryId = filter.getCountryId();
        int cityId = filter.getCityId();
        byte costTypeId = filter.getCostTypeId();
        Criteria criteria = getCurrentSession().createCriteria(Event.class);

        if (category != -1)
        {
            criteria.add(Restrictions.eq("opportunityCategory.id", category));
        }

        if (opportunityId != -1)
        {
            criteria.add(Restrictions.eq("opportunity.id", opportunityId));
        }

        if (countryId != -1)
        {
            criteria.add(Restrictions.eq("country.id", countryId));
        }

        if (cityId != -1)
        {
            criteria.add(Restrictions.eq("city.id", cityId));
        }

        if (costTypeId != -1)
        {
            criteria.add(Restrictions.eq("eventCostType.id", costTypeId));
        }

        if (startFrom != null)
        {
            criteria.add(Restrictions.ge("dateFrom", startFrom));
        }

        if (deadline != null)
        {
            criteria.add(Restrictions.le("deadline", deadline));
        }

        if (activities != null && !activities.isEmpty())
        {
            Byte[] activityIds = new Byte[activities.size()];
            int t = 0;
            for (Activity a : activities)
            {
                activityIds[t++] = a.getId();
            }
            criteria.createAlias("eventsActivities",
                                 "event_activities",
                                 JoinType.LEFT_OUTER_JOIN,
                                 Restrictions.in("activityId", activityIds));
        }

        List<Event> result = criteria.list();
        return result;
    }


    @SuppressWarnings("unchecked")
    @Override
    public List<Event> findEventsByOrganizator(int userId)
    {
        Query query = getCurrentSession().createQuery("from Event e where e.user.id = ?");
        query.setParameter(0, userId);
        List<Event> events = query.list();
        return events;
    }


    @SuppressWarnings("unchecked")
    @Override
    public List<Event> findEventsByParticipant(User user)
    {
        Criteria criteria = getCurrentSession().createCriteria(Event.class);
        criteria.createAlias("eventsParticipants",
                             "event_participants",
                             JoinType.LEFT_OUTER_JOIN,
                             Restrictions.eq("userId", user.getId()));
        List<Event> result = criteria.list();
        return result;
    }
}
