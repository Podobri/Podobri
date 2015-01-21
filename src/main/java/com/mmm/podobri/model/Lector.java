package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the lectors database table.
 */
@Entity
@Table(name = "lectors")
@NamedQuery(name = "Lector.findAll", query = "SELECT l FROM Lector l")
public class Lector
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private int id;

    @Column(name = "events_participations")
    private int eventsParticipations;

    @Column(name = "first_name", nullable = false, length = 30)
    private String firstName;

    @Column(length = 255)
    private String information;

    @Column(length = 45)
    private String job;

    @Column(name = "last_name", nullable = false, length = 30)
    private String lastName;

    @Column(length = 150)
    private String picture;

    // bi-directional many-to-many association to Event
    @ManyToMany(mappedBy = "lectors")
    private List<Event> events;

    // bi-directional many-to-many association to EventsProgram
    @ManyToMany(mappedBy = "lectors")
    private List<EventsProgram> eventsPrograms;

    // bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


    public Lector()
    {}


    public int getId()
    {
        return this.id;
    }


    public void setId(int id)
    {
        this.id = id;
    }


    public int getEventsParticipations()
    {
        return this.eventsParticipations;
    }


    public void setEventsParticipations(int eventsParticipations)
    {
        this.eventsParticipations = eventsParticipations;
    }


    public String getFirstName()
    {
        return this.firstName;
    }


    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }


    public String getInformation()
    {
        return this.information;
    }


    public void setInformation(String information)
    {
        this.information = information;
    }


    public String getJob()
    {
        return this.job;
    }


    public void setJob(String job)
    {
        this.job = job;
    }


    public String getLastName()
    {
        return this.lastName;
    }


    public void setLastName(String lastName)
    {
        this.lastName = lastName;
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


    public List<EventsProgram> getEventsPrograms()
    {
        return this.eventsPrograms;
    }


    public void setEventsPrograms(List<EventsProgram> eventsPrograms)
    {
        this.eventsPrograms = eventsPrograms;
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
