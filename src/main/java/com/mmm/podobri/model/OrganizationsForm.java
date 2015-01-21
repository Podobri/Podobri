package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Date;


/**
 * The persistent class for the organizations_forms database table.
 */
@Entity
@Table(name = "organizations_forms")
@NamedQuery(name = "OrganizationsForm.findAll", query = "SELECT o FROM OrganizationsForm o")
public class OrganizationsForm
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "organization_id", insertable = false, updatable = false, unique = false, nullable = false)
    private int organizationId;

    @Id
    @Column(unique = false, nullable = false, length = 45)
    private String name;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date created;

    @Column(name = "is_active", nullable = false, columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isActive;

    @Column(nullable = false)
    private byte type;

    // bi-directional many-to-one association to Organization
    @ManyToOne
    @JoinColumn(name = "organization_id", nullable = false, insertable = false, updatable = false)
    private Organization organization;


    public OrganizationsForm()
    {}


    public int getOrganizationId()
    {
        return this.organizationId;
    }


    public void setOrganizationId(int organizationId)
    {
        this.organizationId = organizationId;
    }


    public String getName()
    {
        return this.name;
    }


    public void setName(String name)
    {
        this.name = name;
    }


    public Date getCreated()
    {
        return this.created;
    }


    public void setCreated(Date created)
    {
        this.created = created;
    }


    public boolean getIsActive()
    {
        return this.isActive;
    }


    public void setIsActive(boolean isActive)
    {
        this.isActive = isActive;
    }


    public byte getType()
    {
        return this.type;
    }


    public void setType(byte type)
    {
        this.type = type;
    }


    public Organization getOrganization()
    {
        return this.organization;
    }


    public void setOrganization(Organization organization)
    {
        this.organization = organization;
    }


    public boolean equals(Object other)
    {
        if (this == other)
        {
            return true;
        }
        if (!(other instanceof OrganizationsForm))
        {
            return false;
        }
        OrganizationsForm castOther = (OrganizationsForm)other;
        return (this.organizationId == castOther.organizationId) && this.name.equals(castOther.name);
    }


    public int hashCode()
    {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.organizationId;
        hash = hash * prime + this.name.hashCode();

        return hash;
    }

}
