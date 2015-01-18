package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	
//	public Usercom.mmm.podobri.model()
//	{
//		this("D-U-M-M-Y", "D-U-M-M-Y");
//	}
//	
//	public Usercom.mmm.podobri.model(String username, String password)
//	{
//		this(username, password, true, true, true, true, Collections.<GrantedAuthority> emptyList());
//	}
//	
//	public Usercom.mmm.podobri.model(String username, String password, boolean enabled,
//			boolean accountNonExpired, boolean credentialsNonExpired,
//			boolean accountNonLocked,
//			Collection<? extends GrantedAuthority> authorities) 
//	{
//		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
//				accountNonLocked, authorities);
//	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=45)
	private String email;

	@Column(name="is_active", nullable=false)
	private byte isActive;

	@Column(name="is_organization", nullable=false)
	private byte isOrganization;

	@Column(nullable=false, length=45)
	private String password;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="register_date", nullable=false)
	private Date registerDate;

	@Column(nullable=false, length=30)
	private String username;

	//bi-directional many-to-one association to EventCoorganizator
	@OneToMany(mappedBy="user")
	private List<EventCoorganizator> eventCoorganizators;

	//bi-directional many-to-one association to Event
	@OneToMany(mappedBy="user")
	private List<Event> events1;

	//bi-directional one-to-one association to Individual
	@OneToOne(mappedBy="user")
	private Individual individual;

	//bi-directional many-to-one association to Lector
	@OneToMany(mappedBy="user")
	private List<Lector> lectors;

	//bi-directional one-to-one association to Organization
	@OneToOne(mappedBy="user")
	private Organization organization;

	//bi-directional many-to-one association to Sponsor
	@OneToMany(mappedBy="user")
	private List<Sponsor> sponsors;

	//bi-directional one-to-one association to UserInfo
	@OneToOne(mappedBy="user")
	private UserInfo userInfo;

	//bi-directional many-to-many association to ActivityType
	@ManyToMany
	@JoinTable(
		name="users_activities"
		, joinColumns={
			@JoinColumn(name="user_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="activity_id", nullable=false)
			}
		)
	private List<ActivityType> activityTypes;

	//bi-directional many-to-many association to Event
	@ManyToMany
	@JoinTable(
		name="users_events"
		, joinColumns={
			@JoinColumn(name="user_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="event_id", nullable=false)
			}
		)
	private List<Event> events2;

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte getIsActive() {
		return this.isActive;
	}

	public void setIsActive(byte isActive) {
		this.isActive = isActive;
	}

	public byte getIsOrganization() {
		return this.isOrganization;
	}

	public void setIsOrganization(byte isOrganization) {
		this.isOrganization = isOrganization;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<EventCoorganizator> getEventCoorganizators() {
		return this.eventCoorganizators;
	}

	public void setEventCoorganizators(List<EventCoorganizator> eventCoorganizators) {
		this.eventCoorganizators = eventCoorganizators;
	}

	public EventCoorganizator addEventCoorganizator(EventCoorganizator eventCoorganizator) {
		getEventCoorganizators().add(eventCoorganizator);
		eventCoorganizator.setUser(this);

		return eventCoorganizator;
	}

	public EventCoorganizator removeEventCoorganizator(EventCoorganizator eventCoorganizator) {
		getEventCoorganizators().remove(eventCoorganizator);
		eventCoorganizator.setUser(null);

		return eventCoorganizator;
	}

	public List<Event> getEvents1() {
		return this.events1;
	}

	public void setEvents1(List<Event> events1) {
		this.events1 = events1;
	}

	public Event addEvents1(Event events1) {
		getEvents1().add(events1);
		events1.setUser(this);

		return events1;
	}

	public Event removeEvents1(Event events1) {
		getEvents1().remove(events1);
		events1.setUser(null);

		return events1;
	}

	public Individual getIndividual() {
		return this.individual;
	}

	public void setIndividual(Individual individual) {
		this.individual = individual;
	}

	public List<Lector> getLectors() {
		return this.lectors;
	}

	public void setLectors(List<Lector> lectors) {
		this.lectors = lectors;
	}

	public Lector addLector(Lector lector) {
		getLectors().add(lector);
		lector.setUser(this);

		return lector;
	}

	public Lector removeLector(Lector lector) {
		getLectors().remove(lector);
		lector.setUser(null);

		return lector;
	}

	public Organization getOrganization() {
		return this.organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List<Sponsor> getSponsors() {
		return this.sponsors;
	}

	public void setSponsors(List<Sponsor> sponsors) {
		this.sponsors = sponsors;
	}

	public Sponsor addSponsor(Sponsor sponsor) {
		getSponsors().add(sponsor);
		sponsor.setUser(this);

		return sponsor;
	}

	public Sponsor removeSponsor(Sponsor sponsor) {
		getSponsors().remove(sponsor);
		sponsor.setUser(null);

		return sponsor;
	}

	public UserInfo getUserInfo() {
		return this.userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List<ActivityType> getActivityTypes() {
		return this.activityTypes;
	}

	public void setActivityTypes(List<ActivityType> activityTypes) {
		this.activityTypes = activityTypes;
	}

	public List<Event> getEvents2() {
		return this.events2;
	}

	public void setEvents2(List<Event> events2) {
		this.events2 = events2;
	}

}