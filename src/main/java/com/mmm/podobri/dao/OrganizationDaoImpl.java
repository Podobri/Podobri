package com.mmm.podobri.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.bo.OrganizationsFilter;
import com.mmm.podobri.model.Activity;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.Organization;


@Repository
@Transactional
public class OrganizationDaoImpl
    extends BaseDaoImpl<Organization>
    implements OrganizationDao
{
    public OrganizationDaoImpl()
    {
        super(Organization.class);
    }


    @Override
    public List<Organization> searchOrganization(OrganizationsFilter filter)
    {
        byte organizationTypeId = filter.getOrganizationTypeId();
        List<Activity> activities = filter.getActivities();
        byte countryId = filter.getCountryId();
        int cityId = filter.getCityId();
        Criteria criteria = getCurrentSession().createCriteria(Event.class);
        
        if (organizationTypeId != -1)
        {
            criteria.add(Restrictions.eq("organizationsType", organizationTypeId));
        }
        
        if (countryId != -1)
        {
            criteria.add(Restrictions.eq("country.id", countryId));
        }

        if (cityId != -1)
        {
            criteria.add(Restrictions.eq("city.id", cityId));
        }
        
        if (activities != null && !activities.isEmpty())
        {
            Byte[] activityIds = new Byte[activities.size()];
            int t = 0;
            for (Activity a : activities)
            {
                if (a != null)
                {
                    activityIds[t++] = a.getId();
                }
            }
            criteria.createAlias("user.usersActivities",
                                 "user.user_activities",
                                 JoinType.LEFT_OUTER_JOIN,
                                 Restrictions.in("activityId", activityIds));
        }

        @SuppressWarnings("unchecked")
        List<Organization> result = criteria.list();
        return result;
    }
}
