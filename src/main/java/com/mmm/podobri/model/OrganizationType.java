package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the organization_types database table.
 * 
 */
@Entity
@Table(name="organization_types")
@NamedQuery(name="OrganizationType.findAll", query="SELECT o FROM OrganizationType o")
public class OrganizationType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private byte id;

	@Column(nullable=false, length=45)
	private String type;

	//bi-directional many-to-one association to Organization
	@OneToMany(mappedBy="organizationTypeBean")
	private List<Organization> organizations;

	public OrganizationType() {
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

	public List<Organization> getOrganizations() {
		return this.organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public Organization addOrganization(Organization organization) {
		getOrganizations().add(organization);
		organization.setOrganizationTypeBean(this);

		return organization;
	}

	public Organization removeOrganization(Organization organization) {
		getOrganizations().remove(organization);
		organization.setOrganizationTypeBean(null);

		return organization;
	}

}