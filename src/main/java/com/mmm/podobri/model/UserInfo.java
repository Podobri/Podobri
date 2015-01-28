package com.mmm.podobri.model;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Parameter;


/**
 * The persistent class for the user_infos database table.
 */
@Entity
@Table(name = "user_infos")
@NamedQuery(name = "UserInfo.findAll", query = "SELECT u FROM UserInfo u")
public class UserInfo
    implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "user"))
    @GeneratedValue(generator = "generator")
    @Id
    @Column(name = "user_id", unique = true, nullable = false)
    private int userId;

    @Lob
    private String description;

    @Column(length = 45)
    private String facebook;

    @Column(length = 150)
    private String file;

    @Column(length = 45)
    private String linkedin;

    @Column(length = 20)
    private String phone;

    @Column(length = 150)
    private String picture;

    @Column(length = 45)
    private String website;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date modified;

    @Column(length = 100)
    private String browser;

    @Column(length = 15)
    private String ip;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "last_login")
    private Date lastLogin;

    @Column(length = 100)
    private String location;

    @Column(length = 40)
    private String os;

    @Column(length = 255)
    private String token;

    // bi-directional many-to-one association to City
    @ManyToOne
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinColumn(name = "city_id", nullable = false)
    private City city;

    // bi-directional many-to-one association to Country
    @ManyToOne
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinColumn(name = "country_id", nullable = false)
    private Country country;

    // bi-directional one-to-one association to User
    @OneToOne
    @PrimaryKeyJoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;


    public UserInfo()
    {}


    public int getUserId()
    {
        return this.userId;
    }


    public void setUserId(int userId)
    {
        this.userId = userId;
    }


    public String getDescription()
    {
        return this.description;
    }


    public void setDescription(String description)
    {
        this.description = description;
    }


    public String getFacebook()
    {
        return this.facebook;
    }


    public void setFacebook(String facebook)
    {
        this.facebook = facebook;
    }


    public String getFile()
    {
        return this.file;
    }


    public void setFile(String file)
    {
        this.file = file;
    }


    public String getLinkedin()
    {
        return this.linkedin;
    }


    public void setLinkedin(String linkedin)
    {
        this.linkedin = linkedin;
    }


    public String getPhone()
    {
        return this.phone;
    }


    public void setPhone(String phone)
    {
        this.phone = phone;
    }


    public String getPicture()
    {
        return this.picture;
    }


    public void setPicture(String picture)
    {
        this.picture = picture;
    }


    public String getWebsite()
    {
        return this.website;
    }


    public void setWebsite(String website)
    {
        this.website = website;
    }


    public String getBrowser()
    {
        return this.browser;
    }


    public void setBrowser(String browser)
    {
        this.browser = browser;
    }


    public Date getCreated()
    {
        return this.created;
    }


    public void setCreated(Date created)
    {
        this.created = created;
    }


    public String getIp()
    {
        return this.ip;
    }


    public void setIp(String ip)
    {
        this.ip = ip;
    }


    public Date getLastLogin()
    {
        return this.lastLogin;
    }


    public void setLastLogin(Date lastLogin)
    {
        this.lastLogin = lastLogin;
    }


    public String getLocation()
    {
        return this.location;
    }


    public void setLocation(String location)
    {
        this.location = location;
    }


    public Date getModified()
    {
        return this.modified;
    }


    public void setModified(Date modified)
    {
        this.modified = modified;
    }


    public String getOs()
    {
        return this.os;
    }


    public void setOs(String os)
    {
        this.os = os;
    }


    public String getToken()
    {
        return this.token;
    }


    public void setToken(String token)
    {
        this.token = token;
    }


    public City getCity()
    {
        return this.city;
    }


    public void setCity(City city)
    {
        this.city = city;
    }


    public Country getCountry()
    {
        return this.country;
    }


    public void setCountry(Country country)
    {
        this.country = country;
    }


    public User getUser()
    {
        return this.user;
    }


    public void setUser(User user)
    {
        this.user = user;
    }
}
