package com.mmm.podobri.dao;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.model.User;


@Repository
@Transactional
public class UserDaoImpl
    extends BaseDaoImpl<User>
    implements UserDao
{
    // private static final Logger LOG = Logger.getLogger(UserDaoImpl.class.getName());

    public UserDaoImpl()
    {
        setClazz(User.class);
    }


    @SuppressWarnings("unchecked")
    @Override
    public User findByUserName(String username)
    {
        List<User> users = new ArrayList<User>();

        users = getCurrentSession().createQuery("from User where username=?")
                                   .setParameter(0, username)
                                   .list();

        if (users.size() > 0)
        {
            return users.get(0);
        }
        else
        {
            return null;
        }
    }
}
