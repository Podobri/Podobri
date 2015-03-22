package com.mmm.podobri.service;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.UserDao;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Education;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.Individual;
import com.mmm.podobri.model.Organization;
import com.mmm.podobri.model.OrganizationsType;
import com.mmm.podobri.model.Role;
import com.mmm.podobri.model.Role.UsersRoles;
import com.mmm.podobri.model.User;
import com.mmm.podobri.model.UserInfo;


@Service("userService")
@Transactional
public class UserServiceImpl
    implements UserService, UserDetailsService
{
    @Autowired
    public UserDao userDao;

    @Autowired
    public EventService eventService;


    @Override
    public UserDetails loadUserByUsername(final String username)
        throws UsernameNotFoundException
    {
        User user = userDao.findByUserName(username);
        if (user == null)
        {
            user = userDao.findByEmail(username);
        }

        if (user == null)
        {
            throw new UsernameNotFoundException("Cannot find user with given credentials");
        }

        List<GrantedAuthority> authorities = buildUserAuthority(user.getRoles());
        return new org.springframework.security.core.userdetails.User(user.getUsername(),
                                                                      user.getPassword(),
                                                                      true,
                                                                      true,
                                                                      true,
                                                                      true,
                                                                      authorities);
    }


    private List<GrantedAuthority> buildUserAuthority(List<Role> userRoles)
    {
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

        // Build user's authorities
        for (Role userRole : userRoles)
        {
            setAuths.add(new GrantedAuthorityImpl(userRole.getRoleName()));
        }

        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
        return Result;
    }


    @Override
    public User findOne(int id)
    {
        return userDao.findOne(id);
    }


    @Override
    public List<User> findAll()
    {
        return userDao.findAll();
    }


    @Override
    public void save(User entity)
    {
        userDao.save(entity);
    }


    @Override
    public User update(User entity)
    {
        return userDao.update(entity);
    }


    @Override
    public void delete(User entity)
    {
        userDao.delete(entity);
    }


    @Override
    public void deleteById(int id)
    {
        userDao.deleteById(id);
    }


    @Override
    public User findByUserName(String username)
    {
        return userDao.findByUserName(username);
    }


    public DaoUtils getDaoUtils()
    {
        return userDao.getDaoUtils();
    }


    @Override
    public void saveInTransaction(Serializable... entities)
    {
        userDao.saveInTransaction(entities);
    }


    @Override
    public void registerNewUser(User user, UsersRoles userRole)
    {
        Role role = getDaoUtils().getRoleByName(userRole.name());
        user.getRoles().add(role);
        user.setStatus(UserService.UserStatus.NEW.name());
        final UserInfo userInfo = user.getUserInfo();
        Date currentDate = new Date();
        userInfo.setCreated(currentDate);
        userInfo.setModified(currentDate);
        Country country = getDaoUtils().getCountryById(userInfo.getCountry().getId());
        userInfo.setCountry(country);
        City city = getDaoUtils().getCityById(userInfo.getCity().getId());
        userInfo.setCity(city);
        userInfo.setUser(user);

        if (userRole.equals(UsersRoles.ROLE_INDIVIDUAL))
        {
            final Individual individual = user.getIndividual();
            Education education = getDaoUtils().getEducationById(individual.getEducation().getId());
            individual.setEducation(education);
            individual.setUser(user);
        }
        else if (userRole.equals(UsersRoles.ROLE_ORGANIZATION))
        {
            final Organization organization = user.getOrganization();
            byte organizationTypeId = organization.getOrganizationsType().getId();
            OrganizationsType organizationsType = getDaoUtils().getOrganizationTypeById(organizationTypeId);
            organization.setOrganizationsType(organizationsType);
            organization.setName(user.getUsername());
            organization.setUser(user);
        }
        
        Md5PasswordEncoder encoder = new Md5PasswordEncoder();
        String password = user.getPassword();
        String cryptedPassword = encoder.encodePassword(password, "");
        user.setPassword(cryptedPassword);

        save(user);
    }


    @Override
    public List<Event> getMyEvents()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // get logged in username
        User user = findByUserName(username);
        List<Event> events = eventService.findEventsByParticipant(user);
        return events;
    }


    @Override
    public List<User> findAllOrganizations()
    {
        return userDao.findAllOrganizations();
    }
}
