/* place.js */
/* 장소 정보 api 내용에 해당하는 부분 */

function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
			var addr="";
			// R : 도로명, J : 지번
			if(data.userSelectedType=='R'){
				addr = data.roadAddress
			}
			else {
				addr = data.jibunAddress
			}
			$("#addr1").val(data.zonecode)
			$("#addr2").val(addr)
			$("#addr3").focus()
        }
    }).open();
}

function writeSave(){
	
  	 var addr1 = $("#addr1").val(); 
	 var addr2 = $("#addr2").val();
	 var addr3 = $("#addr3").val();
	
	 var addrResult = "";
	 
	
	 
 	addrResult = addr1 + "/" + addr2 + "/" + addr3;
	$("#addrResult").val(addrResult);   
	  addr2 = addr2.substring(3, 5);
	$("#loc_sep_name").val(addr2);
		
	form.submit();
	
	
}
