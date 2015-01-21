package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the event_coorganizators database table.
 */
@Entity
@Table(name = "event_coorganizators")
@NamedQuery(name = "EventCoorganizator.findAll", query = "SELECT e FROM EventCoorganizator e")
public class EventCoorganizator
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private String id;

    @Column(length = 255)
    private String information;

    @Column(nullable = false, length = 45)
    private String name;

    @Column(length = 150)
    private String picture;

    // bi-directional many-to-one association to Event
    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    private Event event;

    // bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


    public EventCoorganizator()
    {}


    public String getId()
    {
        return this.id;
    }


    public void setId(String id)
    {
        this.id = id;
    }


    public String getInformation()
    {
        return this.information;
    }


    public void setInformation(String information)
    {
        this.information = information;
    }


    public String getName()
    {
        return this.name;
    }


    public void setName(String name)
    {
        this.name = name;
    }


    public String getPicture()
    {
        return this.picture;
    }


    public void setPicture(String picture)
    {
        this.picture = picture;
    }


    public Event getEvent()
    {
        return this.event;
    }


    public void setEvent(Event event)
    {
        this.event = event;
    }


    public User getUser()
    {
        return this.user;
    }


    public void setUser(User user)
    {
        this.user = user;
    }
}
