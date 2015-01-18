/*
 * BaseDao.java
 *
 * created at 14.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.dao;

import java.util.List;


public interface BaseDao<T>
{
    public T findOne(final long id);
    public List<T> findAll();
    public void save(final T entity);
    public T update(final T entity);
    public void delete(final T entity);
    public void deleteById(final long id);
}



