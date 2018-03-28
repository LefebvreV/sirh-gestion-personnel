package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateurController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// recupere la valeur d'un parametre dont le nom est avecPhoto
		String matricule = req.getParameter("matricule");
		resp.setContentType("text/html");

		if (matricule == null) {
			resp.sendError(400, "Un matricule est attendu");
		} else {
			resp.getWriter().write("<h1>Edition de collaborateur</h1>" + "Matricule : " + matricule);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// recupere la valeur d'un parametre dont le nom est avecPhoto
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		resp.setContentType("text/html");

		if (matricule == null || titre == null || nom == null || prenom == null) {
			String messageErreur="Les paramètres suivant sont incorrects : ";
			if (matricule == null) {
				messageErreur += "matricule ";
			}
			if (titre == null) {
				messageErreur += "titre ";
			}
			if (nom == null) {
				messageErreur += "nom ";
			}
			if (prenom == null) {
				messageErreur += "prenom ";
			}
			resp.sendError(400, messageErreur);
		} else {
			resp.setStatus(201);
			resp.getWriter().write("<h1>Création d'un collaborateur</h1>" 
					+ "Matricule = " + matricule 
					+ ", titre = " + titre
					+ ", nom = " + nom
					+ ", prenom = " + prenom);
		}
	}
}