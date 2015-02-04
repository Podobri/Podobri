/*
 * TeamInfo.java
 *
 * created at 11.01.2015 ã. by Mariyan 
 */
package com.mmm.podobri.bo;


public class TeamInfo
{
    public final String firstname;
    public final String lastname;
    public final String position;
    public final String phone;
    public final String email;
    public final String info;
    public final String fullname;


    public TeamInfo(String firstname,
                    String lastname,
                    String position,
                    String phone,
                    String email,
                    String info)
    {
        this.firstname = firstname;
        this.lastname = lastname;
        this.position = position;
        this.phone = phone;
        this.email = email;
        this.info = info;
        this.fullname = firstname + " " + lastname;
    }


    public String getFirstname()
    {
        return firstname;
    }


    public String getLastname()
    {
        return lastname;
    }


    public String getPosition()
    {
        return position;
    }


    public String getPhone()
    {
        return phone;
    }


    public String getEmail()
    {
        return email;
    }


    public String getInfo()
    {
        return info;
    }
    
    public String getFullname()
    {
        return fullname;
    }
}
