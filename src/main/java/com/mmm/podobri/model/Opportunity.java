package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the opportunities database table.
 */
@Entity
@Table(name = "opportunities")
@NamedQuery(name = "Opportunity.findAll", query = "SELECT o FROM Opportunity o")
public class Opportunity
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private byte id;

    @Column(nullable = false, length = 45)
    private String opportunity;

    // bi-directional many-to-one association to Event
    @OneToMany(mappedBy = "opportunity")
    private List<Event> events;

    // bi-directional many-to-one association to OpportunityCategory
    @ManyToOne
    @JoinColumn(name = "opportunity_categories_id", nullable = false)
    private OpportunityCategory opportunityCategory;


    public Opportunity()
    {}


    public byte getId()
    {
        return this.id;
    }


    public void setId(byte id)
    {
        this.id = id;
    }


    public String getOpportunity()
    {
        return this.opportunity;
    }


    public void setOpportunity(String opportunity)
    {
        this.opportunity = opportunity;
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
        event.setOpportunity(this);

        return event;
    }


    public Event removeEvent(Event event)
    {
        getEvents().remove(event);
        event.setOpportunity(null);

        return event;
    }


    public OpportunityCategory getOpportunityCategory()
    {
        return this.opportunityCategory;
    }


    public void setOpportunityCategory(OpportunityCategory opportunityCategory)
    {
        this.opportunityCategory = opportunityCategory;
    }

}
