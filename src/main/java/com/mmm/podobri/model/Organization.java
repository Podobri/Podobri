package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the organizations database table.
 * 
 */
@Entity
@Table(name="organizations")
@NamedQuery(name="Organization.findAll", query="SELECT o FROM Organization o")
public class Organization implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="user_id", unique=true, nullable=false)
	private int userId;

	@Column(nullable=false, length=45)
	private String address;

	@Column(nullable=false, length=45)
	private String name;

	@Column(length=20)
	private String phone;

	private byte recruiter;

	//bi-directional many-to-many association to Individual
	@ManyToMany
	@JoinTable(
		name="organizations_likes"
		, joinColumns={
			@JoinColumn(name="organization_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="individual_id", nullable=false)
			}
		)
	private List<Individual> individuals;

	//bi-directional many-to-one association to OrganizationType
	@ManyToOne
	@JoinColumn(name="organization_type", nullable=false)
	private OrganizationType organizationTypeBean;

	//bi-directional one-to-one association to User
	@OneToOne
	@JoinColumn(name="user_id", nullable=false, insertable=false, updatable=false)
	private User user;

	//bi-directional many-to-one association to OrganizationsForm
	@OneToMany(mappedBy="organization")
	private List<OrganizationsForm> organizationsForms;

	public Organization() {
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte getRecruiter() {
		return this.recruiter;
	}

	public void setRecruiter(byte recruiter) {
		this.recruiter = recruiter;
	}

	public List<Individual> getIndividuals() {
		return this.individuals;
	}

	public void setIndividuals(List<Individual> individuals) {
		this.individuals = individuals;
	}

	public OrganizationType getOrganizationTypeBean() {
		return this.organizationTypeBean;
	}

	public void setOrganizationTypeBean(OrganizationType organizationTypeBean) {
		this.organizationTypeBean = organizationTypeBean;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrganizationsForm> getOrganizationsForms() {
		return this.organizationsForms;
	}

	public void setOrganizationsForms(List<OrganizationsForm> organizationsForms) {
		this.organizationsForms = organizationsForms;
	}

	public OrganizationsForm addOrganizationsForm(OrganizationsForm organizationsForm) {
		getOrganizationsForms().add(organizationsForm);
		organizationsForm.setOrganization(this);

		return organizationsForm;
	}

	public OrganizationsForm removeOrganizationsForm(OrganizationsForm organizationsForm) {
		getOrganizationsForms().remove(organizationsForm);
		organizationsForm.setOrganization(null);

		return organizationsForm;
	}

}