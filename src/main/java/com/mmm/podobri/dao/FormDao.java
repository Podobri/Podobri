package com.mmm.podobri.dao;


import java.util.List;

import com.mmm.podobri.model.OrganizationsForm;


public interface FormDao
    extends BaseDao<OrganizationsForm>
{
    public OrganizationsForm findOne(int organizationId, String name);
    public List<OrganizationsForm> findAllByOrganization(int organizationId);
}
