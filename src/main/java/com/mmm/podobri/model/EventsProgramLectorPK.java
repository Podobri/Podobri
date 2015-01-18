package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the events_program_lector database table.
 * 
 */
@Embeddable
public class EventsProgramLectorPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="event_program_id", insertable=false, updatable=false, unique=true, nullable=false)
	private String eventProgramId;

	@Column(name="lector_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int lectorId;

	public EventsProgramLectorPK() {
	}
	public String getEventProgramId() {
		return this.eventProgramId;
	}
	public void setEventProgramId(String eventProgramId) {
		this.eventProgramId = eventProgramId;
	}
	public int getLectorId() {
		return this.lectorId;
	}
	public void setLectorId(int lectorId) {
		this.lectorId = lectorId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof EventsProgramLectorPK)) {
			return false;
		}
		EventsProgramLectorPK castOther = (EventsProgramLectorPK)other;
		return 
			this.eventProgramId.equals(castOther.eventProgramId)
			&& (this.lectorId == castOther.lectorId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.eventProgramId.hashCode();
		hash = hash * prime + this.lectorId;
		
		return hash;
	}
}