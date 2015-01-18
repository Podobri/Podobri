package com.mmm.podobri.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the languages database table.
 * 
 */
@Entity
@Table(name="languages")
@NamedQuery(name="Language.findAll", query="SELECT l FROM Language l")
public class Language implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private byte id;

	@Column(nullable=false, length=45)
	private String language;

	//bi-directional many-to-many association to Individual
	@ManyToMany(mappedBy="languages")
	private List<Individual> individuals;

	public Language() {
	}

	public byte getId() {
		return this.id;
	}

	public void setId(byte id) {
		this.id = id;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public List<Individual> getIndividuals() {
		return this.individuals;
	}

	public void setIndividuals(List<Individual> individuals) {
		this.individuals = individuals;
	}

}