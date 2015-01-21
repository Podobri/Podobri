package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the events_participants database table.
 */
@Entity
@Table(name = "events_participants")
@NamedQuery(name = "EventsParticipant.findAll", query = "SELECT e FROM EventsParticipant e")
public class EventsParticipant
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "event_id", insertable = false, updatable = false, unique = false, nullable = false)
    private String eventId;

    @Id
    @Column(name = "user_id", insertable = false, updatable = false, unique = false, nullable = false)
    private int userId;

    @Column(nullable = false)
    private byte status;

    // bi-directional many-to-one association to Event
    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false, insertable = false, updatable = false)
    private Event event;

    // bi-directional many-to-one association to Individual
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
    private Individual individual;


    public EventsParticipant()
    {}


    public String getEventId()
    {
        return this.eventId;
    }


    public void setEventId(String eventId)
    {
        this.eventId = eventId;
    }


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
    }


    public byte getStatus()
    {
        return this.status;
    }


    public void setStatus(byte status)
    {
        this.status = status;
    }


    public Event getEvent()
    {
        return this.event;
    }


    public void setEvent(Event event)
    {
        this.event = event;
    }


    public Individual getIndividual()
    {
        return this.individual;
    }


    public void setIndividual(Individual individual)
    {
        this.individual = individual;
    }


    public boolean equals(Object other)
    {
        if (this == other)
        {
            return true;
        }
        if (!(other instanceof EventsParticipant))
        {
            return false;
        }
        EventsParticipant castOther = (EventsParticipant)other;
        return this.eventId.equals(castOther.eventId) && (this.userId == castOther.userId);
    }


    public int hashCode()
    {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.eventId.hashCode();
        hash = hash * prime + this.userId;

        return hash;
    }
}
