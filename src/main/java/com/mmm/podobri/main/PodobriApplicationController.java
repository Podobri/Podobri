package com.mmm.podobri.main;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mmm.podobri.service.UserService;


@Controller
public class PodobriApplicationController
{
    @Autowired
    UserService userService;


    @RequestMapping("/")
    public ModelAndView podobri()
    {
        final ModelAndView model = new ModelAndView("podobri");
        model.addObject("teaminfos", buildTeamInfoList());
        return model;
    }


    @RequestMapping("/about")
    public ModelAndView viewAbout()
    {
        final ModelAndView model = new ModelAndView("about");
        model.addObject("teaminfos", buildTeamInfoList());
        return model;
    }


    private List<TeamInfo> buildTeamInfoList()
    {
        List<TeamInfo> ourTeam = new ArrayList<TeamInfo>();
        ourTeam.add(new TeamInfo("Mariyan",
                                 "Valchev",
                                 "Developer",
                                 "+359 894 379 714",
                                 "m.valchev@seeburger.com",
                                 "Mariyan gruadate his engeneering degree in TU-Sofia in 2014. He is master of Computer science. He works as Java Developer at SEEBURGER INFORMATIC AD.He has over 2.5 years professional experience as developer."));
        ourTeam.add(new TeamInfo("Stefan",
                                 "Valchev",
                                 "Developer",
                                 "+359 888 123 456",
                                 "teko999@gmail.com",
                                 "Stefan is electrician engeneer.He complete his degree in TU-Sofia in 2014. He also like programming and he has more than 5 years non-professional experience. Now he works as PHP developer in PITO OOD."));
        ourTeam.add(new TeamInfo("Dimiter",
                                 "Penchev",
                                 "Developer",
                                 "+359 777 456 123",
                                 "d.penchev@gmail.com",
                                 "Dimiter is electrician engeneer.He complete his degree in TU-Sofia in 2014. He works as software developer from more than 2 years. His prefered program language is Java with smaller such. Now he works for Rila Solution."));
        return ourTeam;
    }
}
