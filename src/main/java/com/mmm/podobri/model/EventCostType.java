package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the event_cost_types database table.
 * 
 */
@Entity
@Table(name="event_cost_types")
@NamedQuery(name="EventCostType.findAll", query="SELECT e FROM EventCostType e")
public class EventCostType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private byte id;

	@Column(nullable=false, length=45)
	private String cost;

	//bi-directional many-to-one association to Event
	@OneToMany(mappedBy="eventCostType")
	private List<Event> events;

	public EventCostType() {
	}

	public byte getId() {
		return this.id;
	}

	public void setId(byte id) {
		this.id = id;
	}

	public String getCost() {
		return this.cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public List<Event> getEvents() {
		return this.events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Event addEvent(Event event) {
		getEvents().add(event);
		event.setEventCostType(this);

		return event;
	}

	public Event removeEvent(Event event) {
		getEvents().remove(event);
		event.setEventCostType(null);

		return event;
	}

}