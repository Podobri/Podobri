package com.mmm.podobri.model;


import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the users_activities database table.
 */
@Entity
@Table(name = "users_activities")
@NamedQuery(name = "UsersActivity.findAll", query = "SELECT u FROM UsersActivity u")
public class UsersActivity
    implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "user_id", insertable = false, updatable = false, unique = false, nullable = false)
    private int userId;

    @Id
    @Column(name = "activity_id", insertable = false, updatable = false, unique = false, nullable = false)
    private byte activityId;

    // bi-directional many-to-one association to User
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
    private User user;


    public UsersActivity()
    {}


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
    }


    public byte getActivityId()
    {
        return this.activityId;
    }


    public void setActivityId(byte activityId)
    {
        this.activityId = activityId;
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
        if (!(other instanceof UsersActivity))
        {
            return false;
        }
        UsersActivity castOther = (UsersActivity)other;
        return (this.userId == castOther.userId) && (this.activityId == castOther.activityId);
    }


    public int hashCode()
    {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.userId;
        hash = hash * prime + ((int)this.activityId);

        return hash;
    }
}
