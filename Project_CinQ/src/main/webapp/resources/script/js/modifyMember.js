* js/modifyMember.js */


function modify_submit(){

	var tel1 = $(#tel1).val();
	var tel2 = $(#tel2).val();
	var tel3 = $(#tel3).val();
	
	var tel = tel1+tel2+tel3;
	$(#tel).val(tel);
	
	modifyForm.submit();
}

function telSub() {
					 
	var tel = $("#tel").val();
	var tel1 = tel.substr(0, 3);
	var tel2 = tel.substr(5, 4);
	var tel3 = tel.substr(10, 4);
					
	$("#tel1").val(tel1);
	$("#tel2").val(tel2);	
	$("#tel3").val(tel3);	
						
					
}
				
				