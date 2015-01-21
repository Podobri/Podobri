package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the sponsors database table.
 */
@Entity
@Table(name = "sponsors")
@NamedQuery(name = "Sponsor.findAll", query = "SELECT s FROM Sponsor s")
public class Sponsor
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private int id;

    @Column(nullable = false, length = 45)
    private String name;

    @Column(length = 150)
    private String picture;

    // bi-directional many-to-many association to Event
    @ManyToMany(mappedBy = "sponsors")
    private List<Event> events;

    // bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


    public Sponsor()
    {}


    public int getId()
    {
        return this.id;
    }


    public void setId(int id)
    {
        this.id = id;
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


    public List<Event> getEvents()
    {
        return this.events;
    }


    public void setEvents(List<Event> events)
    {
        this.events = events;
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
