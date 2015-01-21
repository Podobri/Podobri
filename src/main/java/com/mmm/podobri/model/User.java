package com.mmm.podobri.model;


import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 * The persistent class for the users database table.
 */
@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private int id;

    @Column(nullable = false, length = 70)
    @org.hibernate.validator.constraints.Email
    private String email;

    @Column(name = "facebook_fid")
    private BigInteger facebookFid;

    @Column(name = "google_fid")
    private BigInteger googleFid;

    @Column(name = "linkedin_fid")
    private BigInteger linkedinFid;

    @Column(nullable = false, length = 45)
    private String password;

    @Column(nullable = false, length = 15)
    private String status;

    @Column(nullable = false, length = 70)
    private String username;

    // bi-directional many-to-one association to EventCoorganizator
    @OneToMany(mappedBy = "user")
    private List<EventCoorganizator> eventCoorganizators = new ArrayList<EventCoorganizator>();

    // bi-directional many-to-one association to Event
    @OneToMany(mappedBy = "user")
    private List<Event> events1 = new ArrayList<Event>();

    // bi-directional one-to-one association to Individual
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Individual individual;

    // bi-directional many-to-one association to Lector
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Lector> lectors = new ArrayList<Lector>();

    // bi-directional one-to-one association to Organization
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Organization organization;

    // bi-directional many-to-one association to Sponsor
    @OneToMany(mappedBy = "user")
    private List<Sponsor> sponsors = new ArrayList<Sponsor>();

    // bi-directional one-to-one association to UserInfo
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private UserInfo userInfo;

    // bi-directional many-to-many association to Activity
    @ManyToMany
    @JoinTable(name = "users_activities", joinColumns = {@JoinColumn(name = "user_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "activity_id", nullable = false)})
    private List<Activity> activities = new ArrayList<Activity>();

    // bi-directional many-to-many association to Event
    @ManyToMany
    @JoinTable(name = "users_events", joinColumns = {@JoinColumn(name = "user_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "event_id", nullable = false)})
    private List<Event> events2 = new ArrayList<Event>();

    // bi-directional many-to-one association to UsersActivity
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<UsersActivity> usersActivities = new ArrayList<UsersActivity>();

    // bi-directional many-to-many association to Activity
    @ManyToMany
    @JoinTable(name = "users_roles", joinColumns = {@JoinColumn(name = "user_id", nullable = false)}, inverseJoinColumns = {@JoinColumn(name = "role_id", nullable = false)})
    private List<Role> roles = new ArrayList<Role>();

    // bi-directional many-to-one association to UsersActivity
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<UsersRole> usersRoles = new ArrayList<UsersRole>();

    @Transient
    private String confirmedPassword;


    public User()
    {}


    public int getId()
    {
        return this.id;
    }


    public void setId(int id)
    {
        this.id = id;
    }


    public String getEmail()
    {
        return this.email;
    }


    public void setEmail(String email)
    {
        this.email = email;
    }


    public BigInteger getFacebookFid()
    {
        return this.facebookFid;
    }


    public void setFacebookFid(BigInteger facebookFid)
    {
        this.facebookFid = facebookFid;
    }


    public BigInteger getGoogleFid()
    {
        return this.googleFid;
    }


    public void setGoogleFid(BigInteger googleFid)
    {
        this.googleFid = googleFid;
    }


    public BigInteger getLinkedinFid()
    {
        return this.linkedinFid;
    }


    public void setLinkedinFid(BigInteger linkedinFid)
    {
        this.linkedinFid = linkedinFid;
    }


    public String getPassword()
    {
        return this.password;
    }


    public void setPassword(String password)
    {
        this.password = password;
    }


    public String getStatus()
    {
        return this.status;
    }


    public void setStatus(String status)
    {
        this.status = status;
    }


    public String getUsername()
    {
        return this.username;
    }


    public void setUsername(String username)
    {
        this.username = username;
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
        eventCoorganizator.setUser(this);

        return eventCoorganizator;
    }


    public EventCoorganizator removeEventCoorganizator(EventCoorganizator eventCoorganizator)
    {
        getEventCoorganizators().remove(eventCoorganizator);
        eventCoorganizator.setUser(null);

        return eventCoorganizator;
    }


    public List<Event> getEvents1()
    {
        return this.events1;
    }


    public void setEvents1(List<Event> events1)
    {
        this.events1 = events1;
    }


    public Event addEvents1(Event events1)
    {
        getEvents1().add(events1);
        events1.setUser(this);

        return events1;
    }


    public Event removeEvents1(Event events1)
    {
        getEvents1().remove(events1);
        events1.setUser(null);

        return events1;
    }


    public Individual getIndividual()
    {
        return this.individual;
    }


    public void setIndividual(Individual individual)
    {
        this.individual = individual;
    }


    public List<Lector> getLectors()
    {
        return this.lectors;
    }


    public void setLectors(List<Lector> lectors)
    {
        this.lectors = lectors;
    }


    public Lector addLector(Lector lector)
    {
        getLectors().add(lector);
        lector.setUser(this);

        return lector;
    }


    public Lector removeLector(Lector lector)
    {
        getLectors().remove(lector);
        lector.setUser(null);

        return lector;
    }


    public Organization getOrganization()
    {
        return this.organization;
    }


    public void setOrganization(Organization organization)
    {
        this.organization = organization;
    }


    public List<Sponsor> getSponsors()
    {
        return this.sponsors;
    }


    public void setSponsors(List<Sponsor> sponsors)
    {
        this.sponsors = sponsors;
    }


    public Sponsor addSponsor(Sponsor sponsor)
    {
        getSponsors().add(sponsor);
        sponsor.setUser(this);

        return sponsor;
    }


    public Sponsor removeSponsor(Sponsor sponsor)
    {
        getSponsors().remove(sponsor);
        sponsor.setUser(null);

        return sponsor;
    }


    public UserInfo getUserInfo()
    {
        return this.userInfo;
    }


    public void setUserInfo(UserInfo userInfo)
    {
        this.userInfo = userInfo;
    }


    public List<Activity> getActivities()
    {
        return this.activities;
    }


    public void setActivities(List<Activity> activities)
    {
        this.activities = activities;
    }


    public List<Event> getEvents2()
    {
        return this.events2;
    }


    public void setEvents2(List<Event> events2)
    {
        this.events2 = events2;
    }


    public List<UsersActivity> getUsersActivities()
    {
        return this.usersActivities;
    }


    public void setUsersActivities(List<UsersActivity> usersActivities)
    {
        this.usersActivities = usersActivities;
    }


    public UsersActivity addUsersActivity(UsersActivity usersActivity)
    {
        getUsersActivities().add(usersActivity);
        usersActivity.setUser(this);

        return usersActivity;
    }


    public UsersActivity removeUsersActivity(UsersActivity usersActivity)
    {
        getUsersActivities().remove(usersActivity);
        usersActivity.setUser(null);

        return usersActivity;
    }


    public void setConfirmedPassword(String pass)
    {
        this.confirmedPassword = pass;
    }


    public String getConfirmedPassword()
    {
        return this.confirmedPassword;
    }


    public List<Role> getRoles()
    {
        return this.roles;
    }


    public void setRoles(List<Role> roles)
    {
        this.roles = roles;
    }


    public List<UsersRole> getUsersRoles()
    {
        return this.usersRoles;
    }


    public void setUsersRoles(List<UsersRole> usersRoles)
    {
        this.usersRoles = usersRoles;
    }


    public UsersRole addUsersRole(UsersRole usersRole)
    {
        getUsersRoles().add(usersRole);
        usersRole.setUser(this);
        return usersRole;
    }


    public UsersRole removeUsersRole(UsersRole usersRole)
    {
        getUsersRoles().remove(usersRole);
        usersRole.setUser(null);
        return usersRole;
    }
}
