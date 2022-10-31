/* js/checkRegister.js */

function checkID() {
   var id = $("#id").val();
   if(id ==""){
      $('#idLabel1').css('display','none');
      $('#idLabel2').css('display','block');
      $('#idLabel3').css('display','none');
   } else {
         $.ajax({ 
            url : "idCheck",
            data :{id : id},
            type : "post",
            success : function(cnt){
               if(cnt == 0) {
                  $('#idLabel1').css('display','none');
                  $('#idLabel2').css('display','none');
                  $('#idLabel3').css('display','block');
                  
               } else {
               	  $('#idLabel1').css('display','block');
               	  $('#idLabel2').css('display','none');
                  $('#idLabel3').css('display','none');               		   
               }
            }, error : function() {
               alert("서버요청실패");
            }
         });
      
   }
   
}


function checkPw() {
	var pw = $("#pw").val();
	if(pw ==""){
		$('#pwLabel1').css('display','none');
		$('#pwLabel2').css('display','block');
	} else {
		$('#pwLabel1').css('display','block');
		$('#pwLabel2').css('display','none');
	}
}

function checkPwChk() {
	var pwChk = $("#pwChk").val();
	var pw = $("#pw").val();
	if(pwChk != pw){
		$('#pwChkLabel1').css('display','none');
		$('#pwChkLabel2').css('display','block');
	} else {
		$('#pwChkLabel1').css('display','block');
		$('#pwChkLabel2').css('display','none');
	}
}

function checkName() {
	var name = $("#name").val();
	if(name ==""){
		$('#nameLabel1').css('display','none');
		$('#nameLabel2').css('display','block');
	} else {
		$('#nameLabel1').css('display','block');
		$('#nameLabel2').css('display','none');
	}
}

function checkEmail() {
	var email = $("#email").val();
	if(email ==""){
		$('#emailLabel1').css('display','none');
		$('#emailLabel2').css('display','block');
	} else {
		$('#emailLabel1').css('display','block');
		$('#emailLabel2').css('display','none');
	}
}

function checkTel() {
	if($("#tel1").val() != "" && $("#tel2").val() != "" && $("#tel3").val() != ""){
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		var tel = "";
		tel = tel+tel1+tel2+tel3;
		$("#tel").val(tel);
	}
}
function checkBd() {
	var birthDay = $("#birthDay").val();
	if(birthDay ==""){
		$('#bdLabel1').css('display','none');
		$('#bdLabel2').css('display','block');
	} else {
		$('#bdLabel1').css('display','block');
		$('#bdLabel2').css('display','none');
	}
}






function checkWrite(){
	if(document.registerForm.id.value==""){
		alert("id 를 입력하세요");
		document.registerForm.id.focus();
	}  else if(document.registerForm.pw.value==""){
		alert("비밀번호를 입력하세요");
		document.registerForm.pw.focus();
	} else if(document.registerForm.pw.value != document.registerForm.pwChk.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.registerForm.pwChk.focus();
	} else if(document.registerForm.name.value==""){
		alert("이름을 입력하세요");
		document.registerForm.name.focus();
	} else if(document.registerForm.email.value==""){
		alert("이메일을 입력하세요");
		document.registerForm.email.focus();
	} else if(document.registerForm.tel2.value==""){
		alert("전화번호 입력하세요");
		document.registerForm.tel2.focus();
	} else if(document.registerForm.tel3.value==""){
		alert("전화번호 입력하세요");
		document.registerForm.tel3.focus();
	} else if(document.registerForm.birthDay.value==""){
		alert("생일을 입력하세요");
		document.registerForm.birthDay.focus();
	} else {
		document.registerForm.submit();
	}
}