$(function() {

	$("#loginForm").submit(function() {
		var id = $("#userId").val();
		var pass = $("#userPass").val();
		if(id.length <= 0) {
			alert("아이디가 입력되지 않았어용~\n아이디를 입력해주세용~");
			$("#userId").focus();
			return false;
		}
		
		if(pass.length <= 0) {		
			alert("비밀번호가 입력되지 않았습니당~\n비밀번호를 입력해주세용~");
			$("#userPass").focus();
			return false;
		}
	});
	
	$("#modalLoginForm").submit(function() {
		
		var id = $("#modalUserId").val();
		var pass = $("#modalUserPass").val();
		if(id.length <= 0) {
			alert("아이디가 입력되지 않았습니당~\n아이디를 입력해주세용~");
			$("#modalUserId").focus();
			return false;
		}
		if(pass.length <= 0) {
			alert("비밀번호가 입력되지 않았습니당~\n비밀번호를 입력해주세용~");
			$("#modalUserPass").focus();
			return false;
		}
	});
	
	$("#memberId").on("keyup", function() {		
		var regExp = /[^A-Za-z0-9]/gi;	
		if(regExp.test($(this).val())) {
			alert("영문 대소문자, 숫자만 입력할 수 있어용~");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});

	$("#checkId").on("keyup", inputCharReplace);	
	$("#pass1").on("keyup", inputCharReplace);	
	$("#pass2").on("keyup", inputCharReplace);	
	$("#emailId").on("keyup", inputCharReplace);	
	$("#emailDomain").on("keyup", inputEmailDomainReplace);
	
	
	$("#btnOverlapId").on("click", function() {
		var memberId = $("#memberId").val();
		url="overlapIdCheck?memberId=" + memberId;
		
		if(memberId.length == 0) {
			alert("아이디를 입력해주세용~");
			return false;
		}
		
		if(memberId.length < 4) {
			alert("아이디는 4자 이상 입력해주세용~");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, scrollbars=no, resizeable=no, status=no, memubar=no, width=500, height=320");
	});
	
	$("#idCheckForm").on("submit", function() {
		var id = $("#checkId").val();	
		
		if(id.length == 0)  {
			alert("아이디를 입력해주세용~");
			return false;
		}
		
		if(id.length < 4) {
			alert("아이디는 4자 이상 입력해주세용~");
			return false;
		}
	});
	
	$("#btnIdCheckClose").on("click", function() {
		var memberId = $(this).attr("data-id-value");
		opener.document.joinForm.memberId.value = memberId;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	});
	
	
	$("#btnZipcode").click(findZipcode);
	
	$("#selectDomain").on("change", function() {
		var str = $(this).val();
		
		if (str !== '직접입력') {
            $('#emailDomain').val(str);
            $('#emailDomain').prop('readonly', true); // 읽기 전용으로 설정
		} else {
            $('#emailDomain').val(''); // 직접 입력일 경우 비워줌
            $('#emailDomain').prop('readonly', false); // 읽기 전용 해제
		        }
	});
	
	$("#joinForm").on("submit", function() {	
		return joinFormCheck();
	});
	
	$("#btnPassCheck").click(function() {
		var memberId = $("#memberId").val();
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0) {
			alert("기존 비밀번호가 입력되지 않았습니당~\n기존 비밀번호를 입력해주세용~");
			return false;
		}
		var data = "memberId=" + memberId + "&memberPass="+oldPass;
		console.log("data : " + data);
		
		$.ajax({
			"url": "passCheck.ajax",
			"type": "get",
			"data": data,
			"dataType": "json",			
			"success": function(resData) {				
				if(resData.result) {
					alert("비밀번호가 확인되었습니당~\n비밀번호를 수정해주세용~");
					$("#btnPassCheck").prop("disabled", true);
					$("#oldPass").prop("readonly", true);
					$("#pass1").focus();					
				} else {
					alert("비밀번호가 틀립니당~\n비밀번호를 다시 확인해주세용~");
					$("#oldPass").val("").focus();
				}
			},
			"error": function(xhr, status) {
				console.log("error : " + status);
			}
		});				
	});
	
	$("#memberUpdateForm").on("submit", function() {
		if(! $("#btnPassCheck").prop("disabled")) {
			alert("기존 비밀번호를 확인해야 비밀번호를 수정할 수 있습니당~\n"
				+ "기존 비밀번호를 입력하고 비밀번호 확인 버튼을 클릭해 주세용~");
			return false;
		}
		
		return joinFormCheck();
	});	

	
	
	
	
	
		
});





function inputCharReplace() {
	var regExp = /[^A-Za-z0-9]/gi;
	if(regExp.test($(this).val())) {
		alert("영문 대소문자, 숫자만 입력할 수 있습니당~");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

function inputEmailDomainReplace() {
	var regExp = /[^a-z0-9\.]/gi;
	if(regExp.test($(this).val())) {
		alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력할 수 있습니당~");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

function joinFormCheck() {
	let memberName = $("#memberName").val();
	let memberId = $("#memberId").val();
	let pass1 = $("#pass1").val();
	let pass2 = $("#pass2").val();
	let zipcode = $("#zipcode").val();
	let address1 = $("#address1").val();
	let address2 = $("#address2").val();
	let emailId = $("#emailId").val();
	let emailDomain = $("#emailDomain").val();
	let mobile2 = $("#mobile2").val();
	let mobile3 = $("#mobile3").val();
	let isIdCheck = $("#isIdCheck").val();

	
	if(memberId.length == 0) {		
		alert("아이디가 입력되지 않았습니당~\n아이디를 입력해주세용~");
		return false;
	}
	if(isIdCheck == 'false') {		
		alert("아이디 중복 체크를 하지 않았습니당~\n아이디 중복 체크를 해주세용~");
		return false;
	}	
	if(pass1.length == 0) {		
		alert("비밀번호가 입력되지 않았습니당~\n비밀번호를 입력해주세용~");
		return false;
	}
	
	if(pass2.length == 0) {		
		alert("비밀번호 확인이 입력되지 않았습니당~\n비밀번호 확인을 입력해주세용~");
		return false;
	}
	if(pass1 != pass2) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니당~");
		return false;
	}	
	if(memberName.length == 0) {		
		alert("이름이 입력되지 않았습니당~\n이름을 입력해주세용~");
		return false;	
	}		
	if(zipcode.length == 0) {		
		alert("우편번호가 입력되지 않았습니당~\n우편번호를 입력해주세용~");
		return false;
	}	
	if(address1.length == 0) {		
		alert("주소가 입력되지 않았습니당~\n주소를 입력해주세용~");
		return false;
	}	
	if(address2.length == 0) {		
		alert("주소가 입력되지 않았습니당~\n주소를 입력해주세용~");
		return false;
	}	
	if(mobile2.length == 0 || mobile3.length == 0) {		
		alert("휴대폰 번호가 입력되지 않았습니당~\n휴대폰 번호를 입력해주세용~");
		return false;
	}
	if(emailId.length == 0) {		
		alert("이메일 아이디가 입력되지 않았습니당~\n이메일 아이디를 입력해주세용~");
		return false;
	}	
	if(emailDomain.length == 0) {		
		alert("이메일 도메인이 입력되지 않았습니당~\n이메일 도메인을 입력해주세용~");
		return false;
	}	
}


function findZipcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = '';        
            addr = data.roadAddress;			
           
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }

            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? 
										', ' + data.buildingName : data.buildingName);
            }
            
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
			
            addr += extraAddr;
            
			$("#zipcode").val(data.zonecode);
			$("#address1").val(addr);			
			$("#address2").focus();
       	}
	}).open();
}



