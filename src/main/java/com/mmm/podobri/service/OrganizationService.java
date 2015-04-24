package com.mmm.podobri.service;

import java.util.List;

import com.mmm.podobri.bo.OrganizationsFilter;
import com.mmm.podobri.model.Organization;

public interface OrganizationService extends BaseDaoServices<Organization>
{
	public List<Organization> searchOrganization(OrganizationsFilter filter);
}
