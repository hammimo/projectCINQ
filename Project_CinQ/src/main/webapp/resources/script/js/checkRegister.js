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
	if($("#tel2").val() != "" && $("#tel3").val() != "" && $("#tel2").val().length == 4 && $("#tel3").val().length == 4){
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
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var id = $("#id").val();
	var pw = $("#pw").val();
	var pwChk = $("#pwChk").val();
	var name = $("#name").val();
	var email = $("#email").val();
	var tel2 = $("#tel2").val();
	var tel3 = $("#tel3").val();
	var birthday = $("#birthday").val();
	
	if(id ==""){
		alert("id를 입력하세요.");
		$("#id").focus();
		return false;
	}  else if(pw == ""){
		alert("비밀번호를 입력하세요.");
		$("#pw").focus();
		return false;
	} else if(pw != pwChk){
		alert("비밀번호가 일치하지 않습니다.");
		$("#pwChk").focus();
		return false;
	} else if(name == ""){
		alert("이름을 입력하세요.");
		$("#name").focus();
		return false;
	} else if(email == ""){
		alert("이메일 입력하세요.");
		$("#email").focus();
		return false;
	} else if(!email_rule.test(email)){
		alert("이메일 형식을 확인하세요. ex) test@test.com");
		$("#email").focus();
		return false;
	} else if(tel2 == ""){
		alert("전화번호를 입력하세요.");
		$("#tel2").focus();
		return false;
	} else if(!Number(tel2)){
		alert("전화번호에는 숫자만 입력하세요");
		$("#tel2").focus();
		return false;
	} else if(tel2.length != 4){
		alert("전화번호 중간번호 4자리를 확인하고 입력하세요.");
		$("#tel2").focus();
		return false;
	} else if(tel3 == ""){
		alert("전화번호를 입력하세요.");
		$("#tel3").focus();
		return false;
	} else if(!Number(tel3)){
		alert("전화번호에는 숫자만 입력하세요");
		$("#tel3").focus();
		return false;
	} else if(tel3.length != 4){
		alert("전화번호 끝번호 4자리를 확인하고 입력하세요.");
		$("#tel3").focus();
		return false;
	} else if(birthday==""){
		alert("생일을 입력하세요.");
		$("#birthday").focus();
		return false;
	} else if(birthday.length != 8){
		alert("생년월일 8자리를 확인하고 입력하세요.");
		$("#birthday").focus();
		return false;
	} else if(!Number(birthday)){
		alert("생년월일에 숫자만 입력하세요");
		$("#birthday").focus();
		return false;
	} else {
		document.registerForm.submit();
	}
}