package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the organizations_forms database table.
 * 
 */
@Embeddable
public class OrganizationsFormPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="organization_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int organizationId;

	@Column(name="form_name", unique=true, nullable=false, length=45)
	private String formName;

	public OrganizationsFormPK() {
	}
	public int getOrganizationId() {
		return this.organizationId;
	}
	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}
	public String getFormName() {
		return this.formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof OrganizationsFormPK)) {
			return false;
		}
		OrganizationsFormPK castOther = (OrganizationsFormPK)other;
		return 
			(this.organizationId == castOther.organizationId)
			&& this.formName.equals(castOther.formName);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.organizationId;
		hash = hash * prime + this.formName.hashCode();
		
		return hash;
	}
}