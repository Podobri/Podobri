package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;

import java.util.Date;
import java.util.List;


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

    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "organization"))
    @GeneratedValue(generator = "generator")
    @Id
    @Column(name = "user_id", insertable = false, updatable = false, unique = false, nullable = false)
    private int userId;

    @Id
    @Column(unique = false, nullable = false, length = 45)
    private String name;

    @Column(name = "form")
    @Lob
    private String form;

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
    @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
    private Organization organization;

    // bi-directional many-to-one association to OrganizationsForm
    @OneToMany(mappedBy = "form")
    private List<Event> events;


    public OrganizationsForm()
    {}


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
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


    public String getForm()
    {
        return form;
    }


    public void setForm(String form)
    {
        this.form = form;
    }


    public List<Event> getEvents()
    {
        return events;
    }


    public void setEvents(List<Event> events)
    {
        this.events = events;
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
        return (this.userId == castOther.userId) && this.name.equals(castOther.name);
    }


    public int hashCode()
    {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.userId;
        hash = hash * prime + this.name.hashCode();

        return hash;
    }

}
