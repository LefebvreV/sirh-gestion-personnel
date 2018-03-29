package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Collaborateur;

public class CollaborateurService {
	List<Collaborateur> listeCollaborateurs = new ArrayList<>();

	public List<Collaborateur> listerCollaborateurs() {
		return listeCollaborateurs;
	}

	public void sauvegarderCollaborateur(Collaborateur collab) {
		listeCollaborateurs.add(collab);
	}
	
	public Collaborateur find(String matricule){
		for(Collaborateur collab : listeCollaborateurs){
			if(collab.getMatricule().equals(matricule))
				return collab;
		}
		
		return null;
	}
}
