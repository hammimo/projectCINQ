/* js/adminMember.js */

function memberDelete(a) {
	var id_del = a
	var res = confirm("정말로 탈퇴시키겠습니까?");
	if(res == true){
		alert("탈퇴 되었습니다.");
		location.href="/root/member/adminDelete?id=id_del";
	} else {
		alert("탈퇴 취소되었습니다.");
	}
}