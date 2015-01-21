package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the events_programs database table.
 */
@Entity
@Table(name = "events_programs")
@NamedQuery(name = "EventsProgram.findAll", query = "SELECT e FROM EventsProgram e")
public class EventsProgram
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private String id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_from")
    private Date dateFrom;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_to")
    private Date dateTo;

    @Lob
    private String information;

    @Column(nullable = false, length = 70)
    private String subject;

    // bi-directional many-to-one association to Event
    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    private Event event;

    // bi-directional many-to-many association to Lector
    @ManyToMany
    @JoinTable(name = "events_programs_lectors", joinColumns = {@JoinColumn(name = "events_program_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "lector_id", nullable = false)})
    private List<Lector> lectors;


    public EventsProgram()
    {}


    public String getId()
    {
        return this.id;
    }


    public void setId(String id)
    {
        this.id = id;
    }


    public Date getDateFrom()
    {
        return this.dateFrom;
    }


    public void setDateFrom(Date dateFrom)
    {
        this.dateFrom = dateFrom;
    }


    public Date getDateTo()
    {
        return this.dateTo;
    }


    public void setDateTo(Date dateTo)
    {
        this.dateTo = dateTo;
    }


    public String getInformation()
    {
        return this.information;
    }


    public void setInformation(String information)
    {
        this.information = information;
    }


    public String getSubject()
    {
        return this.subject;
    }


    public void setSubject(String subject)
    {
        this.subject = subject;
    }


    public Event getEvent()
    {
        return this.event;
    }


    public void setEvent(Event event)
    {
        this.event = event;
    }


    public List<Lector> getLectors()
    {
        return this.lectors;
    }


    public void setLectors(List<Lector> lectors)
    {
        this.lectors = lectors;
    }
}
