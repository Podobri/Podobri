/*
 * Roles.java
 *
 * created at 20.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.model;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Entity
@Table(name = "roles")
@NamedQuery(name = "Role.findAll", query = "SELECT a FROM Role a")
public class Role
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    public enum UsersRoles
    {
        ROLE_ADMINISTRATOR, ROLE_ORGANIZATION, ROLE_INDIVIDUAL
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique = true, nullable = false)
    private int id;

    @Column(name = "role_name", nullable = false, length = 45)
    private String roleName;

    // bi-directional many-to-many association to User
    @ManyToMany(mappedBy = "roles")
    private List<User> users;


    public int getId()
    {
        return this.id;
    }


    public void setId(int id)
    {
        this.id = id;
    }


    public String getRoleName()
    {
        return this.roleName;
    }


    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }


    public List<User> getUsers()
    {
        return this.users;
    }


    public void setUsers(List<User> users)
    {
        this.users = users;
    }
}
