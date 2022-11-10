/* js/adminMember.js */

function memberDelete(a) {
	var res = confirm("정말로 탈퇴시키겠습니까?");
	if(res == true){
		alert("탈퇴 되었습니다.");
		location.href="/root/member/adminDelete?id="+a;
	} else {
		alert("탈퇴 취소되었습니다.");
	}
}
