package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the events database table.
 * 
 */
@Entity
@Table(name="events")
@NamedQuery(name="Event.findAll", query="SELECT e FROM Event e")
public class Event implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private String id;

	@Column(name="additional_info", length=255)
	private String additionalInfo;

	@Column(length=45)
	private String address;

	@Column(nullable=false)
	private Timestamp created;

	@Column(name="date_time_from", nullable=false)
	private Timestamp dateTimeFrom;

	@Column(name="date_time_to", nullable=false)
	private Timestamp dateTimeTo;

	@Column(nullable=false)
	private Timestamp deadline;

	@Column(nullable=false, length=255)
	private String description;

	@Column(length=45)
	private String facebook;

	@Column(name="max_participants")
	private short maxParticipants;

	@Column(nullable=false, length=45)
	private String name;

	@Lob
	private byte[] picture;

	@Column(name="recruit_coorganizators")
	private byte recruitCoorganizators;

	@Column(nullable=false)
	private byte status;

	@Column(length=45)
	private String website;

	//bi-directional many-to-one association to EventCoorganizator
	@OneToMany(mappedBy="event")
	private List<EventCoorganizator> eventCoorganizators;

	//bi-directional many-to-many association to ActivityType
	@ManyToMany
	@JoinTable(
		name="events_activities"
		, joinColumns={
			@JoinColumn(name="event_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="activity_id", nullable=false)
			}
		)
	private List<ActivityType> activityTypes;

	//bi-directional many-to-one association to City
	@ManyToOne
	@JoinColumn(name="city_id", nullable=false)
	private City city;

	//bi-directional many-to-one association to Country
	@ManyToOne
	@JoinColumn(name="country_id", nullable=false)
	private Country country;

	//bi-directional many-to-one association to EventCostType
	@ManyToOne
	@JoinColumn(name="cost_id")
	private EventCostType eventCostType;

	//bi-directional many-to-many association to Lector
	@ManyToMany
	@JoinTable(
		name="events_lectors"
		, joinColumns={
			@JoinColumn(name="event_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="lector_id", nullable=false)
			}
		)
	private List<Lector> lectors;

	//bi-directional many-to-one association to Opportunity
	@ManyToOne
	@JoinColumn(name="opportunity_id", nullable=false)
	private Opportunity opportunity;

	//bi-directional many-to-one association to OpportunityCategory
	@ManyToOne
	@JoinColumn(name="category_id", nullable=false)
	private OpportunityCategory opportunityCategory;

	//bi-directional many-to-many association to Sponsor
	@ManyToMany
	@JoinTable(
		name="events_sponsors"
		, joinColumns={
			@JoinColumn(name="event_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="sponsor_id", nullable=false)
			}
		)
	private List<Sponsor> sponsors;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="creator_id", nullable=false)
	private User user;

	//bi-directional many-to-one association to EventsParticipant
	@OneToMany(mappedBy="event")
	private List<EventsParticipant> eventsParticipants;

	//bi-directional many-to-one association to EventsProgram
	@OneToMany(mappedBy="event")
	private List<EventsProgram> eventsPrograms;

	//bi-directional many-to-many association to User
	@ManyToMany(mappedBy="events2")
	private List<User> users;

	public Event() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAdditionalInfo() {
		return this.additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Timestamp getDateTimeFrom() {
		return this.dateTimeFrom;
	}

	public void setDateTimeFrom(Timestamp dateTimeFrom) {
		this.dateTimeFrom = dateTimeFrom;
	}

	public Timestamp getDateTimeTo() {
		return this.dateTimeTo;
	}

	public void setDateTimeTo(Timestamp dateTimeTo) {
		this.dateTimeTo = dateTimeTo;
	}

	public Timestamp getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFacebook() {
		return this.facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public short getMaxParticipants() {
		return this.maxParticipants;
	}

	public void setMaxParticipants(short maxParticipants) {
		this.maxParticipants = maxParticipants;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getPicture() {
		return this.picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public byte getRecruitCoorganizators() {
		return this.recruitCoorganizators;
	}

	public void setRecruitCoorganizators(byte recruitCoorganizators) {
		this.recruitCoorganizators = recruitCoorganizators;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public List<EventCoorganizator> getEventCoorganizators() {
		return this.eventCoorganizators;
	}

	public void setEventCoorganizators(List<EventCoorganizator> eventCoorganizators) {
		this.eventCoorganizators = eventCoorganizators;
	}

	public EventCoorganizator addEventCoorganizator(EventCoorganizator eventCoorganizator) {
		getEventCoorganizators().add(eventCoorganizator);
		eventCoorganizator.setEvent(this);

		return eventCoorganizator;
	}

	public EventCoorganizator removeEventCoorganizator(EventCoorganizator eventCoorganizator) {
		getEventCoorganizators().remove(eventCoorganizator);
		eventCoorganizator.setEvent(null);

		return eventCoorganizator;
	}

	public List<ActivityType> getActivityTypes() {
		return this.activityTypes;
	}

	public void setActivityTypes(List<ActivityType> activityTypes) {
		this.activityTypes = activityTypes;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public EventCostType getEventCostType() {
		return this.eventCostType;
	}

	public void setEventCostType(EventCostType eventCostType) {
		this.eventCostType = eventCostType;
	}

	public List<Lector> getLectors() {
		return this.lectors;
	}

	public void setLectors(List<Lector> lectors) {
		this.lectors = lectors;
	}

	public Opportunity getOpportunity() {
		return this.opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public OpportunityCategory getOpportunityCategory() {
		return this.opportunityCategory;
	}

	public void setOpportunityCategory(OpportunityCategory opportunityCategory) {
		this.opportunityCategory = opportunityCategory;
	}

	public List<Sponsor> getSponsors() {
		return this.sponsors;
	}

	public void setSponsors(List<Sponsor> sponsors) {
		this.sponsors = sponsors;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<EventsParticipant> getEventsParticipants() {
		return this.eventsParticipants;
	}

	public void setEventsParticipants(List<EventsParticipant> eventsParticipants) {
		this.eventsParticipants = eventsParticipants;
	}

	public EventsParticipant addEventsParticipant(EventsParticipant eventsParticipant) {
		getEventsParticipants().add(eventsParticipant);
		eventsParticipant.setEvent(this);

		return eventsParticipant;
	}

	public EventsParticipant removeEventsParticipant(EventsParticipant eventsParticipant) {
		getEventsParticipants().remove(eventsParticipant);
		eventsParticipant.setEvent(null);

		return eventsParticipant;
	}

	public List<EventsProgram> getEventsPrograms() {
		return this.eventsPrograms;
	}

	public void setEventsPrograms(List<EventsProgram> eventsPrograms) {
		this.eventsPrograms = eventsPrograms;
	}

	public EventsProgram addEventsProgram(EventsProgram eventsProgram) {
		getEventsPrograms().add(eventsProgram);
		eventsProgram.setEvent(this);

		return eventsProgram;
	}

	public EventsProgram removeEventsProgram(EventsProgram eventsProgram) {
		getEventsPrograms().remove(eventsProgram);
		eventsProgram.setEvent(null);

		return eventsProgram;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}