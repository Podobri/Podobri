package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the events_participants database table.
 * 
 */
@Entity
@Table(name="events_participants")
@NamedQuery(name="EventsParticipant.findAll", query="SELECT e FROM EventsParticipant e")
public class EventsParticipant implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EventsParticipantPK id;

	@Column(nullable=false)
	private byte status;

	//bi-directional many-to-one association to Event
	@ManyToOne
	@JoinColumn(name="event_id", nullable=false, insertable=false, updatable=false)
	private Event event;

	//bi-directional many-to-one association to Individual
	@ManyToOne
	@JoinColumn(name="individual_id", nullable=false, insertable=false, updatable=false)
	private Individual individual;

	public EventsParticipant() {
	}

	public EventsParticipantPK getId() {
		return this.id;
	}

	public void setId(EventsParticipantPK id) {
		this.id = id;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public Event getEvent() {
		return this.event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Individual getIndividual() {
		return this.individual;
	}

	public void setIndividual(Individual individual) {
		this.individual = individual;
	}

}