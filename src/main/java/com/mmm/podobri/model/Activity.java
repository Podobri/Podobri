package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the activities database table.
 */
@Entity
@Table(name = "activities")
@NamedQuery(name = "Activity.findAll", query = "SELECT a FROM Activity a")
public class Activity
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private byte id;

    @Column(nullable = false, length = 45)
    private String type;

    // bi-directional many-to-many association to Event
    @ManyToMany(mappedBy = "activities")
    private List<Event> events;

    // bi-directional many-to-many association to User
    @ManyToMany(mappedBy = "activities")
    private List<User> users;


    public Activity()
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


    public List<Event> getEvents()
    {
        return this.events;
    }


    public void setEvents(List<Event> events)
    {
        this.events = events;
    }


    public List<User> getUsers()
    {
        return this.users;
    }


    public void setUsers(List<User> users)
    {
        this.users = users;
    }
}
