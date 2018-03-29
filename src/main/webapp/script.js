$("#nomCreation").change(function(){
  $("#nomModal").html($(this).val());
});

$("#prenomCreation").change(function(){
  $("#prenomModal").html($(this).val());
});

$("#dateCreation").change(function(){
  $("#dateModal").html($(this).val());
});

$("#adresseCreation").change(function(){
  $("#adresseModal").html($(this).val());
});

$("#numeroCreation").change(function(){
  $("#numeroModal").html($(this).val());
});

document.querySelector("#buttonModal").addEventListener("click", function(){
  $("#collaborateurModal").modal();
});



/*document.querySelector("#confirmerCreation").addEventListener("click", function(){
  var nom = document.querySelector("#prenomCreation").value
  var prenom = document.querySelector("#nomCreation").value
  var date = document.querySelector("#dateCreation").value
  var adresse = document.querySelector("#adresseCreation").value
  var numero = document.querySelector("#numeroCreation").value

  if (numero != null && date != null && nom != "" && prenom != "" && adresse != ""){
      var temp = { lastName : nom , firstName : prenom , dateNaissance : date , adr : adresse , num : numero };
      var variable = JSON.stringify(temp);

      localStorage.setItem(numero, variable);
      window.location.href = "creer";
    }else {
      window.location.href = "creer?errors";
    }
});*/
