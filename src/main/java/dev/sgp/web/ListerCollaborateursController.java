package dev.sgp.web;

import java.util.List;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;
import dev.sgp.entite.*;

public class ListerCollaborateursController extends HttpServlet{
	
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private DepartementService departService = Constantes.DEPART_SERVICE;
	private List<String> listNomDepartement = new ArrayList<String>();
	
	
	{
		
		
		Collaborateur collab1 = new Collaborateur("CS1930-8-7", "Conan Doyle", "Sir Arthur", LocalDate.of(1930, 8, 7), 
				"221B Baker Street", "644156489745487", "SirArthur.ConanDoyle@societe.com", ZonedDateTime.now(), true, "", departService.getDepart(4));
		
		Collaborateur collab2 = new Collaborateur("TJ1892-1-3", "Tolkien", "John Ronald Reuel", LocalDate.of(1892, 1, 3), 
				"La terre du Milieu", "64545455545454657", "JohnRonaldReuel.Tolkien@societe.com", ZonedDateTime.now(), true, "", departService.getDepart(2));
		
		collabService.sauvegarderCollaborateur(collab1);
		collabService.sauvegarderCollaborateur(collab2);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		listNomDepartement.clear();
		for(Departement d : departService.listerDepartements()){
			listNomDepartement.add(d.getNom());
		}
		req.setAttribute("listNomDepartement",listNomDepartement);
		
		
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		String filtre = req.getParameter("filtre");
		if(filtre == null || filtre ==""){
			req.setAttribute("collaborateurs",collaborateurs);
		}else{
			if(filtre.equals("Tous")){
				req.setAttribute("collaborateurs",collaborateurs);
			}else{	
				List<Collaborateur> collaborateursFiltrer = new ArrayList<Collaborateur>();
				for (Collaborateur collab : collaborateurs){
					if(collab.getDepartement().getNom().equals(filtre)){
						collaborateursFiltrer.add(collab);
					}
				}
				req.setAttribute("collaborateurs",collaborateursFiltrer);
			}
		}
		
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
}
