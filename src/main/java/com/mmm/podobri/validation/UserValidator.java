/*
 * UserValidator.java
 *
 * created at 20.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.validation;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mmm.podobri.model.User;


public class UserValidator
    implements Validator
{
    @Override
    public boolean supports(Class< ? > arg0)
    {
        return User.class.isAssignableFrom(arg0);
    }


    @Override
    public void validate(Object target, Errors errors)
    {
        User user = (User)target;
        if (!isValidEmailAddress(user.getEmail()))
        {
            errors.rejectValue("adresse_mail", "adresse_mail.notValid", "Not a valid email");
        }
    }


    public boolean isValidEmailAddress(String emailAddress)
    {
        String expression = "^[\\w\\-]([\\.\\w])+[\\w]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
        CharSequence inputStr = emailAddress;
        Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(inputStr);
        return matcher.matches();
    }
}
