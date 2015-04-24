/*
 * OrganizationsFilter.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;


public class OrganizationsFilter extends Filter
{
    private byte organizationTypeId;


    public OrganizationsFilter()
    {

    }


    public byte getOrganizationTypeId()
    {
        return organizationTypeId;
    }


    public void setOrganizationTypeId(byte organizationTypeId)
    {
        this.organizationTypeId = organizationTypeId;
    }
}
