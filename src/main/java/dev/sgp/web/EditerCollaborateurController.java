package dev.sgp.web;

import java.io.IOException;
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

public class EditerCollaborateurController extends HttpServlet {
	
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
		
		// recupere la valeur d'un parametre dont le nom est avecPhoto
		String matricule = req.getParameter("matricule");
		resp.setContentType("text/html");

		if (matricule == null) {
			resp.sendError(400, "Un matricule est attendu");
		} else {
			
			req.setAttribute("collab", collabService.find(matricule));
			req.getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateurs.jsp")
			.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// recupere la valeur d'un parametre dont le nom est avecPhoto
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		

		
		
		
		
		
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