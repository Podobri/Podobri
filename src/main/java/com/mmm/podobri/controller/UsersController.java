/*
 * UsersController.java
 *
 * created at 12.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mmm.podobri.controller.databinding.ActivityEditor;
import com.mmm.podobri.controller.databinding.LanguageEditor;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.Role.UsersRoles;
import com.mmm.podobri.model.User;
import com.mmm.podobri.service.UserService;
import com.mmm.podobri.util.EventViewWrapper;


@Controller
@RequestMapping("/users")
public class UsersController
{
    @Autowired
    private UserService userService;


    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(List.class, "activities", new ActivityEditor(List.class, userService.getDaoUtils()));
        binder.registerCustomEditor(List.class, "individual.languages", new LanguageEditor(List.class, userService.getDaoUtils()));
    }


    @RequestMapping
    public ModelAndView usersHome()
    {
        final ModelAndView model = new ModelAndView("users/users");
        model.addObject("users", userService.findAll());
        return model;
    }
    
    @RequestMapping(value = "/myProfile", method = RequestMethod.GET)
    public ModelAndView userHome()
    {
        final ModelAndView model = new ModelAndView("users/usersView");
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//      String username = auth.getName(); //get logged in username
        String username = "test";
        final User user = userService.findByUserName(username);
        List<Event> myEvents = userService.getMyEvents();
        model.addObject("user", user);
        model.addObject("events", EventViewWrapper.buildEventViewWrapperList(myEvents));
        return loadSelects(model);
    }


    @RequestMapping(value = "/viewUser/{id}", method = RequestMethod.GET)
    public ModelAndView viewUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("users/usersView");
        final User user = userService.findOne(id);
        model.addObject("user", user);
        return model;
    }


    @RequestMapping(value = "/updateUser/{id}", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("users/usersEdit");
        final User user = userService.findOne(id);
        model.addObject("user", user);
        return loadSelects(model);
    }


    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public ModelAndView updateUser(@ModelAttribute User user)
    {
        final ModelAndView model = new ModelAndView("users/users");
        userService.update(user);
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("users/users");
        userService.deleteById(id);
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView registerNewUser()
    {
        final ModelAndView model = new ModelAndView("users/register");
        model.addObject("user", new User());
        return loadSelects(model);
    }


    @RequestMapping(value = "/register/individual", method = RequestMethod.POST)
    public ModelAndView registerIndividual(@ModelAttribute("user") User user, BindingResult result)
    {
        if (result.hasErrors())
        {
            final ModelAndView model = new ModelAndView("users/register");
            return model;
        }
        final ModelAndView model = new ModelAndView("users/users");
        userService.registerNewUser(user, UsersRoles.INDIVIDUAL);
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/register/organization", method = RequestMethod.POST)
    public String registerOrganization(@ModelAttribute("user") User user, BindingResult result)
    {
        if (result.hasErrors())
        {
            return "redirect:/users/register/";
        }
        userService.registerNewUser(user, UsersRoles.ORGANIZATION);
        return "redirect:/users/";
    }
    
    private ModelAndView loadSelects(ModelAndView model)
    {
        model.addObject("countries", userService.getDaoUtils().getAllCountries());
        model.addObject("cities", userService.getDaoUtils().getAllCities());
        model.addObject("activitiesList", userService.getDaoUtils().getAllActivities());
        model.addObject("educations", userService.getDaoUtils().getAllEducations());
        model.addObject("languages", userService.getDaoUtils().getAllLanguages());
        model.addObject("organizationTypes", userService.getDaoUtils().getAllOrganizationTypes());
        return model;
    }
}
