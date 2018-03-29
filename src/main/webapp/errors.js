var url = location.search;
if (url == '?errors') {
  if (window.location.href.includes('creer')) {
    var erreurs = document.querySelectorAll('input');
    erreurs.forEach(param => {param.classList.add('is-invalid')});
  }
  if (window.location.href.includes('editer')) {
    var erreurs = document.querySelectorAll('#accordion input');
    erreurs.forEach(param => {param.classList.add('is-invalid')});
  }
}
