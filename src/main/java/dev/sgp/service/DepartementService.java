package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Departement;


public class DepartementService {
	
	List<Departement> listeDepartement = new ArrayList<>();
	
	public DepartementService(){
		Departement tous = new Departement(0,"Tous");
		Departement compta = new Departement(1,"Comptabilite");
		Departement ressource = new Departement(2,"Ressources Humaines");
		Departement info = new Departement(3,"Informatique");
		Departement admin = new Departement(4,"Administratif");
		
		listeDepartement.add(tous);
		listeDepartement.add(compta);
		listeDepartement.add(ressource);
		listeDepartement.add(info);
		listeDepartement.add(admin);
	}

	
	public List<Departement> listerDepartements() {
		return listeDepartement;
	}
	
	public Departement getDepart(int id){
		for(Departement depart : listeDepartement){
			if(depart.getId()==id)
				return depart;
		}
		
		return null;
		
	}
	
	public Departement find(String nom){
		for(Departement depart : listeDepartement){
			if(depart.getNom().equals(nom))
				return depart;
		}
		
		return null;
		
	}
}
