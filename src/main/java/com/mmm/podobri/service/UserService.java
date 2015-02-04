package com.mmm.podobri.service;

import java.util.List;

import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.User;
import com.mmm.podobri.model.Role.UsersRoles;

public interface UserService extends BaseDaoServices<User>
{
    public enum UserStatus { NEW, ACTIVED, BLOCKED }
	public User findByUserName(String username);
	public void registerNewUser(User user, UsersRoles userRole);
	public List<Event> getMyEvents();
	public List<User> findAllOrganizations();
//	void changePassword(UserModel user, String password);
//    void deleteUser(Long userId);
//    boolean eMailAddressExists(String eMailAddress, Long userToExclude);
//    List<UserModel> findAllUsers(boolean isRoot);
//    List<UserModel> findAllUsersByRole(boolean isRoot, String role);
//    
//    UserModel findUserByUserId(long userId)
//        throws UsernameNotFoundException, DataAccessException;
//    
//    UserModel findUserByUsername(String userName, boolean slim)
//        throws UsernameNotFoundException, DataAccessException;
//
//    UserModel findUserByUsername(String userName)
//        throws UsernameNotFoundException, DataAccessException;
//
//    List<UserModel> findAllUsersByEmail(String email)
//        throws UsernameNotFoundException, DataAccessException;
//
//    String findHomeGroupNameOfUser(String userName);
//    List<GrantedAuthority> loadGroupAuthorities(String userName);
//    void setDataSource(DataSource dataSource);
//    boolean userExists(long userId, String userName);
//    boolean userExists(String userName, Long userToExclude);
//    boolean displayNameExists(String displayName, long userIdToExclude);
}
