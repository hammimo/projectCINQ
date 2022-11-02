/* js/reservation.js */

function rentOkView() {

	var url = '/root/place/rentOkPlaceView';
	var popOpt = 'width=600px, height=300px, top=300px, left=1200px';
	
	window.open(url,'pop',popOpt);
	
}


function placeSubmit() {

	var val_1 = $("#data_1").val();
	window.opener.location.href='../reservation/reservationForm?write_no='+val_1
	window.close();
	
}