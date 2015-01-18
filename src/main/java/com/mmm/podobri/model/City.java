package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the cities database table.
 * 
 */
@Entity
@Table(name="cities")
@NamedQuery(name="City.findAll", query="SELECT c FROM City c")
public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private byte id;

	@Column(name="city_name", nullable=false, length=45)
	private String cityName;

	//bi-directional many-to-one association to Country
	@ManyToOne
	@JoinColumn(name="country_id", nullable=false)
	private Country country;

	//bi-directional many-to-one association to Event
	@OneToMany(mappedBy="city")
	private List<Event> events;

	//bi-directional many-to-one association to UserInfo
	@OneToMany(mappedBy="city")
	private List<UserInfo> userInfos;

	public City() {
	}

	public byte getId() {
		return this.id;
	}

	public void setId(byte id) {
		this.id = id;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public List<Event> getEvents() {
		return this.events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Event addEvent(Event event) {
		getEvents().add(event);
		event.setCity(this);

		return event;
	}

	public Event removeEvent(Event event) {
		getEvents().remove(event);
		event.setCity(null);

		return event;
	}

	public List<UserInfo> getUserInfos() {
		return this.userInfos;
	}

	public void setUserInfos(List<UserInfo> userInfos) {
		this.userInfos = userInfos;
	}

	public UserInfo addUserInfo(UserInfo userInfo) {
		getUserInfos().add(userInfo);
		userInfo.setCity(this);

		return userInfo;
	}

	public UserInfo removeUserInfo(UserInfo userInfo) {
		getUserInfos().remove(userInfo);
		userInfo.setCity(null);

		return userInfo;
	}

}