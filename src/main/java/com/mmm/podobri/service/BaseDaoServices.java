/*
 * BaseDaoServices.java
 *
 * created at 12.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;

import java.util.List;


public interface BaseDaoServices<T>
{
    public T findOne(final long id);
    public List<T> findAll();
    public void save(final T entity);
    public T update(final T entity);
    public void delete(final T entity);
    public void deleteById(final long id);
}



