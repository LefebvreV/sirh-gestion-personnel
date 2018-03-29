var filtreDepart = document.querySelector("#departementFiltre");
filtreDepart.addEventListener("change", addActivityItem, false);

function addActivityItem(){
      var filtre = filtreDepart.value      
      var xmlHttp = new XMLHttpRequest();
      var url = "lister?filtre=" + filtre;
      document.location.href = url;
}
