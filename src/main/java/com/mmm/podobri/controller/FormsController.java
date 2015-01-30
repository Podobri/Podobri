/*
 * FormsController.java
 *
 * created at 26.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mmm.podobri.model.OrganizationsForm;
import com.mmm.podobri.service.FormService;

@Controller
@RequestMapping("/forms")
public class FormsController
{
    @Autowired
    private FormService formService;
    
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView createNewForm()
    {
        final ModelAndView model = new ModelAndView("forms/formsBuilder");
        return model;
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addForm(@RequestParam("content") String content, @RequestParam("formName") String formName)
    {
        final ModelAndView model = new ModelAndView("forms/formsBuilder");
        formService.saveForm(content, formName);
        return model;
    }
    
    @RequestMapping(value = "/viewForms", method = RequestMethod.GET)
    public ModelAndView viewForms()
    {
        final ModelAndView model = new ModelAndView("forms/forms");
        List<OrganizationsForm> forms = formService.getOrganizationForms();
        model.addObject("forms", forms);
        return model;
    }
    
    @RequestMapping(value = "/viewForm/{name}", method = RequestMethod.GET)
    public ModelAndView viewForm(@PathVariable String name)
    {
        final ModelAndView model = new ModelAndView("forms/viewForm");
        OrganizationsForm form = formService.getForm(name);
        model.addObject("formContent", form.getForm());
        return model;
    }
}



