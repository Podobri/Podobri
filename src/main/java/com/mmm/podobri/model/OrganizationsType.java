package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the organizations_types database table.
 */
@Entity
@Table(name = "organizations_types")
@NamedQuery(name = "OrganizationsType.findAll", query = "SELECT o FROM OrganizationsType o")
public class OrganizationsType
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private byte id;

    @Column(nullable = false, length = 45)
    private String type;

    // bi-directional many-to-one association to Organization
    @OneToMany(mappedBy = "organizationsType")
    private List<Organization> organizations;


    public OrganizationsType()
    {}


    public byte getId()
    {
        return this.id;
    }


    public void setId(byte id)
    {
        this.id = id;
    }


    public String getType()
    {
        return this.type;
    }


    public void setType(String type)
    {
        this.type = type;
    }


    public List<Organization> getOrganizations()
    {
        return this.organizations;
    }


    public void setOrganizations(List<Organization> organizations)
    {
        this.organizations = organizations;
    }


    public Organization addOrganization(Organization organization)
    {
        getOrganizations().add(organization);
        organization.setOrganizationsType(this);

        return organization;
    }


    public Organization removeOrganization(Organization organization)
    {
        getOrganizations().remove(organization);
        organization.setOrganizationsType(null);

        return organization;
    }

}
