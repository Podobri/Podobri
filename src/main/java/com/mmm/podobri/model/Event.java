package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Type;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the events database table.
 */
@Entity
@Table(name = "events")
@NamedQuery(name = "Event.findAll", query = "SELECT e FROM Event e")
public class Event
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private Integer id;

    @Column(name = "additional_info", length = 255)
    private String additionalInfo;

    @Column(length = 45)
    private String address;

    @Temporal(TemporalType.TIMESTAMP)
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_from")
    private Date dateFrom;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_to")
    private Date dateTo;

    @Temporal(TemporalType.TIMESTAMP)
    private Date deadline;

    @Column(nullable = false)
    private String description;

    @Column(length = 45)
    private String facebook;

    @Column(name = "max_participants")
    private short maxParticipants;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date modified;

    @Column(nullable = false, length = 45)
    private String title;

    @Column(length = 150)
    private String picture;

    @Column(name = "recruit_coorganizators", columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean recruitCoorganizators;

    @Column(name = "require_applications")
    private boolean applicationFormRequire;

    @Column(nullable = false)
    private byte status;

    @Column(length = 45)
    private String website;

    // bi-directional many-to-one association to EventCoorganizator
    @OneToMany(mappedBy = "event")
    private List<EventCoorganizator> eventCoorganizators;

    // bi-directional many-to-many association to Activity
    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(name = "events_activities", joinColumns = {@JoinColumn(name = "event_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "activity_id", nullable = false)})
    private List<Activity> activities;

    // bi-directional many-to-one association to City
    @ManyToOne
    @JoinColumn(name = "city_id", nullable = false)
    private City city;

    // bi-directional many-to-one association to Country
    @ManyToOne
    @JoinColumn(name = "country_id", nullable = false)
    private Country country;

    // bi-directional many-to-one association to EventCostType
    @ManyToOne
    @JoinColumn(name = "event_cost_types_id")
    private EventCostType eventCostType;

    // bi-directional many-to-many association to Lector
    @ManyToMany(cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(name = "events_lectors", joinColumns = {@JoinColumn(name = "event_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "lector_id", nullable = false)})
    private List<Lector> lectors;

    // bi-directional many-to-one association to Opportunity
    @ManyToOne
    @JoinColumn(name = "opportunity_id", nullable = false)
    private Opportunity opportunity;

    // bi-directional many-to-one association to OpportunityCategory
    @ManyToOne
    @JoinColumn(name = "opportunity_categories_id", nullable = false)
    private OpportunityCategory opportunityCategory;

    // bi-directional many-to-many association to Sponsor
    @ManyToMany(cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(name = "events_sponsors", joinColumns = {@JoinColumn(name = "event_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "sponsor_id", nullable = false)})
    private List<Sponsor> sponsors;

    // bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // bi-directional many-to-one association to EventsActivity
    @OneToMany(mappedBy = "event")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EventsActivity> eventsActivities;

    // bi-directional many-to-one association to EventsParticipant
    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EventsParticipant> eventsParticipants;

    // bi-directional many-to-one association to EventsProgram
    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EventsProgram> eventsPrograms;

    // bi-directional many-to-many association to User
    @ManyToMany(mappedBy = "events2")
    private List<User> users;

    // // bi-directional many-to-one association to Organization
    @ManyToOne
    @JoinColumns(value = {@JoinColumn(name = "organization_id", referencedColumnName = "user_id"),
                          @JoinColumn(name = "form_name", referencedColumnName = "name")})
    private OrganizationsForm form;

    @Transient
    private CommonsMultipartFile pictureFile;


    public Event()
    {}


    public Integer getId()
    {
        return this.id;
    }


    public void setId(Integer id)
    {
        this.id = id;
    }


    public String getAdditionalInfo()
    {
        return this.additionalInfo;
    }


    public void setAdditionalInfo(String additionalInfo)
    {
        this.additionalInfo = additionalInfo;
    }


    public String getAddress()
    {
        return this.address;
    }


    public void setAddress(String address)
    {
        this.address = address;
    }


    public Date getCreated()
    {
        return this.created;
    }


    public void setCreated(Date created)
    {
        this.created = created;
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


    public Date getDeadline()
    {
        return this.deadline;
    }


    public void setDeadline(Date deadline)
    {
        this.deadline = deadline;
    }


    public String getDescription()
    {
        return this.description;
    }


    public void setDescription(String description)
    {
        this.description = description;
    }


    public String getFacebook()
    {
        return this.facebook;
    }


    public void setFacebook(String facebook)
    {
        this.facebook = facebook;
    }


    public short getMaxParticipants()
    {
        return this.maxParticipants;
    }


    public void setMaxParticipants(short maxParticipants)
    {
        this.maxParticipants = maxParticipants;
    }


    public Date getModified()
    {
        return this.modified;
    }


    public void setModified(Date modified)
    {
        this.modified = modified;
    }


    public String getTitle()
    {
        return this.title;
    }


    public void setTitle(String title)
    {
        this.title = title;
    }


    public String getPicture()
    {
        return this.picture;
    }


    public void setPicture(String picture)
    {
        this.picture = picture;
    }


    public boolean getRecruitCoorganizators()
    {
        return this.recruitCoorganizators;
    }


    public void setRecruitCoorganizators(boolean recruitCoorganizators)
    {
        this.recruitCoorganizators = recruitCoorganizators;
    }


    public boolean getApplicationFormRequire()
    {
        return this.applicationFormRequire;
    }


    public void setApplicationFormRequire(boolean applicationFormRequire)
    {
        this.applicationFormRequire = applicationFormRequire;
    }


    public byte getStatus()
    {
        return this.status;
    }


    public void setStatus(byte status)
    {
        this.status = status;
    }


    public String getWebsite()
    {
        return this.website;
    }


    public void setWebsite(String website)
    {
        this.website = website;
    }


    public List<EventCoorganizator> getEventCoorganizators()
    {
        return this.eventCoorganizators;
    }


    public void setEventCoorganizators(List<EventCoorganizator> eventCoorganizators)
    {
        this.eventCoorganizators = eventCoorganizators;
    }


    public EventCoorganizator addEventCoorganizator(EventCoorganizator eventCoorganizator)
    {
        getEventCoorganizators().add(eventCoorganizator);
        eventCoorganizator.setEvent(this);

        return eventCoorganizator;
    }


    public EventCoorganizator removeEventCoorganizator(EventCoorganizator eventCoorganizator)
    {
        getEventCoorganizators().remove(eventCoorganizator);
        eventCoorganizator.setEvent(null);

        return eventCoorganizator;
    }


    public List<Activity> getActivities()
    {
        return this.activities;
    }


    public void setActivities(List<Activity> activities)
    {
        this.activities = activities;
    }


    public City getCity()
    {
        return this.city;
    }


    public void setCity(City city)
    {
        this.city = city;
    }


    public Country getCountry()
    {
        return this.country;
    }


    public void setCountry(Country country)
    {
        this.country = country;
    }


    public EventCostType getEventCostType()
    {
        return this.eventCostType;
    }


    public void setEventCostType(EventCostType eventCostType)
    {
        this.eventCostType = eventCostType;
    }


    public List<Lector> getLectors()
    {
        return this.lectors;
    }


    public void setLectors(List<Lector> lectors)
    {
        this.lectors = lectors;
    }


    public Opportunity getOpportunity()
    {
        return this.opportunity;
    }


    public void setOpportunity(Opportunity opportunity)
    {
        this.opportunity = opportunity;
    }


    public OpportunityCategory getOpportunityCategory()
    {
        return this.opportunityCategory;
    }


    public void setOpportunityCategory(OpportunityCategory opportunityCategory)
    {
        this.opportunityCategory = opportunityCategory;
    }


    public List<Sponsor> getSponsors()
    {
        return this.sponsors;
    }


    public void setSponsors(List<Sponsor> sponsors)
    {
        this.sponsors = sponsors;
    }


    public User getUser()
    {
        return this.user;
    }


    public void setUser(User user)
    {
        this.user = user;
    }


    public List<EventsActivity> getEventsActivities()
    {
        return this.eventsActivities;
    }


    public void setEventsActivities(List<EventsActivity> eventsActivities)
    {
        this.eventsActivities = eventsActivities;
    }


    public EventsActivity addEventsActivity(EventsActivity eventsActivity)
    {
        getEventsActivities().add(eventsActivity);
        eventsActivity.setEvent(this);

        return eventsActivity;
    }


    public EventsActivity removeEventsActivity(EventsActivity eventsActivity)
    {
        getEventsActivities().remove(eventsActivity);
        eventsActivity.setEvent(null);

        return eventsActivity;
    }


    public List<EventsParticipant> getEventsParticipants()
    {
        return this.eventsParticipants;
    }


    public void setEventsParticipants(List<EventsParticipant> eventsParticipants)
    {
        this.eventsParticipants = eventsParticipants;
    }


    public EventsParticipant addEventsParticipant(EventsParticipant eventsParticipant)
    {
        getEventsParticipants().add(eventsParticipant);
        eventsParticipant.setEvent(this);

        return eventsParticipant;
    }


    public EventsParticipant removeEventsParticipant(EventsParticipant eventsParticipant)
    {
        getEventsParticipants().remove(eventsParticipant);
        eventsParticipant.setEvent(null);

        return eventsParticipant;
    }


    public List<EventsProgram> getEventsPrograms()
    {
        return this.eventsPrograms;
    }


    public void setEventsPrograms(List<EventsProgram> eventsPrograms)
    {
        this.eventsPrograms = eventsPrograms;
    }


    public EventsProgram addEventsProgram(EventsProgram eventsProgram)
    {
        getEventsPrograms().add(eventsProgram);
        eventsProgram.setEvent(this);

        return eventsProgram;
    }


    public EventsProgram removeEventsProgram(EventsProgram eventsProgram)
    {
        getEventsPrograms().remove(eventsProgram);
        eventsProgram.setEvent(null);

        return eventsProgram;
    }


    public List<User> getUsers()
    {
        return this.users;
    }


    public void setUsers(List<User> users)
    {
        this.users = users;
    }


    public OrganizationsForm getForm()
    {
        return form;
    }


    public void setForm(OrganizationsForm form)
    {
        this.form = form;
    }


    public CommonsMultipartFile getPictureFile()
    {
        return pictureFile;
    }


    public void setPictureFile(CommonsMultipartFile pictureFile)
    {
        this.pictureFile = pictureFile;
    }
}
