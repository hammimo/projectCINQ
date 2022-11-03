/* js/reservation.js */

function rentOkView() {

	var url = '/root/place/rentOkPlaceView';
	var popOpt = 'width=600px, height=300px, top=300px, left=1200px';
	
	window.open(url,'pop',popOpt);
	
}


function placeSubmit() {
	var place_no = $("#place_no").val();
	window.opener.location.href='../reservation/reservationForm?place_no='+place_no
	window.close();
	
}