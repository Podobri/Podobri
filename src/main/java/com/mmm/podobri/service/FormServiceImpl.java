package com.mmm.podobri.service;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.FormDao;
import com.mmm.podobri.model.Organization;
import com.mmm.podobri.model.OrganizationsForm;
import com.mmm.podobri.model.User;


@Service("formService")
@Transactional
public class FormServiceImpl
    implements FormService
{
    @Autowired
    private FormDao formDao;

    @Autowired
    private UserService userService;


    @Override
    public OrganizationsForm findOne(int id)
    {
        return formDao.findOne(id);
    }


    @Override
    public List<OrganizationsForm> findAll()
    {
        return formDao.findAll();
    }


    @Override
    public void save(OrganizationsForm entity)
    {
        formDao.save(entity);
    }


    @Override
    public OrganizationsForm update(OrganizationsForm entity)
    {
        return formDao.update(entity);
    }


    @Override
    public void delete(OrganizationsForm entity)
    {
        formDao.delete(entity);
    }


    @Override
    public void deleteById(int id)
    {
        formDao.deleteById(id);
    }


    @Override
    public DaoUtils getDaoUtils()
    {
        return formDao.getDaoUtils();
    }


    @Override
    public void saveInTransaction(Serializable... entities)
    {
        formDao.saveInTransaction(entities);
    }


    public void saveForm(String content, String name)
    {
        // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // String username = auth.getName(); //get logged in username
        String username = "organization";
        User currentUser = userService.findByUserName(username);
        Organization organization = currentUser.getOrganization();
        OrganizationsForm form = new OrganizationsForm();
        form.setForm(content);
        form.setName(name);
        form.setIsActive(true);
        form.setOrganization(organization);
        form.setType(FormService.FormTypes.APPLICATION.getStatus());
        form.setCreated(new Date());
        save(form);
    }


    public OrganizationsForm getForm(String formName)
    {
        User currentUser = getCurrentUser();
        return formDao.findOne(currentUser.getId(), formName);
    }


    @Override
    public List<OrganizationsForm> getOrganizationForms()
    {
        User currentUser = getCurrentUser();
        List<OrganizationsForm> forms = formDao.findAllByOrganization(currentUser.getId());
        return forms;
    }


    private User getCurrentUser()
    {
        // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // String username = auth.getName(); //get logged in username
        String username = "organization";
        User currentUser = userService.findByUserName(username);
        return currentUser;
    }
}
