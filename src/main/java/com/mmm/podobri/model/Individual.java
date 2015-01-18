package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the individuals database table.
 * 
 */
@Entity
@Table(name="individuals")
@NamedQuery(name="Individual.findAll", query="SELECT i FROM Individual i")
public class Individual implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="user_id", unique=true, nullable=false)
	private int userId;

	@Temporal(TemporalType.DATE)
	@Column(name="birth_date", nullable=false)
	private Date birthDate;

	@Column(name="last_name", nullable=false, length=30)
	private String lastName;

	@Column(nullable=false, length=30)
	private String name;

	@Column(name="recieve_newsletter_emails")
	private byte recieveNewsletterEmails;

	@Column(name="recieve_newsletter_events")
	private byte recieveNewsletterEvents;

	//bi-directional many-to-one association to EventsParticipant
	@OneToMany(mappedBy="individual")
	private List<EventsParticipant> eventsParticipants;

	//bi-directional many-to-one association to Education
	@ManyToOne
	@JoinColumn(name="education_id", nullable=false)
	private Education education;

	//bi-directional many-to-many association to Language
	@ManyToMany
	@JoinTable(
		name="individuals_languages"
		, joinColumns={
			@JoinColumn(name="individual_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="language_id", nullable=false)
			}
		)
	private List<Language> languages;

	//bi-directional one-to-one association to User
	@OneToOne
	@JoinColumn(name="user_id", nullable=false, insertable=false, updatable=false)
	private User user;

	//bi-directional many-to-many association to Organization
	@ManyToMany(mappedBy="individuals")
	private List<Organization> organizations;

	public Individual() {
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getBirthDate() {
		return this.birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte getRecieveNewsletterEmails() {
		return this.recieveNewsletterEmails;
	}

	public void setRecieveNewsletterEmails(byte recieveNewsletterEmails) {
		this.recieveNewsletterEmails = recieveNewsletterEmails;
	}

	public byte getRecieveNewsletterEvents() {
		return this.recieveNewsletterEvents;
	}

	public void setRecieveNewsletterEvents(byte recieveNewsletterEvents) {
		this.recieveNewsletterEvents = recieveNewsletterEvents;
	}

	public List<EventsParticipant> getEventsParticipants() {
		return this.eventsParticipants;
	}

	public void setEventsParticipants(List<EventsParticipant> eventsParticipants) {
		this.eventsParticipants = eventsParticipants;
	}

	public EventsParticipant addEventsParticipant(EventsParticipant eventsParticipant) {
		getEventsParticipants().add(eventsParticipant);
		eventsParticipant.setIndividual(this);

		return eventsParticipant;
	}

	public EventsParticipant removeEventsParticipant(EventsParticipant eventsParticipant) {
		getEventsParticipants().remove(eventsParticipant);
		eventsParticipant.setIndividual(null);

		return eventsParticipant;
	}

	public Education getEducation() {
		return this.education;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

	public List<Language> getLanguages() {
		return this.languages;
	}

	public void setLanguages(List<Language> languages) {
		this.languages = languages;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Organization> getOrganizations() {
		return this.organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

}