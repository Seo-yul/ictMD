$(document).ready(function(){
  // No links pls
 /* $('.ui-button.inactive').click(function(){
    e.preventDefault();
  });*/
  
  $('#close').click(function(){
    $('.ui-panel').removeClass('bounceInDown').addClass('bounceOutUp');
    setTimeout(goHome,500);
  });
  
  $("input[id=userPwd]").keydown(function(key){
	  if(key.keyCode == 13){
		  loginCheck();
	  }
  });
  
  $("#goLogin").click(function(){
	 //e.preventDefault();
	 loginCheck();
  });
  function goHome(){
	  $(location).attr("href","/ictmd");
  }
  function loginCheck(){
	  var userId = $("#userId").val();
	  var userPwd = $("#userPwd").val();
	  
	  if(userId == ""){
		  alert("아이디를 입력해주세요");
		  return;
	  } else if(userPwd == ""){
		  alert("비밀번호를 입력해주세요");
		  return;
	  } else {
		  $.ajax({
			 url:"loginCheck",
			 type:"post",
			 data:{
				 userId : userId,
				 userPwd : userPwd
			 },
			 success:function(data){
				 if(data == 1){
					location.href="/ictmd/imsi"
				 } else {
					alert("로그인실패! 아이디 혹은 비밀번호를 다시 확인해주세요");
					return;
				 }
			 }
		  });
			  
		  
	  }
  }
});