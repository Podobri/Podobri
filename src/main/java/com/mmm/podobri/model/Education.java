package com.mmm.podobri.model;


import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the educations database table.
 */
@Entity
@Table(name = "educations")
@NamedQuery(name = "Education.findAll", query = "SELECT e FROM Education e")
public class Education
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private byte id;

    @Column(nullable = false, length = 45)
    private String education;

    // bi-directional many-to-one association to Individual
    @OneToMany(mappedBy = "education")
    private List<Individual> individuals;


    public Education()
    {}


    public byte getId()
    {
        return this.id;
    }


    public void setId(byte id)
    {
        this.id = id;
    }


    public String getEducation()
    {
        return this.education;
    }


    public void setEducation(String education)
    {
        this.education = education;
    }


    public List<Individual> getIndividuals()
    {
        return this.individuals;
    }


    public void setIndividuals(List<Individual> individuals)
    {
        this.individuals = individuals;
    }


    public Individual addIndividual(Individual individual)
    {
        getIndividuals().add(individual);
        individual.setEducation(this);

        return individual;
    }


    public Individual removeIndividual(Individual individual)
    {
        getIndividuals().remove(individual);
        individual.setEducation(null);

        return individual;
    }
}
