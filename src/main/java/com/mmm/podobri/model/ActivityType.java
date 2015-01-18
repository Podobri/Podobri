package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the activity_types database table.
 * 
 */
@Entity
@Table(name="activity_types")
@NamedQuery(name="ActivityType.findAll", query="SELECT a FROM ActivityType a")
public class ActivityType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private byte id;

	@Column(nullable=false, length=45)
	private String type;

	//bi-directional many-to-many association to Event
	@ManyToMany(mappedBy="activityTypes")
	private List<Event> events;

	//bi-directional many-to-many association to User
	@ManyToMany(mappedBy="activityTypes")
	private List<User> users;

	public ActivityType() {
	}

	public byte getId() {
		return this.id;
	}

	public void setId(byte id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Event> getEvents() {
		return this.events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}