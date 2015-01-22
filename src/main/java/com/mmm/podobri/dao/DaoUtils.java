/*
 * Utils.java
 *
 * created at 19.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.dao;


import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.mmm.podobri.model.Activity;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Education;
import com.mmm.podobri.model.EventCostType;
import com.mmm.podobri.model.Language;
import com.mmm.podobri.model.Opportunity;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.model.OrganizationsType;
import com.mmm.podobri.model.Role;


@Repository
public class DaoUtils
{
    @Autowired
    private SessionFactory sessionFactory;

    private static final Map<Byte, Activity> activitiesById = new HashMap<Byte, Activity>();
    private static final Map<String, Activity> activitiesByName = new HashMap<String, Activity>();
    private static final Map<Byte, Country> countriesById = new HashMap<Byte, Country>();
    private static final Map<String, Country> countriesByName = new HashMap<String, Country>();
    private static final Map<Integer, City> citiesById = new HashMap<Integer, City>();
    private static final Map<String, City> citiesByName = new HashMap<String, City>();
    private static final Map<Byte, Education> educationsById = new HashMap<Byte, Education>();
    private static final Map<String, Education> educationsByName = new HashMap<String, Education>();
    private static final Map<Byte, EventCostType> eventCostTypesById = new HashMap<Byte, EventCostType>();
    private static final Map<String, EventCostType> eventCostTypesByName = new HashMap<String, EventCostType>();
    private static final Map<Byte, Language> languagesById = new HashMap<Byte, Language>();
    private static final Map<String, Language> languagesByName = new HashMap<String, Language>();
    private static final Map<Byte, OpportunityCategory> opportunityCategoriesById = new HashMap<Byte, OpportunityCategory>();
    private static final Map<String, OpportunityCategory> opportunityCategoriesByName = new HashMap<String, OpportunityCategory>();
    private static final Map<Byte, Opportunity> opportunitiesById = new HashMap<Byte, Opportunity>();
    private static final Map<String, Opportunity> opportunitiesByName = new HashMap<String, Opportunity>();
    private static final Map<Byte, OrganizationsType> organizationTypesById = new HashMap<Byte, OrganizationsType>();
    private static final Map<String, OrganizationsType> organizationTypesByName = new HashMap<String, OrganizationsType>();
    private static final Map<Integer, Role> rolesById = new HashMap<Integer, Role>();
    private static final Map<String, Role> rolesByName = new HashMap<String, Role>();


    @Autowired
    public void init(PlatformTransactionManager transactionManager)
    {
        new TransactionTemplate(transactionManager).execute(new TransactionCallback<Object>()
        {
            @Override
            public Object doInTransaction(TransactionStatus transactionStatus)
            {
                loadStaticData();
                return null;
            }
        });
    }


    protected final Session getCurrentSession()
    {
        return sessionFactory.getCurrentSession();
    }


    @SuppressWarnings("unchecked")
    public List<Activity> findAllActivities()
    {
        return getCurrentSession().createQuery("from " + Activity.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<Country> findAllCountries()
    {
        return getCurrentSession().createQuery("from " + Country.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<City> findAllCities()
    {
        return getCurrentSession().createQuery("from " + City.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<City> findAllCitiesByCountryId(byte id)
    {
        return getCurrentSession().createQuery("from " + City.class.getName() + " where country.id=?").setParameter(0, id).list();
    }


    @SuppressWarnings("unchecked")
    public List<City> findAllCitiesByCountryName(String name)
    {
        return getCurrentSession().createQuery("from " + City.class.getName() + " where country.country=?")
                                  .setParameter(0, name)
                                  .list();
    }


    @SuppressWarnings("unchecked")
    public List<Education> findAllEducations()
    {
        return getCurrentSession().createQuery("from " + Education.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<EventCostType> findAllEventCostTypes()
    {
        return getCurrentSession().createQuery("from " + EventCostType.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<Language> findAllLanguages()
    {
        return getCurrentSession().createQuery("from " + Language.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<OpportunityCategory> findAllOpportunityCategories()
    {
        return getCurrentSession().createQuery("from " + OpportunityCategory.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<Opportunity> findAllOpportunities()
    {
//        Criteria criteria = getCurrentSession().createCriteria(Opportunity.class);
//        criteria.setProjection(Projections.distinct(Projections.property("opportunity")));
//        return criteria.list();
        return getCurrentSession().createQuery("from " + Opportunity.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<OrganizationsType> findAllOrganizationTypes()
    {
        return getCurrentSession().createQuery("from " + OrganizationsType.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<Role> findAllRoles()
    {
        return getCurrentSession().createQuery("from " + Role.class.getName()).list();
    }


    public Map<String, List< ? extends Serializable>> findAll()
    {
        HashMap<String, List< ? extends Serializable>> allData = new HashMap<String, List< ? extends Serializable>>();
        allData.put("activitiesList", findAllActivities());
        allData.put("countriesList", findAllCountries());
        allData.put("citiesList", findAllCities());
        allData.put("educationsList", findAllEducations());
        allData.put("eventCostTypesList", findAllEventCostTypes());
        allData.put("languagesList", findAllLanguages());
        allData.put("opportunityCategoriesList", findAllOpportunityCategories());
        allData.put("opportunitiesList", findAllOpportunities());
        allData.put("organizationTypesList", findAllOrganizationTypes());
        return allData;
    }


    public Activity getActivitiesById(Byte id)
    {
        return activitiesById.get(id);
    }


    public Activity getActivitiesByName(String name)
    {
        return activitiesByName.get(name);
    }


    public Country getCountriesById(Byte id)
    {
        return countriesById.get(id);
    }


    public Country getCountriesByName(String name)
    {
        return countriesByName.get(name);
    }


    public City getCitiesById(int id)
    {
        return citiesById.get(id);
    }


    public City getCitiesByName(String name)
    {
        return citiesByName.get(name);
    }


    public Education getEducationsById(Byte id)
    {
        return educationsById.get(id);
    }


    public Education getEducationsByName(String name)
    {
        return educationsByName.get(name);
    }


    public EventCostType getEventCostTypeById(Byte id)
    {
        return eventCostTypesById.get(id);
    }


    public EventCostType getEventCostTypeByName(String name)
    {
        return eventCostTypesByName.get(name);
    }


    public Language getLanguagesById(Byte id)
    {
        return languagesById.get(id);
    }


    public Language getLanguagesByName(String name)
    {
        return languagesByName.get(name);
    }


    public OpportunityCategory getOpportunityCategoriesById(Byte id)
    {
        return opportunityCategoriesById.get(id);
    }


    public OpportunityCategory getOpportunityCategoriesByName(String name)
    {
        return opportunityCategoriesByName.get(name);
    }


    public Opportunity getOpportunitiesById(Byte id)
    {
        return opportunitiesById.get(id);
    }


    public Opportunity getOpportunitiesByName(String name)
    {
        return opportunitiesByName.get(name);
    }


    public OrganizationsType getOrganizationtypesById(Byte id)
    {
        return organizationTypesById.get(id);
    }


    public OrganizationsType getOrganizationtypesByName(String name)
    {
        return organizationTypesByName.get(name);
    }


    public Role getRolesById(byte id)
    {
        return rolesById.get(id);
    }


    public Role getRolesByName(String name)
    {
        return rolesByName.get(name);
    }


    public Collection<Activity> getAllActivities()
    {
        return activitiesById.values();
    }


    public Collection<Country> getAllCountries()
    {
        return countriesById.values();
    }


    public Collection<City> getAllCities()
    {
        return citiesById.values();
    }


    public Collection<Education> getAllEducations()
    {
        return educationsById.values();
    }


    public Collection<EventCostType> getAllEventCostTypes()
    {
        return eventCostTypesById.values();
    }


    public Collection<Language> getAllLanguages()
    {
        return languagesById.values();
    }


    public Collection<OpportunityCategory> getAllOpportunityCategories()
    {
        return opportunityCategoriesById.values();
    }


    public Collection<Opportunity> getAllOpportunities()
    {
        return opportunitiesById.values();
    }


    public Collection<OrganizationsType> getAllOrganizationTypes()
    {
        return organizationTypesById.values();
    }


    public Collection<Role> getAllRoles()
    {
        return rolesById.values();
    }


    private void loadStaticData()
    {
        if (activitiesById.isEmpty() || activitiesByName.isEmpty())
        {
            for (Activity a : findAllActivities())
            {
                activitiesById.put(a.getId(), a);
                activitiesByName.put(a.getType(), a);
            }
        }

        if (countriesById.isEmpty() || countriesByName.isEmpty())
        {
            for (Country c : findAllCountries())
            {
                countriesById.put(c.getId(), c);
                countriesByName.put(c.getCountry(), c);
            }
        }

        if (citiesById.isEmpty() || citiesByName.isEmpty())
        {
            for (City c : findAllCities())
            {
                citiesById.put(c.getId(), c);
                citiesByName.put(c.getCity(), c);
            }
        }

        if (educationsById.isEmpty() || educationsByName.isEmpty())
        {
            for (Education e : findAllEducations())
            {
                educationsById.put(e.getId(), e);
                educationsByName.put(e.getEducation(), e);
            }
        }

        if (eventCostTypesById.isEmpty() || eventCostTypesByName.isEmpty())
        {
            for (EventCostType e : findAllEventCostTypes())
            {
                eventCostTypesById.put(e.getId(), e);
                eventCostTypesByName.put(e.getCost(), e);
            }
        }

        if (languagesById.isEmpty() || languagesByName.isEmpty())
        {
            for (Language l : findAllLanguages())
            {
                languagesById.put(l.getId(), l);
                languagesByName.put(l.getLanguage(), l);
            }
        }

        if (opportunityCategoriesById.isEmpty() || opportunityCategoriesByName.isEmpty())
        {
            for (OpportunityCategory o : findAllOpportunityCategories())
            {
                opportunityCategoriesById.put(o.getId(), o);
                opportunityCategoriesByName.put(o.getCategory(), o);
            }
        }
        
        if (opportunitiesById.isEmpty() || opportunitiesByName.isEmpty())
        {
            for (Opportunity o : findAllOpportunities())
            {
                opportunitiesById.put(o.getId(), o);
                opportunitiesByName.put(o.getOpportunity(), o);
            }
        }

        if (organizationTypesById.isEmpty() || organizationTypesByName.isEmpty())
        {
            for (OrganizationsType o : findAllOrganizationTypes())
            {
                organizationTypesById.put(o.getId(), o);
                organizationTypesByName.put(o.getType(), o);
            }
        }

        if (rolesById.isEmpty() || rolesByName.isEmpty())
        {
            for (Role r : findAllRoles())
            {
                rolesById.put(r.getId(), r);
                rolesByName.put(r.getRoleName(), r);
            }
        }
    }
}
