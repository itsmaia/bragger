function initializeMaterialize(){
  $(document).ready(function(){
    $('.sidenav').sidenav();
  });

  $(document).ready(function(){
    $('select').formSelect();
  });

  $('.datepicker').datepicker({
    autoClose: true
  });
  
  M.updateTextFields();
}

$(function(){
  initializeMaterialize()
});