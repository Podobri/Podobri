package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the events_program database table.
 * 
 */
@Entity
@Table(name="events_program")
@NamedQuery(name="EventsProgram.findAll", query="SELECT e FROM EventsProgram e")
public class EventsProgram implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private String id;

	@Column(name="date_time_from", nullable=false)
	private Timestamp dateTimeFrom;

	@Column(name="date_time_to", nullable=false)
	private Timestamp dateTimeTo;

	@Column(length=255)
	private String information;

	@Column(nullable=false, length=45)
	private String subject;

	//bi-directional many-to-one association to Event
	@ManyToOne
	@JoinColumn(name="event_id", nullable=false)
	private Event event;

	public EventsProgram() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getInformation() {
		return this.information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Event getEvent() {
		return this.event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

}