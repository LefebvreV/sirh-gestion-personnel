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
	          <h1>Nouveau collaborateur</h1>
	        </div>
	      </div>
	      <form method="POST" action="<%=request.getContextPath() %>/collaborateurs/creer">
	        <div class="row mb-3">
	          <div class="col-2 offset-2">
	            <label class="col-form-label">Nom</label>
	          </div>
	          <div class="col-4">
	            <input type="text" class="form-control" id="nomCreation" name="nomCreation">
	            <div class="invalid-feedback">
	              Le nom est obligatoire.
	            </div>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-2 offset-2">
	            <label class="col-form-label">Prénom</label>
	          </div>
	          <div class="col-4">
	            <input type="text" class="form-control" id="prenomCreation" name="prenomCreation">
	            <div class="invalid-feedback">
	              Le prénom est obligatoire.
	            </div>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-2 offset-2">
	            <label class="col-form-label">Date de naissance</label>
	          </div>
	          <div class="col-4">
	            <input type="date" class="form-control" id="dateCreation" name="dateCreation">
	            <div class="invalid-feedback">
	              La date de naissance est obligatoire.
	            </div>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-2 offset-2">
	            <label class="col-form-label">Adresse</label>
	          </div>
	          <div class="col-4">
	            <input type="text" class="form-control" id="adresseCreation" name="adresseCreation">
	            <div class="invalid-feedback">
	              L'adresse est obligatoire.
	            </div>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-2 offset-2">
	            <label class="col-form-label">Numero de sécurité sociale</label>
	          </div>
	          <div class="col-4">
	            <input type="text" class="form-control" id="numeroCreation" name="numeroCreation">
	            <div class="invalid-feedback">
	              Le numéro de sécurité sociale est obligatoire.
	            </div>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-2 offset-2">
	            <label class="col-form-label">Département</label>
	          </div>
	          <div class="col-4">
	         	 <div class="form-group">
		            <select class="form-control" name="departementFiltre" id="departementFiltre">
			              <% 
					      List<String> listeNomDepartement =(List<String>)request.getAttribute("listNomDepartement");
					      for (String nom : listeNomDepartement) {   
					    	 %>
					         <option value="<%= nom %>"><%= nom %></option>
					         <%  
					      }
					      %>
		              </select>
	              </div>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col offset-7">
	            <button type="button" class="btn btn-primary" id="buttonModal" name="buttonModal">
	              Créer
	            </button>
	
	          </div>
	        </div>
	        <div class="modal fade" id="collaborateurModal" role="dialog">
	          <div class="modal-dialog">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h5 class="modal-title">Création d'un collaborateur</h5>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                <span class="glyphicon glyphicon-lock"></span>
	              </div>
	              <div class="modal-body">
	                <div class="container-fluid">
	                  <div class="row">
	                    <div class="col">
	                      <p>Nom</p>
	                    </div>
	                    <div class="col">
	                      <p id="nomModal"></p>
	                    </div>
	                  </div>
	                  <div class="row">
	                    <div class="col">
	                      <p>Prénom</p>
	                    </div>
	                    <div class="col">
	                      <p id="prenomModal"></p>
	                    </div>
	                  </div>
	                  <div class="row">
	                    <div class="col">
	                      <p>Date de naissance</p>
	                    </div>
	                    <div class="col">
	                      <p id="dateModal"></p>
	                    </div>
	                  </div>
	                  <div class="row">
	                    <div class="col">
	                      <p>Adresse</p>
	                    </div>
	                    <div class="col">
	                      <p id="adresseModal"></p>
	                    </div>
	                  </div>
	                  <div class="row">
	                    <div class="col">
	                      <p>Numéro de sécurité sociale</p>
	                    </div>
	                    <div class="col">
	                      <p id="numeroModal"></p>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
	                <button type="submit" class="btn btn-success" id="confirmerCreation" name="confirmerCreation">Confirmer</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </form>
	    </div>
	   
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	    <script src="<%=request.getContextPath() %>/script.js"></script>
	    <script src="<%=request.getContextPath() %>/errors.js"></script>
	</body>
</html>