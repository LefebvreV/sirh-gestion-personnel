package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

public class CreerCollaborateurController extends HttpServlet {
	
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private DepartementService departService = Constantes.DEPART_SERVICE;
	private List<String> listNomDepartement = new ArrayList<String>();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		listNomDepartement.clear();
		for(Departement d : departService.listerDepartements()){
			if(!d.getNom().equals("Tous"))
				listNomDepartement.add(d.getNom());
		}
		req.setAttribute("listNomDepartement",listNomDepartement);
		
		req.getRequestDispatcher("/WEB-INF/views/collab/creerCollaborateurs.jsp")
		.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nomParam = req.getParameter("nomCreation");
		String prenomParam = req.getParameter("prenomCreation");
		String adresseParam = req.getParameter("adresseCreation");
		String date = req.getParameter("dateCreation");
		LocalDate dateParam = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String numeroParam = req.getParameter("numeroCreation");
		String departementParam = req.getParameter("departementFiltre");
		Departement departement = (departService.find(departementParam));
		String matricule = nomParam.substring(0, 1) + prenomParam.substring(0,1) + dateParam;
		String email = prenomParam + "." + nomParam + "@societe.com";
		
		
		Collaborateur collab = new Collaborateur(matricule, nomParam, prenomParam, dateParam, 
				adresseParam, numeroParam, email, ZonedDateTime.now(), true, "", departement);
		
		collabService.sauvegarderCollaborateur(collab);
		
		listNomDepartement.clear();
		for(Departement d : departService.listerDepartements()){
			listNomDepartement.add(d.getNom());
		}
		req.setAttribute("listNomDepartement",listNomDepartement);
		
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		req.setAttribute("collaborateurs",collaborateurs);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
		
	}
}
