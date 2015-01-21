package com.mmm.podobri.model;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;


/**
 * The persistent class for the organizations database table.
 */
@Entity
@Table(name = "organizations")
@NamedQuery(name = "Organization.findAll", query = "SELECT o FROM Organization o")
public class Organization
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "user"))
    @GeneratedValue(generator = "generator")
    @Id
    @Column(name = "user_id", unique = true, nullable = false)
    private int userId;

    @Column(nullable = false, length = 45)
    private String address;

    @Column(nullable = false, length = 45)
    private String name;

    @Column(length = 20)
    private String phone;

    @Column(columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean recruiter;

    // bi-directional many-to-many association to Individual
    @ManyToMany
    @JoinTable(name = "organizations_likes", joinColumns = {@JoinColumn(name = "organization_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "user_id", nullable = false)})
    private List<Individual> individuals;

    // bi-directional many-to-one association to OrganizationsType
    @ManyToOne
    @JoinColumn(name = "organizations_types_id", nullable = false)
    private OrganizationsType organizationsType;

    @OneToOne(optional = false)
    @PrimaryKeyJoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    // bi-directional many-to-one association to OrganizationsForm
    @OneToMany(mappedBy = "organization")
    private List<OrganizationsForm> organizationsForms;


    public Organization()
    {}


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
    }


    public String getAddress()
    {
        return this.address;
    }


    public void setAddress(String address)
    {
        this.address = address;
    }


    public String getName()
    {
        return this.name;
    }


    public void setName(String name)
    {
        this.name = name;
    }


    public String getPhone()
    {
        return this.phone;
    }


    public void setPhone(String phone)
    {
        this.phone = phone;
    }


    public boolean getRecruiter()
    {
        return this.recruiter;
    }


    public void setRecruiter(boolean recruiter)
    {
        this.recruiter = recruiter;
    }


    public List<Individual> getIndividuals()
    {
        return this.individuals;
    }


    public void setIndividuals(List<Individual> individuals)
    {
        this.individuals = individuals;
    }


    public OrganizationsType getOrganizationsType()
    {
        return this.organizationsType;
    }


    public void setOrganizationsType(OrganizationsType organizationsType)
    {
        this.organizationsType = organizationsType;
    }


    public User getUser()
    {
        return this.user;
    }


    public void setUser(User user)
    {
        this.user = user;
    }


    public List<OrganizationsForm> getOrganizationsForms()
    {
        return this.organizationsForms;
    }


    public void setOrganizationsForms(List<OrganizationsForm> organizationsForms)
    {
        this.organizationsForms = organizationsForms;
    }


    public OrganizationsForm addOrganizationsForm(OrganizationsForm organizationsForm)
    {
        getOrganizationsForms().add(organizationsForm);
        organizationsForm.setOrganization(this);

        return organizationsForm;
    }


    public OrganizationsForm removeOrganizationsForm(OrganizationsForm organizationsForm)
    {
        getOrganizationsForms().remove(organizationsForm);
        organizationsForm.setOrganization(null);

        return organizationsForm;
    }
}
