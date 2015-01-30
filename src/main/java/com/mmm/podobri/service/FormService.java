package com.mmm.podobri.service;

import java.util.List;

import com.mmm.podobri.model.OrganizationsForm;

public interface FormService extends BaseDaoServices<OrganizationsForm>
{
    public enum FormTypes
    {
        APPLICATION(0), REJECTION(1), CHECKING(2);

        private final byte status;


        private FormTypes(int status)
        {
            this.status = (byte)status;
        }


        public byte getStatus()
        {
            return status;
        }
    }
    
    public void saveForm(String content, String formName);
    public OrganizationsForm getForm(String formName);
    public List<OrganizationsForm> getOrganizationForms();
}
