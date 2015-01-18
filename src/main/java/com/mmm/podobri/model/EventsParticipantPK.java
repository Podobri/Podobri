package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the events_participants database table.
 * 
 */
@Embeddable
public class EventsParticipantPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="event_id", insertable=false, updatable=false, unique=true, nullable=false)
	private String eventId;

	@Column(name="individual_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int individualId;

	public EventsParticipantPK() {
	}
	public String getEventId() {
		return this.eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	public int getIndividualId() {
		return this.individualId;
	}
	public void setIndividualId(int individualId) {
		this.individualId = individualId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof EventsParticipantPK)) {
			return false;
		}
		EventsParticipantPK castOther = (EventsParticipantPK)other;
		return 
			this.eventId.equals(castOther.eventId)
			&& (this.individualId == castOther.individualId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.eventId.hashCode();
		hash = hash * prime + this.individualId;
		
		return hash;
	}
}