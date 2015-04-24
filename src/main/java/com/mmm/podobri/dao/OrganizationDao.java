package com.mmm.podobri.dao;

import java.util.List;

import com.mmm.podobri.bo.OrganizationsFilter;
import com.mmm.podobri.model.Organization;

public interface OrganizationDao extends BaseDao<Organization>
{
	public List<Organization> searchOrganization(OrganizationsFilter filter);
}
