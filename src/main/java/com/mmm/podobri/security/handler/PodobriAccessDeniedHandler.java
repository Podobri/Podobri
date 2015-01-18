package com.mmm.podobri.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class PodobriAccessDeniedHandler implements AccessDeniedHandler 
{
	private String accessDeniedUrl = "/error/";

	@Override
	public void handle(HttpServletRequest request,
			HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException,
			ServletException 
	{
		request.getRequestDispatcher(accessDeniedUrl).forward(request, response);
	}

	public String getAccessDeniedUrl() 
	{
		return accessDeniedUrl;
	}

	public void setAccessDeniedUrl(String accessDeniedUrl) 
	{
		this.accessDeniedUrl = accessDeniedUrl;
	}
}
