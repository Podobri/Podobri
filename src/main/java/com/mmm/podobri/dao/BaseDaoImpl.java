package com.mmm.podobri.dao;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public abstract class BaseDaoImpl<T extends Serializable> implements BaseDao<T>
{
    private final Class<T> clazz;

    @Autowired
    private SessionFactory sessionFactory;
    
    @Autowired
    private DaoUtils daoUtils;

    public BaseDaoImpl(Class<T> model)
    {
        clazz = model;
    }


    @SuppressWarnings("unchecked")
    public T findOne(final int id)
    {
        return (T)getCurrentSession().get(clazz, id);
    }


    @SuppressWarnings("unchecked")
    public List<T> findAll()
    {
        return getCurrentSession().createQuery("from " + clazz.getName()).list();
    }


    public void save(final T entity)
    {
        getCurrentSession().persist(entity);
    }


    @SuppressWarnings("unchecked")
    public T update(final T entity)
    {
        return (T)getCurrentSession().merge(entity);
    }


    public void delete(final T entity)
    {
        getCurrentSession().delete(entity);
    }


    public void deleteById(final int id)
    {
        final T entity = findOne(id);
        delete(entity);
    }


    protected final Session getCurrentSession()
    {
        return sessionFactory.getCurrentSession();
    }
    
    public DaoUtils getDaoUtils()
    {
        return daoUtils;
    }
    
    @Override
    public void saveInTransaction(Serializable... entities)
    {
        getCurrentSession().beginTransaction();
        for (final Serializable entity : entities)
        {
            getCurrentSession().save(entity);
        }
        getCurrentSession().getTransaction().commit();
    }
}
