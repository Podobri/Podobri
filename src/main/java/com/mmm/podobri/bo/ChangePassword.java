/*
 * ChangePassword.java
 *
 * created at 28.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;


public class ChangePassword
{
    private String currentPassword;
    private String newPassword;
    private String reTypeNewPassword;


    public ChangePassword()
    {

    }


    public String getCurrentPassword()
    {
        return currentPassword;
    }


    public void setCurrentPassword(String currentPassword)
    {
        this.currentPassword = currentPassword;
    }


    public String getNewPassword()
    {
        return newPassword;
    }


    public void setNewPassword(String newPassword)
    {
        this.newPassword = newPassword;
    }


    public String getReTypeNewPassword()
    {
        return reTypeNewPassword;
    }


    public void setReTypeNewPassword(String reTypeNewPassword)
    {
        this.reTypeNewPassword = reTypeNewPassword;
    }
}
