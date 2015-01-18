package com.mmm.podobri.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.dao.UserDao;
import com.mmm.podobri.model.User;


@Service("userService")
@Transactional
public class UserServiceImpl
    implements UserService, UserDetailsService
{
    @Autowired
    public UserDao userDao;


    @Override
    public UserDetails loadUserByUsername(final String username)
        throws UsernameNotFoundException
    {
        return null;
        // User user = userDao.findByUserName(username);
        // List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());
        // return new User(user.getUsername(),
        // user.getPassword(),
        // user.isEnabled(),
        // true,
        // true,
        // true,
        // authorities);
    }


    @Override
    public User findOne(long id)
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
    public void deleteById(long id)
    {
        userDao.deleteById(id);
    }


    @Override
    public User findByUserName(String username)
    {
        return userDao.findByUserName(username);
    }

    // private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles)
    // {
    // Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
    //
    // // Build user's authorities
    // for (UserRole userRole : userRoles)
    // {
    // setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
    // }
    //
    // List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
    // return Result;
    // }
}
