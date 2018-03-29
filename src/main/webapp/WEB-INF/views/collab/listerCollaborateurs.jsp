<%@page import="java.util.List" %>
<%@page import="dev.sgp.entite.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/sketchy/bootstrap.min.css">
  		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
		<title>SGP - App</title>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
	      <a class="navbar-brand" href="#"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarSupportedContent">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item active"><a class="nav-link" href="lister">Collaborateurs</a></li>
	          <li class="nav-item"><a class="nav-link" href="">Statistiques</a></li>
	          <li class="nav-item"><a class="nav-link" href="">Activités</a></li>
	        </ul>
	      </div>
	    </nav>
	    <div class="container-fluid">
	      <div class="row">
	        <div class="col">
	          <a href="creer"><button type="submit"  class="btn btn-primary floatRight">Ajouter un nouveau collaborateur</button></a>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col">
	          <header>
	            <h1>Les collaborateurs</h1>
	          </header>
	        </div>
	      </div>
	      <form method="POST" action="<%=request.getContextPath() %>/collaborateurs/lister">
	        <div class="row">
	          <div class="col">
	              Rechercher un collaborateur dont le nom ou le prénom commence par :
	          </div>
	          <div class="col">
	            <div class="form-group">
	              <input type="text" id="nomRecherche" name="nomRecherche" placeHolder="NonFonctionnel">
	              <button type="submit" class="btn btn-primary" id="boutonRechercher" name="boutonRechercher">Rechercher</button>
	            </div>
	          </div>
	          <div class="col">
	            <div class="form-group">
	              <label class="form-check-label">
	                <div class="form-check">
	                  <input class="form-check-input" type="checkbox" id="collabDesactive" name="collabDesactive"> Voir les collaborateurs désactivés
	                </div>
	              </label>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-4">
	            Filtrer par département :
	          </div>
	          <div class="col-2">
	            <div class="form-group">
	              <select class="form-control" name="departementFiltre" id="departementFiltre">
		              <% 
				      List<String> listeNomDepartement =(List<String>)request.getAttribute("listNomDepartement");
				      for (String nom : listeNomDepartement) {   
				    	  if(nom.equals(request.getParameter("filtre"))){
				    		  %>
				                <option value="<%= nom %>" selected><%= nom %></option>
				                <%  
				    	  }else{
				    		  %>
				                <option value="<%= nom %>"><%= nom %></option>
				                <%  
				    	  }
				      }
				      %>
	              </select>
	            </div>
	          </div>
	        </div>
	      </form>
	      
	      <% 
	      List<Collaborateur> listeCollab =(List<Collaborateur>)request.getAttribute("collaborateurs");
	      int compteur =0;
	      for (Collaborateur collab : listeCollab) {   
	    	  if(compteur%3==0){
	    		  %>
	    		  <div class = "row">
	    		 
	    		 <%  
	    	  }
	    	  
	    	  %>
	      	
	        <div class="col-lg-4 col-sm-12 col-md-6">
	          <div class="card" style="width: 18rem;">
	            <div class="card-header">
	             	<%= collab.getPrenom() %>  <%= collab.getNom() %> - <%= collab.getMatricule() %>
	            </div>
	            <img class="card-img-top" src="<%=request.getContextPath() %>/images/placeholder.png" alt="Photo">
	            <div class="card-body">
	              <p class="card-text">Adresse :  <%=collab.getAdresse() %></p>
	              <p class="card-text">Date de Naissance :  <%=collab.getDateNaissance() %></p>
	              <p class="card-text">Numero de sécurité sociale :  <%=collab.getNumeroSociale() %></p>
	              <p class="card-text">EmailPro :  <%=collab.getEmailPro() %></p>
	              <a href="editer?matricule=<%=collab.getMatricule()%>"><button type="button" class="btn btn-primary floatRight" >Editer</button></a>
	            </div>
	          </div>
	        </div>
	      <%  
	      	if((compteur+1)%3==0){
	    		  %>
	    		  </div>
	    		 
	    		 <%  
	    	 }
	      	compteur++;
	      }
	      %>
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath() %>/filtre.js"></script>
	</body>
</html>