package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.Parameter;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the individuals database table.
 */
@Entity
@Table(name = "individuals")
@NamedQuery(name = "Individual.findAll", query = "SELECT i FROM Individual i")
public class Individual
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "user"))
    @GeneratedValue(generator = "generator")
    @Id
    @Column(name = "user_id", unique = true, nullable = false)
    private int userId;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date birthdate;

    @Column(name = "first_name", nullable = false, length = 30)
    private String firstName;

    @Column(name="is_male", nullable = false, columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean isMale;

    @Column(name = "last_name", nullable = false, length = 30)
    private String lastName;

    @Column(name = "recieve_newsletter_emails", columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean recieveNewsletterEmails;

    @Column(name = "recieve_newsletter_events", columnDefinition = "TINYINT")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean recieveNewsletterEvents;

    // bi-directional many-to-one association to EventsParticipant
    @OneToMany(mappedBy = "individual")
    private List<EventsParticipant> eventsParticipants;

    // bi-directional many-to-one association to Education
    @ManyToOne
    @JoinColumn(name = "education_id", nullable = false)
    private Education education;

    // bi-directional many-to-many association to Language
    @ManyToMany
    @JoinTable(name = "individuals_languages", joinColumns = {@JoinColumn(name = "user_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "language_id", nullable = false)})
    private List<Language> languages;

    @OneToOne(optional = false)
    @PrimaryKeyJoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    // bi-directional many-to-many association to Organization
    @ManyToMany(mappedBy = "individuals")
    private List<Organization> organizations;


    public Individual()
    {}


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
    }


    public Date getBirthdate()
    {
        return this.birthdate;
    }


    public void setBirthdate(Date birthdate)
    {
        this.birthdate = birthdate;
    }


    public String getFirstName()
    {
        return this.firstName;
    }


    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }


    public boolean getIsMale()
    {
        return this.isMale;
    }


    public void setIsMale(boolean isMale)
    {
        this.isMale = isMale;
    }


    public String getLastName()
    {
        return this.lastName;
    }


    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }


    public boolean getRecieveNewsletterEmails()
    {
        return this.recieveNewsletterEmails;
    }


    public void setRecieveNewsletterEmails(boolean recieveNewsletterEmails)
    {
        this.recieveNewsletterEmails = recieveNewsletterEmails;
    }


    public boolean getRecieveNewsletterEvents()
    {
        return this.recieveNewsletterEvents;
    }


    public void setRecieveNewsletterEvents(boolean recieveNewsletterEvents)
    {
        this.recieveNewsletterEvents = recieveNewsletterEvents;
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
        eventsParticipant.setIndividual(this);

        return eventsParticipant;
    }


    public EventsParticipant removeEventsParticipant(EventsParticipant eventsParticipant)
    {
        getEventsParticipants().remove(eventsParticipant);
        eventsParticipant.setIndividual(null);

        return eventsParticipant;
    }


    public Education getEducation()
    {
        return this.education;
    }


    public void setEducation(Education education)
    {
        this.education = education;
    }


    public List<Language> getLanguages()
    {
        return this.languages;
    }


    public void setLanguages(List<Language> languages)
    {
        this.languages = languages;
    }


    public User getUser()
    {
        return this.user;
    }


    public void setUser(User user)
    {
        this.user = user;
    }


    public List<Organization> getOrganizations()
    {
        return this.organizations;
    }


    public void setOrganizations(List<Organization> organizations)
    {
        this.organizations = organizations;
    }

}
