/*
 * EventServiceImpl.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mmm.podobri.bo.EditParticipants;
import com.mmm.podobri.bo.EventsFilter;
import com.mmm.podobri.bo.MailTemplate;
import com.mmm.podobri.dao.DaoUtils;
import com.mmm.podobri.dao.EventDao;
import com.mmm.podobri.model.City;
import com.mmm.podobri.model.Country;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.EventCostType;
import com.mmm.podobri.model.EventsParticipant;
import com.mmm.podobri.model.EventsProgram;
import com.mmm.podobri.model.Lector;
import com.mmm.podobri.model.Opportunity;
import com.mmm.podobri.model.OpportunityCategory;
import com.mmm.podobri.model.OrganizationsForm;
import com.mmm.podobri.model.Sponsor;
import com.mmm.podobri.model.User;
import com.mmm.podobri.util.FileUploadUtil;


@Service("eventService")
@Transactional
public class EventServiceImpl
    implements EventService
{
    @Autowired
    private EventDao eventDao;

    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    @Autowired
    private FormService formService;


    @Override
    public Event findOne(int id)
    {
        return eventDao.findOne(id);
    }


    @Override
    public List<Event> findAll()
    {
        return eventDao.findAll();
    }


    @Override
    public void save(Event entity)
    {
        eventDao.save(entity);
    }


    @Override
    public Event update(Event entity)
    {
        entity.setModified(new Date());
        return eventDao.update(entity);
    }


    @Override
    public void delete(Event entity)
    {
        eventDao.delete(entity);
    }


    @Override
    public void deleteById(int id)
    {
        eventDao.deleteById(id);
    }


    @Override
    public DaoUtils getDaoUtils()
    {
        return eventDao.getDaoUtils();
    }


    @Override
    public void saveInTransaction(Serializable... entities)
    {
        eventDao.saveInTransaction(entities);
    }


    @Override
    public List<Event> search(EventsFilter filter)
    {
        return eventDao.search(filter);
    }


    @Override
    public Event createNewEvent(Event event)
    {
        Date dateFrom = event.getDateFrom();
        Date dateTo = event.getDateTo();
        Date deadline = event.getDeadline();
        boolean isDateValid = validateDate(dateFrom, dateTo, deadline);
        if (!isDateValid)
        {

        }

        if (event.getEventsPrograms() != null)
        {
            for (EventsProgram ep : event.getEventsPrograms())
            {
                ep.setEvent(event);
            }
        }

        if (event.getLectors() != null)
        {
            for (Lector l : event.getLectors())
            {
                if (l != null)
                {
                    CommonsMultipartFile pictureFile = l.getPictureFile();
                    if (pictureFile != null)
                    {
                        String imageName = FileUploadUtil.processImages(pictureFile, true, true);
                        l.setPicture(imageName);
                    }
                }
            }
        }

        if (event.getSponsors() != null)
        {
            for (Sponsor s : event.getSponsors())
            {
                if (s != null)
                {
                    CommonsMultipartFile pictureFile = s.getPictureFile();
                    if (pictureFile != null)
                    {
                        String imageName = FileUploadUtil.processImages(pictureFile, true, false);
                        s.setPicture(imageName);
                    }
                }
            }
        }

        CommonsMultipartFile pictureFile = event.getPictureFile();
        if(pictureFile != null)
        {
            String imageName = FileUploadUtil.processImages(pictureFile, false, true);
            event.setPicture(imageName);
        }

        DaoUtils daoUtils = getDaoUtils();

        byte opportunityCaregoryId = event.getOpportunityCategory().getId();
        OpportunityCategory opportunityCategory = daoUtils.getOpportunityCategoryById(opportunityCaregoryId);
        event.setOpportunityCategory(opportunityCategory);

        byte opportunityId = event.getOpportunity().getId();
        Opportunity opportunity = daoUtils.getOpportunityById(opportunityId);
        event.setOpportunity(opportunity);

        byte costTypeId = event.getEventCostType().getId();
        EventCostType eventCostType = daoUtils.getEventCostTypeById(costTypeId);
        event.setEventCostType(eventCostType);

        byte countryId = event.getCountry().getId();
        Country country = daoUtils.getCountryById(countryId);
        event.setCountry(country);

        int cityId = event.getCity().getId();
        City city = daoUtils.getCityById(cityId);
        event.setCity(city);

        String formName = event.getForm().getName();
        if (formName != null && !formName.isEmpty())
        {
            OrganizationsForm form = formService.getForm(formName);
            event.setForm(form);
        }
        else
        {
            event.setForm(null);
        }

        event.setStatus(EventStatus.INCOMING.getStatus());
        Date currentDate = new Date();
        event.setCreated(currentDate);
        event.setModified(currentDate);
        User user = userService.findOne(getCurrentUser().getId());
        event.setUser(user);
        save(event);
        return event;
    }


    public boolean apply(Event event)
    {
        User currentUser = getCurrentUser();
        EventsParticipant participant = new EventsParticipant();
        event.addEventsParticipant(participant);
        currentUser.getIndividual().addEventsParticipant(participant);
        participant.setStatus(ApplyStatus.APPLIED.getStatus());
        eventDao.update(event);
        return true;
    }


    public boolean confirmApplication(Event event, int userId)
    {
        List<EventsParticipant> eventsParticipants = event.getEventsParticipants();
        for (EventsParticipant ep : eventsParticipants)
        {
            if (ep.getUserId() == userId && ep.getEventId() == event.getId())
            {
                ep.setStatus(ApplyStatus.APPROVED.getStatus());
                break;
            }
        }
        eventDao.update(event);
        return true;
    }


    private boolean validateDate(Date dateFrom, Date dateTo, Date deadline)
    {
        if (dateTo.equals(dateFrom) || dateTo.before(dateFrom))
        {
            return false;
        }

        if (deadline.after(dateTo) || deadline.before(dateFrom))
        {
            return false;
        }
        return true;
    }


    public List<Event> getMyEvents()
    {
        User currentUser = getCurrentUser();
        int currentUserId = currentUser.getId();
        List<Event> myEvents = eventDao.findEventsByOrganizator(currentUserId);
        return myEvents;
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void sendMailToAllParticipants(int eventId, MailTemplate template)
    {
        Event event = findOne(eventId);
        List<EventsParticipant> eventsParticipants = event.getEventsParticipants();
        for (EventsParticipant ep : eventsParticipants)
        {
            int userId = ep.getUserId();
            sendMailToParticipant(eventId, userId, template);
        }
    }


    @Override
    public void sendMailToParticipant(int eventId, int userId, MailTemplate template)
    {
        User currentUser = getCurrentUser();
        template.setFrom(currentUser.getEmail());
        User toUser = userService.findOne(userId);
        template.setTo(toUser.getEmail());
        mailService.sendMail(template.toMailMessage());
    }


    public void updateParticipants(EditParticipants participants)
    {
        Event event = null;
        List<EventsParticipant> participantsList = participants.getParticipantsList();
        for (EventsParticipant edited : participantsList)
        {
            event = findOne(edited.getEventId());
            break;
        }

        if (event != null)
        {
            event.setEventsParticipants(participantsList);
            update(event);
        }
    }


    @Override
    public List<Event> findEventsByParticipant(User user)
    {
        return eventDao.findEventsByParticipant(user);
    }


    @Override
    public List<OrganizationsForm> getAvailableForms()
    {
        List<OrganizationsForm> organizationForms = formService.getOrganizationForms();
        return organizationForms;
    }


    private User getCurrentUser()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // get logged in username
        User currentUser = userService.findByUserName(username);
        return currentUser;
    }
}
