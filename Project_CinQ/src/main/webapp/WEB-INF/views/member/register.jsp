<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join JSP</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	<!-- jQuery ui -->
<script type="text/javascript">
//아이디 중복 검사
$('#btn-id').on('click', function() {
	id_check();
});

//올바른 아이디 입력 형태인지 파악하여 유효하지 않다면 중복확인 불필요
function id_check() {
	var $id = $('[name=id]');
	if($id.hasClass('chked')) return;
	console.log('go check');
	
	var data = join.tag_status($id);
	if(data.code != 'valid') {
		alert('아이디 중복 확인 불필요\n' + data.desc);
		$id.focus();
		return;
	}

	$.ajax({
		type: 'post',
		url: 'id_check',
		data: {id: $id.val()},
		success: function(data) {
			data = join.id_usable(data);
			display_status($id.siblings('div'), data);
			$id.addClass('chked');
		},
		error: function(req, text) {
			alert(text + ': ' + req.status);
		}
	});
}


//유효성 검사
$('.chk').on('keyup', function(){
	if($(this).attr('name') == 'id') {
		if(event.keyCode == 13) { id_check(); }
		else {
			$(this).removeClass('chked');
			validate( $(this) );
		}
	} else {
		validate($(this));
	}
});

function validate(t) {
	var data = join.tag_status(t);
	display_status(t.siblings('div'), data);
}

function display_status(div, data) {
	div.text(data.desc);
	div.removeClass();
	div.addClass(data.code)
}

// 만 13세 이상만 선택 가능하게 처리
var today = new Date();
var endDay = new Date( today.getFullYear()-13, today.getMonth(), today.getDate() );

$('[name=birth]').datepicker({
	dateFormat: 'yy-mm-dd',
	changeYear: true,
	changeMonth: true,	
	showMonthAfterYear: true,
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	maxDate: endDay
	//beforeShowDay: after	//오늘 이후로 선택 못하게 하는 함수
});

$('[name=birth]').change(function() {
	$('#delete').css('display', 'inline-block');
});

$('#delete').click(function(){
	$('[name=birth]').val('');
	$('#delete').css('display', 'none');
});

function after(date) {
	if(date > new Date()) {
		return [false];
	} else {
		return [true];
	}
}


function go_join() {
	if( $('[name = name]').val() == '') {
		alert('성명을 입력하세요!');
		$('[name = name]').focus();
		return;
	}

	//필수 항목의 유효성을 판단하도록 한다.
	//중복확인 한 경우
	if($('[name=id]').hasClass('chked') ) {
		//이미 사용중인 경우는 회원가입 불가
		if($('[name = id]').siblings('div').hasClass('invalid')) {
			alert('회원가입 불가\n' + join.id.unusable.desc);
			$('[name=id]').focus();
			return;
		}
	} else {
		//중복확인 하지 않은 경우
		if( !item_check($('[name=id]')) ) return;
		else {
			alert('회원가입 불가\n' + join.id.valid.desc);
			$('[name=id]').focus();
			return;
		}
	}
	
	if(!item_check($('[name=pw]'))) return;
	if(!item_check($('[name=pw_ck]'))) return;
	if(!item_check($('[name=email]'))) return;
	
	$('form').submit();
}

function item_check(item) {
	var data = join.tag_status(item);
	if(data.code == 'invalid') {
		alert('회원가입 불가! \n' + data.desc);
		item.focus();
		return false;
	} else return true;
}
/**
 * 회원가입시 각 항목에 대한 입력 유효성 판단 
 */
var space = /\s/g;
var title = "";
var join = {
	common: {
		empty: {code: 'invalid', desc: title + '입력하세요.'},
		space: {code: 'invalid', desc: '공백 없이 입력하세요.'},
		min: {code: 'invalid', desc: '최소 5자 이상 입력하세요.'},
		max: {code: 'invalid', desc: '최대 10자 이내로 입력하세요.'}
	},
	
	id: {
		valid: { code:'valid', desc: '아이디를 중복확인하세요.' },
		invalid: { code:'invalid', desc: '아이디는 영문 소문자, 숫자만 입력하세요.' },
		usable: { code: 'valid', desc: '사용 가능한 아이디입니다.'},
		unusable: { code: 'invalid', desc: '이미 사용 중인 아이디입니다.	' }
	},
	
	id_usable: function(data) {
		if(data) return this.id.usable;
		else return this.id.unusable;
	},
	
	id_status: function(id) {
		var reg = /[^a-z0-9]/g;
		title = $('[name = id]').attr('title');
		if(id == '') { 
			return this.common.empty;
		} else if(id.match(space)) {
			return this.common.space;
		} else if(reg.test(id)) {
			return this.id.invalid;
		} else if(id.length < 5) {
			return this.common.min;
		} else if(id.length > 10) {
			return this.common.max;
		} else {
			return this.id.valid;
		}
	},
	pw: {
		valid: { code:'valid', desc: '사용 가능한 비밀번호입니다.' },
		invalid: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자만 입력하세요.' },
		lack: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자를 모두 포함해야 합니다.' },
		equal: { code: 'valid', desc: '비밀번호가 일치합니다.' },
		notEqual: { code: 'invalid', desc: '비밀번호가 일치하지 않습니다.' }
	},
	
	pw_status: function(pw) {
		var reg = /[^a-zA-Z0-9]/g;
		title = $('[name = pw]').attr('title');
		var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if(pw == '') return this.common.empty;
		else if(pw.match(space)) return this.common.space;
		else if(reg.test(pw)) return this.pw.invalid;
		else if(pw.length < 5) return this.common.min;
		else if(pw.length > 10) return this.common.max;
		else if ( !upper.test(pw) || !lower.test(pw) || !digit.test(pw) ) return this.pw.lack;
		else return this.pw.valid;
	},
	
	pw_ck_status: function(pw_ck) {
		title = $('[name = pw_ck]').attr('title');
		if ( pw_ck=='' ) return this.common.empty;
		else if(pw_ck == $('[name=pw]').val() ) return this.pw.equal;
		else return this.pw.notEqual; 
	},
	
	email: {
		valid: { code: 'valid', desc: '유효한 이메일입니다.' },
		invalid: { code: 'invalid', desc: '유효하지 않은 이메일입니다.' }
	},
	
	email_status: function(email) {
		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		title = $('[name = email]').attr('title');
		if( email == '' ) return this.common.empty;
		else if(email.match(space)) return this.common.space;
		else if( reg.test(email) ) return this.email.valid;
		else return this.email.invalid;  
	},
	
	tag_status: function(tag) {
		var data = tag.val();
		tag = tag.attr('name');
		if(tag == 'id') {
			data = this.id_status(data);
		} else if(tag == 'pw') {
			data = this.pw_status(data);
		} else if(tag == 'pw_ck') {
			data = this.pw_ck_status(data);
		} else if(tag == 'email') {
			data = this.email_status(data);
		} 
		return data;
	}
}
</script>
<style type="text/css">

table tr td {
	text-align: left;
}

table tr td input[name=tel] {
	width: 40px;
}

table tr td input[name=addr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}
	
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: green; }

.invalid { color: red; }	
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
	<c:import url="../default/header.jsp"/>
	<c:import url="../default/directButton.jsp"/>	
<body>
<h3>회원가입</h3>
<p class="w-pct60 right" style="margin: 0 auto; padding-bottom: 5px; font-size: 13px;">*는 필수 입력 항목입니다.</p>
<form>
	<table class="w-pct60">
		<tr>
			<th class="w-px160">* 성명</th>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<th>* 아이디</th>
			<td>
				<input type="text" title="아이디" name="id" class="chk"/><a id="btn-id" class='btn-fill-s'>중복 확인</a><br>
				<div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
			</td>
		</tr>
		<tr>
			<th>* 비밀번호</th>
			<td>
				<input type="password" title="비밀번호" name="pw" class="chk" />
				<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
			</td>
			
		</tr>
		<tr>
			<th>* 비밀번호 확인</th>
			<td>
				<input type="password" title="비밀번호 확인" name="pw_ck" class="chk" />
				<div class="valid">비밀번호를 다시 입력하세요. </div>
			</td>
		</tr>
		<tr>
			<th>* 성별</th>
			<td>
				<label><input type="radio" name="gender" value="남" checked/>남</label>
				<label><input type="radio" name="gender" value="여" />여</label>
			</td>
		</tr>
		<tr>
			<th>* 이메일</th>
			<td>
				<input type="text" title="이메일" name="email" class="chk" />
				<div class="valid">이메일을 입력하세요.</div>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="birth" readonly />
				<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
				<!-- fontawesome에서 가져온 무료 아이콘 -->
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="tel" /> - 
				<input type="text" name="tel" /> - 
				<input type="text" name="tel" />
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="go_join()">회원가입</a>
	<a class="btn-empty" onclick="history.go(-1)">취소</a>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>
