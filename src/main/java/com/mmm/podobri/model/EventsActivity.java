package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the events_activities database table.
 */
@Entity
@Table(name = "events_activities")
@NamedQuery(name = "EventsActivity.findAll", query = "SELECT e FROM EventsActivity e")
public class EventsActivity
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "event_id", insertable = false, updatable = false, unique = false, nullable = false)
    private String eventId;

    @Id
    @Column(name = "activity_id", insertable = false, updatable = false, unique = false, nullable = false)
    private byte activityId;

    // bi-directional many-to-one association to Event
    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false, insertable = false, updatable = false)
    private Event event;


    public EventsActivity()
    {}


    public String getEventId()
    {
        return this.eventId;
    }


    public void setEventId(String eventId)
    {
        this.eventId = eventId;
    }


    public byte getActivityId()
    {
        return this.activityId;
    }


    public void setActivityId(byte activityId)
    {
        this.activityId = activityId;
    }


    public Event getEvent()
    {
        return this.event;
    }


    public void setEvent(Event event)
    {
        this.event = event;
    }


    public boolean equals(Object other)
    {
        if (this == other)
        {
            return true;
        }
        if (!(other instanceof EventsActivity))
        {
            return false;
        }
        EventsActivity castOther = (EventsActivity)other;
        return this.eventId.equals(castOther.eventId) && (this.activityId == castOther.activityId);
    }


    public int hashCode()
    {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.eventId.hashCode();
        hash = hash * prime + ((int)this.activityId);

        return hash;
    }
}
