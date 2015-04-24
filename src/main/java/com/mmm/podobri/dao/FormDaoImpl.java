package com.mmm.podobri.dao;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.model.OrganizationsForm;


@Repository
@Transactional
public class FormDaoImpl
    extends BaseDaoImpl<OrganizationsForm>
    implements FormDao
{
    public FormDaoImpl()
    {
        super(OrganizationsForm.class);
    }
    
    @Override
    public OrganizationsForm findOne(int organizationId, String name)
    {
        Query query = getCurrentSession().createQuery("from " + OrganizationsForm.class.getName() + " where userId = ? and name = ?");
        query.setParameter(0, organizationId);
        query.setParameter(1, name);
        OrganizationsForm form = (OrganizationsForm)query.uniqueResult();
        return form;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<OrganizationsForm> findAllByOrganization(int organizationId)
    {
        Query query = getCurrentSession().createQuery("from " + OrganizationsForm.class.getName() + " where userId = ?");
        query.setParameter(0, organizationId);
        List<OrganizationsForm> forms = query.list();
        return forms;
    }
}
