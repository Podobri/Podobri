/*
 * UserRole.java
 *
 * created at 20.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Entity
@Table(name = "users_roles")
@NamedQuery(name = "UsersRole.findAll", query = "SELECT u FROM UsersRole u")
public class UsersRole
    implements Serializable
{
    /** field <code>serialVersionUID</code> */
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "user_id", insertable = false, updatable = false, unique = false, nullable = false)
    private int userId;

    @Id
    @Column(name = "role_id", insertable = false, updatable = false, unique = false, nullable = false)
    private int roleId;

    // bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
    private User user;


    public UsersRole()
    {}


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
    }


    public int getRoleId()
    {
        return this.roleId;
    }


    public void setRoleId(int roleId)
    {
        this.roleId = roleId;
    }


    public User getUser()
    {
        return this.user;
    }


    public void setUser(User user)
    {
        this.user = user;
    }


    public boolean equals(Object other)
    {
        if (this == other)
        {
            return true;
        }
        if (!(other instanceof UsersRole))
        {
            return false;
        }
        UsersRole castOther = (UsersRole)other;
        return (this.userId == castOther.userId) && (this.roleId == castOther.roleId);
    }


    public int hashCode()
    {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.userId;
        hash = hash * prime + ((int)this.roleId);

        return hash;
    }
}
