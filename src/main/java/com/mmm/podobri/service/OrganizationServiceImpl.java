package com.mmm.podobri.service;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.bo.OrganizationsFilter;
import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.OrganizationDao;
import com.mmm.podobri.model.Organization;


@Service("organizationService")
@Transactional
public class OrganizationServiceImpl
    implements OrganizationService
{
    @Autowired
    public OrganizationDao organizationDao;


    @Override
    public Organization findOne(int id)
    {
        return organizationDao.findOne(id);
    }


    @Override
    public List<Organization> findAll()
    {
        return organizationDao.findAll();
    }


    @Override
    public void save(Organization entity)
    {
        organizationDao.save(entity);
    }


    @Override
    public Organization update(Organization entity)
    {
        return organizationDao.update(entity);
    }


    @Override
    public void delete(Organization entity)
    {
        organizationDao.delete(entity);
    }


    @Override
    public void deleteById(int id)
    {
        organizationDao.deleteById(id);
    }
    

    public DaoUtils getDaoUtils()
    {
        return organizationDao.getDaoUtils();
    }


    @Override
    public void saveInTransaction(Serializable... entities)
    {
        organizationDao.saveInTransaction(entities);
    }
    
    
    public List<Organization> searchOrganization(OrganizationsFilter filter)
    {
        return organizationDao.searchOrganization(filter);
    }
}
