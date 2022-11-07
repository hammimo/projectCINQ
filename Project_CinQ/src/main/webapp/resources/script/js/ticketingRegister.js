/* js/ticketingRegister.js */

function registOkView() {
	var url = '/root/place/registOkPlaceView';
	var popOpt = 'width=800px, height=430px, top=300px, left=500px';
	openWin = window.open(url,'pop',popOpt);
	
}

function setRegister_no(){
	
	document.getElementById("register_no").value = opener.document.getElementById("register_no").value

} 

function placeRegist(a) {
	var place_no = a;
	var register_no = $("#register_no").val();
	window.opener.location.href="../reservation/ticketingRegister?write_no="+register_no+"&location="+place_no;
	window.close();
}

