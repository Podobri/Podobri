package com.mmm.podobri.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController
{
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("login");
        if (error != null)
        {
            model.addObject("error", "Invalid username and password");
            // login form for update page
            // if login error, get the targetUrl from session again.
            String targetUrl = getRememberMeTargetUrlFromSession(request);
            System.out.println(targetUrl);
            if (StringUtils.hasText(targetUrl))
            {
                model.addObject("targetUrl", targetUrl);
                model.addObject("loginUpdate", true);
            }
        }
        return model;
    }


    /**
     * Check if user is login by remember me cookie, refer
     * org.springframework.security.authentication.AuthenticationTrustResolverImpl
     */
    private boolean isRememberMeAuthenticated()
    {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null)
        {
            return false;
        }

        return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
    }


    /**
     * save targetURL in session
     */
    private void setRememberMeTargetUrlToSession(HttpServletRequest request)
    {
        HttpSession session = request.getSession(false);
        if (session != null)
        {
            session.setAttribute("targetUrl", "/");
        }
    }


    /**
     * get targetURL from session
     */
    private String getRememberMeTargetUrlFromSession(HttpServletRequest request)
    {
        String targetUrl = "";
        HttpSession session = request.getSession(false);
        if (session != null)
        {
            targetUrl = session.getAttribute("targetUrl") == null ? "" : session.getAttribute("targetUrl").toString();
        }
        return targetUrl;
    }
}
