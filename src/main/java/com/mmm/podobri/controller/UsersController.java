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
import com.mmm.podobri.model.Role.UsersRoles;
import com.mmm.podobri.model.User;
import com.mmm.podobri.service.UserService;


@Controller
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
//        binder.registerCustomEditor(List.class, "countries", new CountryEditor(List.class));
//        binder.registerCustomEditor(List.class, "cities", new CityEditor(List.class));
//        binder.registerCustomEditor(List.class, "educations", new EducationEditor(List.class));
    }


    @RequestMapping("/users")
    public ModelAndView usersHome()
    {
        final ModelAndView model = new ModelAndView("users");
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/users/viewUser", method = RequestMethod.GET)
    public ModelAndView viewUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("usersView");
        final User user = userService.findOne(id);
        model.addObject("userForView", user);
        return model;
    }


    @RequestMapping(value = "/users/updateUser", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("usersEdit");
        final User user = userService.findOne(id);
        model.addObject("userForEdit", user);
        return model;
    }


    @RequestMapping(value = "/users/updateUser", method = RequestMethod.POST)
    public ModelAndView editUser(@ModelAttribute User user)
    {
        final ModelAndView model = new ModelAndView("users");
        userService.update(user);
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/users/deleteUser", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable Integer id)
    {
        final ModelAndView model = new ModelAndView("users");
        userService.deleteById(id);
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/users/register", method = RequestMethod.GET)
    public ModelAndView addNewUser()
    {
        final ModelAndView model = new ModelAndView("register");
        model.addObject("user", new User());
        model.addObject("countries", userService.getDaoUtils().findAllCountries());
        model.addObject("cities", userService.getDaoUtils().findAllCities());
        model.addObject("activitiesList", userService.getDaoUtils().findAllActivities());
        model.addObject("educations", userService.getDaoUtils().findAllEducations());
        model.addObject("languages", userService.getDaoUtils().findAllLanguages());
        model.addObject("opportunityTypes", userService.getDaoUtils().findAllOpportunityTypes());
        model.addObject("organizationTypes", userService.getDaoUtils().findAllOrganizationTypes());
        return model;
    }


    @RequestMapping(value = "/users/register/individual", method = RequestMethod.POST)
    public ModelAndView registerIndividual(@ModelAttribute("user") User user, BindingResult result)
    {
        if (result.hasErrors())
        {
            final ModelAndView model = new ModelAndView("register");
            return model;
        }
        final ModelAndView model = new ModelAndView("users");
        userService.registerNewUser(user, UsersRoles.INDIVIDUAL);
        model.addObject("users", userService.findAll());
        return model;
    }


    @RequestMapping(value = "/users/register/organization", method = RequestMethod.POST)
    public ModelAndView registerOrganization(@Valid @ModelAttribute("user") User user, BindingResult result)
    {
        if (result.hasErrors())
        {
            final ModelAndView model = new ModelAndView("register");
            return model;
        }
        final ModelAndView model = new ModelAndView("users");
        userService.registerNewUser(user, UsersRoles.ORGANIZATION);
        model.addObject("users", userService.findAll());
        return model;
    }
}
