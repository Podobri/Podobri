/*
 * FormsController.java
 *
 * created at 26.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/forms")
public class FormsController
{
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView createNewForm()
    {
        final ModelAndView model = new ModelAndView("formsBuilder");
        return model;
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addForm(@RequestParam("content") String content, @RequestParam("formName") String formName)
    {
        final ModelAndView model = new ModelAndView("formsBuilder");
        return model;
    }
}



