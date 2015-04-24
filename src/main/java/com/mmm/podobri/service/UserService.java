package com.mmm.podobri.service;

import java.util.List;

import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.Organization;
import com.mmm.podobri.model.Role.UsersRoles;
import com.mmm.podobri.model.User;

public interface UserService extends BaseDaoServices<User>
{
    public enum UserStatus { NEW, ACTIVED, BLOCKED }
	public User findByUserName(String username);
	public void registerNewUser(User user, UsersRoles userRole);
	public List<Event> getMyEvents();
	public List<Organization> findAllOrganizations();
}
