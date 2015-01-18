package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the events_program_lectors database table.
 * 
 */
@Entity
@Table(name="events_program_lectors")
@NamedQuery(name="EventsProgramLector.findAll", query="SELECT e FROM EventsProgramLector e")
public class EventsProgramLector implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EventsProgramLectorPK id;

	public EventsProgramLector() {
	}

	public EventsProgramLectorPK getId() {
		return this.id;
	}

	public void setId(EventsProgramLectorPK id) {
		this.id = id;
	}

}