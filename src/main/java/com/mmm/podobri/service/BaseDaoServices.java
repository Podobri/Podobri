/*
 * BaseDaoServices.java
 *
 * created at 12.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;

import java.io.Serializable;
import java.util.List;

import com.mmm.podobri.dao.DaoUtils;


public interface BaseDaoServices<T>
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



