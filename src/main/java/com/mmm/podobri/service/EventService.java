/*
 * EventService.java
 *
 * created at 21.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.service;


import java.util.List;

import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.OrganizationsForm;
import com.mmm.podobri.model.User;
import com.mmm.podobri.util.EditParticipants;
import com.mmm.podobri.util.EventsFilter;
import com.mmm.podobri.util.MailTemplate;


public interface EventService
    extends BaseDaoServices<Event>
{
    public enum EventStatus
    {
        NEW(0), INCOMING(1), PAST(2), INPROGRESS(3), REJECTED(4), FAILED(5);

        private final byte status;


        private EventStatus(int status)
        {
            this.status = (byte)status;
        }


        public byte getStatus()
        {
            return status;
        }


        public static String getStatusName(byte status)
        {
            switch (status)
            {
                case 0:
                    return NEW.name();
                case 1:
                    return INCOMING.name();
                case 2:
                    return PAST.name();
                case 3:
                    return INPROGRESS.name();
                case 4:
                    return REJECTED.name();
                case 5:
                    return FAILED.name();
                default:
                    return NEW.name();
            }
        }
    }

    public enum ApplyStatus
    {
        APPLIED(0), APPROVED(1), REJECTED(2), MAX_NUMBER_REACHED(3);

        private final byte status;


        private ApplyStatus(int status)
        {
            this.status = (byte)status;
        }


        public byte getStatus()
        {
            return status;
        }
    }


    public List<Event> search(EventsFilter filter);


    public Event createNewEvent(Event event);


    public boolean apply(Event event);


    public List<Event> getMyEvents();


    public void sendMailToAllParticipants(int eventId, MailTemplate template);


    public void sendMailToParticipant(int eventId, int userId, MailTemplate template);


    public void updateParticipants(EditParticipants participants);


    public List<Event> findEventsByParticipant(User user);


    public List<OrganizationsForm> getAvailableForms();
}
