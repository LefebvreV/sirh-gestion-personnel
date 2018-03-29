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
	      <div class="row mt-4">
	        <div class="col-lg-4 col-md-12 mb-4">
	          <img src="<%=request.getContextPath() %>/images/placeholder.png" class="img-fluid" alt="Désolé on n'a plus l'image">
	        </div>
	        <div class="col-lg-6 ml-5">
	          <div class="container-fluid">
	            <div class="row">
	              <div class="col-9"><%
	            		  Collaborateur collab =(Collaborateur)request.getAttribute("collab");
	              %>
	                <h2><%= collab.getPrenom() %>  <%= collab.getNom() %> - <%= collab.getMatricule() %></h2>
	              </div>
	              <div class="col">
	                <div class="form-check">
	                  <input class="form-check-input" type="checkbox" > Désactiver
	                </div>
	              </div>
	            </div>
	            <form id="edit-form">
	                <div id="accordion">
	                  <div class="card">
	                    <div class="card-header" id="headingOne">
	                      <h5 class="mb-0">
	                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	                          Identité
	                        </button>
	                      </h5>
	                    </div>
	                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
	                      <div class="card-body">
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Civilité</label>
	                          </div>
	                          <div class="col-7">
	                            <select class="form-control">
	                              <option>M.</option>
	                              <option>Mme.</option>
	                            </select>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Nom</label>
	                          </div>
	                          <div class="col-7">
	                            <input type="text" class="form-control"></input>
	                            <div class="invalid-feedback">
	                              Le nom est obligatoire.
	                            </div>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Prenom</label>
	                          </div>
	                          <div class="col-7">
	                            <input type="text" class="form-control"></input>
	                            <div class="invalid-feedback">
	                              Le prenom est obligatoire.
	                            </div>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Date de naissance</label>
	                          </div>
	                          <div class="col-7">
	                              <input type="date" class="form-control"></input>
	                              <div class="invalid-feedback">
	                                La date de naissance est obligatoire.
	                              </div>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Adresse</label>
	                          </div>
	                          <div class="col-7">
	                              <input type="text" class="form-control"></input>
	                              <div class="invalid-feedback">
	                                L'adresse est obligatoire.
	                              </div>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Numéro de sécurité sociale</label>
	                          </div>
	                          <div class="col-7">
	                              <input type="text" class="form-control"></input>
	                              <div class="invalid-feedback">
	                                Le numéro de sécurité sociale est obligatoire.
	                              </div>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">Téléphone</label>
	                          </div>
	                          <div class="col-7">
	                            <input type="number" class="form-control"></input>
	                            <div class="invalid-feedback">
	                              Le téléphone est obligatoire.
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="card">
	                    <div class="card-header" id="headingTwo">
	                      <h5 class="mb-0">
	                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	                          Poste
	                        </button>
	                      </h5>
	                    </div>
	                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
	                      <div class="card-body">
	                        <div class="form-group row">
	                          <div class="col">
	                            <div class="form-group row">
	                              <div class="col-5">
	                                <label class="col-form-label floatRight">Département</label>
	                              </div>
	                              <div class="col-7">
	                                <select class="form-control">
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
	                            <div class="form-group row">
	                              <div class="col-5">
	                                <label class="col-form-label floatRight">Nom</label>
	                              </div>
	                              <div class="col-7">
	                                <input type="text" class="form-control"></input>
	                                <div class="invalid-feedback">
	                                  Le nom est obligatoire.
	                                </div>
	                              </div>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="card">
	                    <div class="card-header" id="headingThree">
	                      <h5 class="mb-0">
	                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	                          Coordonnées Bancaires
	                        </button>
	                      </h5>
	                    </div>
	                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
	                      <div class="card-body">
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">IBAN</label>
	                          </div>
	                          <div class="col-7">
	                            <input type="text" class="form-control"></input>
	                            <div class="invalid-feedback">
	                              L'IBAN est obligatoire.
	                            </div>
	                          </div>
	                        </div>
	                        <div class="form-group row">
	                          <div class="col-5">
	                            <label class="col-form-label floatRight">BIC</label>
	                          </div>
	                          <div class="col-7">
	                            <input type="text" class="form-control"></input>
	                            <div class="invalid-feedback">
	                              Le BIC est obligatoire.
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	            </form>
	            <div class="floatRight">
	              <button form="edit-form" type="submit" class="btn btn-primary">Sauvegarder</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>