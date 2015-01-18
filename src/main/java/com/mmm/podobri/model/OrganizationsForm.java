package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the organizations_forms database table.
 * 
 */
@Entity
@Table(name="organizations_forms")
@NamedQuery(name="OrganizationsForm.findAll", query="SELECT o FROM OrganizationsForm o")
public class OrganizationsForm implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private OrganizationsFormPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date created;

	@Column(name="is_active", nullable=false)
	private byte isActive;

	@Column(nullable=false)
	private byte type;

	//bi-directional many-to-one association to Organization
	@ManyToOne
	@JoinColumn(name="organization_id", nullable=false, insertable=false, updatable=false)
	private Organization organization;

	public OrganizationsForm() {
	}

	public OrganizationsFormPK getId() {
		return this.id;
	}

	public void setId(OrganizationsFormPK id) {
		this.id = id;
	}

	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public byte getIsActive() {
		return this.isActive;
	}

	public void setIsActive(byte isActive) {
		this.isActive = isActive;
	}

	public byte getType() {
		return this.type;
	}

	public void setType(byte type) {
		this.type = type;
	}

	public Organization getOrganization() {
		return this.organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

}