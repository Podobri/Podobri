/*
 * UsersController.java
 *
 * created at 12.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mmm.podobri.model.User;
import com.mmm.podobri.service.UserService;

@Controller
public class UsersController
{
    @Autowired
    UserService userService;

    @RequestMapping("/users")
    public ModelAndView usersHome()
    {
        final ModelAndView model = new ModelAndView("users");
        model.addObject("users", userService.findAll());
        return model;
    }
    
    @RequestMapping(value="/users/viewUser", method=RequestMethod.GET)
    public ModelAndView viewUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("usersView");
        final User user = userService.findOne(id);
        model.addObject("userForView", user);
        return model;
    }
    
    @RequestMapping(value="/users/editUser", method=RequestMethod.GET)
    public ModelAndView editUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("usersEdit");
        final User user = userService.findOne(id);
        model.addObject("userForEdit", user);
        return model;
    }
    
    
    @RequestMapping(value="/users/saveEditUser", method=RequestMethod.POST)
    public ModelAndView editUser(@PathVariable User user)
    {
        final ModelAndView model = new ModelAndView("users");
        userService.update(user);
        model.addObject("users", userService.findAll());
        return model;
    }
    
    @RequestMapping(value="/users/deleteUser", method=RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("users");
        userService.deleteById(id);
        model.addObject("users", userService.findAll());
        return model;
    }
    
    @RequestMapping(value="/users/addNewUser", method=RequestMethod.GET)
    public ModelAndView addNewUser()
    {
        final ModelAndView model = new ModelAndView("usersAdd");
        model.addObject("user", new User());
        return model;
    }
}



