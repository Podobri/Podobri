package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the opportunity_categories database table.
 */
@Entity
@Table(name = "opportunity_categories")
@NamedQuery(name = "OpportunityCategory.findAll", query = "SELECT o FROM OpportunityCategory o")
public class OpportunityCategory
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private byte id;

    @Column(nullable = false, length = 45)
    private String category;

    // bi-directional many-to-one association to Event
    @OneToMany(mappedBy = "opportunityCategory")
    private List<Event> events;

    // bi-directional many-to-one association to Opportunity
    @OneToMany(mappedBy = "opportunityCategory")
    private List<Opportunity> opportunities;


    public OpportunityCategory()
    {}


    public byte getId()
    {
        return this.id;
    }


    public void setId(byte id)
    {
        this.id = id;
    }


    public String getCategory()
    {
        return this.category;
    }


    public void setCategory(String category)
    {
        this.category = category;
    }


    public List<Event> getEvents()
    {
        return this.events;
    }


    public void setEvents(List<Event> events)
    {
        this.events = events;
    }


    public Event addEvent(Event event)
    {
        getEvents().add(event);
        event.setOpportunityCategory(this);

        return event;
    }


    public Event removeEvent(Event event)
    {
        getEvents().remove(event);
        event.setOpportunityCategory(null);

        return event;
    }


    public List<Opportunity> getOpportunities()
    {
        return this.opportunities;
    }


    public void setOpportunities(List<Opportunity> opportunities)
    {
        this.opportunities = opportunities;
    }


    public Opportunity addOpportunity(Opportunity opportunity)
    {
        getOpportunities().add(opportunity);
        opportunity.setOpportunityCategory(this);

        return opportunity;
    }


    public Opportunity removeOpportunity(Opportunity opportunity)
    {
        getOpportunities().remove(opportunity);
        opportunity.setOpportunityCategory(null);

        return opportunity;
    }

}
