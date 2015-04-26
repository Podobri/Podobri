/*
 * BaseDao.java
 *
 * created at 14.01.2015 �. by Mariyan
 */
package com.mmm.podobri.dao;

import java.io.Serializable;
import java.util.List;


public interface BaseDao<T>
{
    public T findOne(final int id);
    public List<T> findAll();
    public void save(final T entity);
    public T update(final T entity);
    public void delete(final T entity);
    public void deleteById(final int id);
    public DaoUtils getDaoUtils();
    public void saveInTransaction(Serializable... entities);
}



