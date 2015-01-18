package com.mmm.podobri.util;


import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.security.web.util.AntUrlPathMatcher;


public final class UrlPathUtil
{

    /**
     * Match a HTTP request against a list of URL patterns. ANT-style wildcards are supported in the URL
     * patterns.
     *
     * @return the URL which matched the HTTP request, or <code>null</code> if none matched.
     */
    public static String matchUrl(HttpServletRequest request, List<String> listOfURLs)
    {
        return matchUrl(request.getServletPath(), request.getPathInfo(), request.getQueryString(), listOfURLs);
    }


    /**
     * Match a HTTP request against a list of URL patterns. ANT-style wildcards are supported in the URL
     * patterns.
     *
     * @return the URL which matched the HTTP request, or <code>null</code> if none matched.
     */
    public static String matchUrl(DefaultSavedRequest request, List<String> listOfURLs)
    {
        return matchUrl(request.getServletPath(), request.getPathInfo(), request.getQueryString(), listOfURLs);
    }


    /**
     * Match an absolute URL against a list of URL patterns. ANT-style wildcards are supported in the URL
     * patterns.
     *
     * @return the URL which matched the HTTP request, or <code>null</code> if none matched.
     */
    public static String matchUrl(String url, HttpServletRequest request, List<String> listOfURLs)
    {
        return matchUrl(url.replaceFirst("[^:]+://[^/]*" + Pattern.quote(request.getContextPath()), ""), listOfURLs);
    }


    private static String matchUrl(String servletPath, String pathInfo, String queryString, List<String> listOfURLs)
    {
        StringBuilder url = new StringBuilder(servletPath);
        if (pathInfo != null)
        {
            url.append(pathInfo);
        }
        if (queryString != null)
        {
            url.append("?").append(queryString);
        }
        return matchUrl(url.toString(), listOfURLs);
    }


    static String matchUrl(String url, List<String> listOfURLs)
    {
        // do not match query string and trailing slash against path patterns
        String matchUrl = url.replaceFirst("\\?.*$", "").replaceFirst("/$", "");

        AntUrlPathMatcher matcher = new AntUrlPathMatcher(false);
        for (String pattern : listOfURLs)
        {
            if (matcher.pathMatchesUrl(matcher.compile(pattern), matchUrl))
            {
                return url;
            }
        }
        return null;
    }


    private UrlPathUtil()
    {}
}
