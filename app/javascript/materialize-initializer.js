function initializeMaterialize(){
  $(document).ready(function(){
    $('.sidenav').sidenav();
  });

  $(document).ready(function(){
    $('select').formSelect();
  });
  
  M.updateTextFields();
}

$(document).on('turbolinks:load', function() {
  initializeMaterialize();
})

$(document).ready(function(){
  $('select').formSelect();
});
$(document).ready(function(){
  $('.sidenav').sidenav();
});