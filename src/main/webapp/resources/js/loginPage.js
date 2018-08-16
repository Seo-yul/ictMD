$(document).ready(function(){
  // No links pls
  $('.ui-button.inactive').click(function(){
    e.preventDefault();
  });
  
  $('#close').click(function(){
    $('.ui-panel').removeClass('bounceInDown').addClass('bounceOutUp');
    setTimeout(goHome,500);
  });
  
  $("submit").click(function(){
	 alert("!"); 
  });
  
  function goHome(){
	  $(location).attr("href","/ictmd");
  }
});