/*
 * PDFBuilder.java
 *
 * created at 1.02.2015 ã. by Mariyan
 */
package com.mmm.podobri.util;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mmm.podobri.model.Event;
import com.mmm.podobri.model.EventsParticipant;
import com.mmm.podobri.model.Individual;


public class PDFBuilder
    extends AbstractPdfView
{

    @Override
    protected void buildPdfDocument(Map<String, Object> model,
                                    Document document,
                                    PdfWriter writer,
                                    HttpServletRequest request,
                                    HttpServletResponse response)
        throws Exception
    {
        // get data model which is passed by the Spring container
        Event event = (Event)model.get("event");
        List<EventsParticipant> participants = (List<EventsParticipant>)event.getEventsParticipants();

        document.add(new Paragraph("List with participants for event " + event.getTitle()));

        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[]{2.0f, 2.0f, 1.5f, 3.0f, 1.0f});
        table.setSpacingBefore(10);

        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN, FontFactory.defaultEncoding);
        font.setColor(BaseColor.WHITE);

        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(5);

        // write table header
        cell.setPhrase(new Phrase("Firstname", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Lastname", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Birthdate", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Email address", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Status", font));
        table.addCell(cell);

        // write table row data
        for (EventsParticipant participant : participants)
        {
            byte status = participant.getStatus();
            String statusText;
            if (status == 1)
            {
                statusText = "Approved";
            }
            else
            {
                statusText = "Not approved";
            }

            Individual individual = participant.getIndividual();
            table.addCell(individual.getFirstName());
            table.addCell(individual.getLastName());
            table.addCell(individual.getBirthdate().toString());
            table.addCell(individual.getUser().getEmail());
            table.addCell(statusText);
        }

        document.add(table);
    }
}
