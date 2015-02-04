/*
 * EditParticipants.java
 *
 * created at 28.01.2015 ã. by Mariyan
 */
package com.mmm.podobri.bo;


import java.util.List;

import com.mmm.podobri.model.EventsParticipant;


public class EditParticipants
{
    private List<EventsParticipant> participantsList;


    public EditParticipants()
    {

    }


    public List<EventsParticipant> getParticipantsList()
    {
        return participantsList;
    }


    public void setParticipantsList(List<EventsParticipant> participantsList)
    {
        this.participantsList = participantsList;
    }
}
