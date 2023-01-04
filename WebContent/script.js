function inputCheck(){
	if(document.joinForm.userID.value==""){
		alert("아이디를 입력해 주세요.");
		document.joinForm.userID.focus();
		return;
	}
	if(document.joinForm.userPw.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.joinForm.userPw.focus();
		return;
	}
	if(document.joinForm.uspw2.value==""){
		alert("비밀번호를 확인해 주세요");
		document.joinForm.uspw2.focus();
		return;
	}
	if(document.joinForm.userPw.value != document.joinForm.uspw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.joinForm.uspw2.value="";
		document.joinForm.uspw2.focus();
		return;
	}
	if(document.joinForm.userName.value==""){
		alert("이름을 입력해 주세요.");
		document.joinForm.userName.focus();
		return;
	}

	if(document.joinForm.userEmail.value==""){
		alert("이메일을 입력해 주세요.");
		document.joinForm.userEmail.focus();
		return;
	}
	
    var str=document.joinForm.userEmail.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('Email주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.joinForm.userEmail.focus();
		  return;
    }
    if(document.joinForm.userPost.value==""){
		alert("우편번호를 검색해 주세요.");
		return;
	}
	if(document.joinForm.userAddress.value==""){
		alert("주소를 입력해 주세요.");
		document.regFrm.userAddress.focus();
		return;
	}
	if(document.joinForm.userDaddress.value==""){
		alert("상세주소를 입력해 주세요.");
		document.joinForm.userDaddress.focus();
		return;
	}
	if(document.joinForm.userPhone.value==""){
		alert("번호를 입력해 주세요.");
		document.joinForm.userPhone.focus();
		return;
	}
	document.joinForm.submit();
}

function win_close(){
	self.close();
}