/*
 * Utils.java
 *
 * created at 19.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.dao;


import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.model.Activity;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Education;
import com.mmm.podobri.model.Language;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.model.OrganizationsType;
import com.mmm.podobri.model.Role;


@Repository
@Transactional
public class DaoUtils
{
    @Autowired
    private SessionFactory sessionFactory;

    private static final Map<Integer, Role> rolesById = new HashMap<Integer, Role>();
    private static final Map<String, Role> rolesByName = new HashMap<String, Role>();
    private static final Map<Byte, Country> CountriesById = new HashMap<Byte, Country>();
    private static final Map<String, Country> CountriesByName = new HashMap<String, Country>();
    private static final Map<Integer, City> CitiesById = new HashMap<Integer, City>();
    private static final Map<String, City> CitiesByName = new HashMap<String, City>();
    private static final Map<Byte, Activity> ActivitiesById = new HashMap<Byte, Activity>();
    private static final Map<String, Activity> ActivitiesByName = new HashMap<String, Activity>();
    private static final Map<Byte, Education> EducationsById = new HashMap<Byte, Education>();
    private static final Map<String, Education> EducationsByName = new HashMap<String, Education>();
    private static final Map<Byte, Language> LanguagesById = new HashMap<Byte, Language>();
    private static final Map<String, Language> LanguagesByName = new HashMap<String, Language>();
    private static final Map<Byte, OpportunityCategory> OpportunityCategoriesById = new HashMap<Byte, OpportunityCategory>();
    private static final Map<String, OpportunityCategory> OpportunityCategoriesByName = new HashMap<String, OpportunityCategory>();
    private static final Map<Byte, OrganizationsType> OrganizationTypesById = new HashMap<Byte, OrganizationsType>();
    private static final Map<String, OrganizationsType> OrganizationTypesByName = new HashMap<String, OrganizationsType>();


//    @PostConstruct
//    private void init()
//    {
//        checkMaps();
//    }


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
    public List<Language> findAllLanguages()
    {
        return getCurrentSession().createQuery("from " + Language.class.getName()).list();
    }


    @SuppressWarnings("unchecked")
    public List<OpportunityCategory> findAllOpportunityTypes()
    {
        return getCurrentSession().createQuery("from " + OpportunityCategory.class.getName()).list();
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
        allData.put("contries", findAllCountries());
        allData.put("cities", findAllCities());
        allData.put("activities", findAllActivities());
        allData.put("educations", findAllEducations());
        allData.put("languages", findAllLanguages());
        allData.put("opportunityTypes", findAllOpportunityTypes());
        allData.put("organizationTypes", findAllOrganizationTypes());
        return allData;
    }


    public Activity getActivitiesById(Byte id)
    {
        checkMaps();
        return ActivitiesById.get(id);
    }


    public Activity getActivitiesByName(String name)
    {
        checkMaps();
        return ActivitiesByName.get(name);
    }


    public Country getCountriesById(Byte id)
    {
        checkMaps();
        return CountriesById.get(id);
    }


    public Country getCountriesByName(String name)
    {
        checkMaps();
        return CountriesByName.get(name);
    }


    public City getCitiesById(int id)
    {
        checkMaps();
        return CitiesById.get(id);
    }


    public City getCitiesByName(String name)
    {
        checkMaps();
        return CitiesByName.get(name);
    }


    public Education getEducationsById(Byte id)
    {
        checkMaps();
        return EducationsById.get(id);
    }


    public Education getEducationsByName(String name)
    {
        checkMaps();
        return EducationsByName.get(name);
    }


    public Language getLanguagesById(Byte id)
    {
        checkMaps();
        return LanguagesById.get(id);
    }


    public Language getLanguagesByName(String name)
    {
        checkMaps();
        return LanguagesByName.get(name);
    }


    public OpportunityCategory getOpportunitycategoriesById(Byte id)
    {
        checkMaps();
        return OpportunityCategoriesById.get(id);
    }


    public OpportunityCategory getOpportunitycategoriesByName(String name)
    {
        checkMaps();
        return OpportunityCategoriesByName.get(name);
    }


    public OrganizationsType getOrganizationtypesById(Byte id)
    {
        checkMaps();
        return OrganizationTypesById.get(id);
    }


    public OrganizationsType getOrganizationtypesByName(String name)
    {
        checkMaps();
        return OrganizationTypesByName.get(name);
    }


    public Role getRolesById(byte id)
    {
        checkMaps();
        return rolesById.get(id);
    }


    public Role getRolesByName(String name)
    {
        checkMaps();
        return rolesByName.get(name);
    }


    private void checkMaps()
    {
        if (rolesById.isEmpty() || rolesByName.isEmpty())
        {
            for (Role r : findAllRoles())
            {
                rolesById.put(r.getId(), r);
                rolesByName.put(r.getRoleName(), r);
            }
        }

        if (ActivitiesById.isEmpty() || ActivitiesByName.isEmpty())
        {
            for (Activity a : findAllActivities())
            {
                ActivitiesById.put(a.getId(), a);
                ActivitiesByName.put(a.getType(), a);
            }
        }

        if (CountriesById.isEmpty() || CountriesByName.isEmpty())
        {
            for (Country c : findAllCountries())
            {
                CountriesById.put(c.getId(), c);
                CountriesByName.put(c.getCountry(), c);
            }
        }

        if (CitiesById.isEmpty() || CitiesByName.isEmpty())
        {
            for (City c : findAllCities())
            {
                CitiesById.put(c.getId(), c);
                CitiesByName.put(c.getCity(), c);
            }
        }

        if (EducationsById.isEmpty() || EducationsByName.isEmpty())
        {
            for (Education e : findAllEducations())
            {
                EducationsById.put(e.getId(), e);
                EducationsByName.put(e.getEducation(), e);
            }
        }
        if (LanguagesById.isEmpty() || LanguagesByName.isEmpty())
        {
            for (Language l : findAllLanguages())
            {
                LanguagesById.put(l.getId(), l);
                LanguagesByName.put(l.getLanguage(), l);
            }
        }

        if (OpportunityCategoriesById.isEmpty() || OpportunityCategoriesByName.isEmpty())
        {
            for (OpportunityCategory o : findAllOpportunityTypes())
            {
                OpportunityCategoriesById.put(o.getId(), o);
                OpportunityCategoriesByName.put(o.getCategory(), o);
            }
        }

        if (OrganizationTypesById.isEmpty() || OrganizationTypesByName.isEmpty())
        {
            for (OrganizationsType o : findAllOrganizationTypes())
            {
                OrganizationTypesById.put(o.getId(), o);
                OrganizationTypesByName.put(o.getType(), o);
            }
        }
    }
}
