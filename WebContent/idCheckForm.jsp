<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<jsp:useBean id="userdao" class="user.UserDAO" />
<%
String userID = request.getParameter("userID");
int result = userdao.checkId(userID);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� �ߺ� üũ</title>
<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: hidden;
}
</style>

<script type="text/javascript">
    // ȸ������â�� ���̵� �Է¶��� ���� �����´�.
    function pValue(){
        document.getElementById("userID").value = opener.document.joinForm.userID.value;
    }
    
    // ���̵� �ߺ�üũ
    function idCheck(){

        var id = document.getElementById("userID").value; //�Էµ� ���̵�
       
        if (!id) {//���̵� �Է��� �ȵ�
            alert("���̵� �Է����ּ���.");
            return false;
        } 
        else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
            alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
            return false;
        }
        //db�� ���ؼ� �ߺ��Ǹ� false

        else
        {
        	 document.getElementById("cancelBtn").style.visibility='hidden';
             document.getElementById("useBtn").style.visibility='visible';
             document.getElementById("msg").innerHTML = "��� ������ ���̵��Դϴ�.";
        }
    }
    

    
    // ����ϱ� Ŭ�� �� �θ�â���� �� ���� 
    function sendCheckValue(){
        // �ߺ�üũ ����� idCheck ���� �����Ѵ�.
        opener.document.joinForm.idDuplication.value ="idCheck";
        // ȸ������ ȭ���� ID�Է¶��� ���� ����
        opener.document.joinForm.userID.value = document.getElementById("userID").value;
        self.close();
        /*if (opener != null) {
            opener.chkForm = null;
            self.close();
        }    */
    }   
    </script>
</head>
<body onload="pValue()">
	<div id="wrap">
		<br> <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idinput" id="userID">
				<input type="button" value="�ߺ�Ȯ��" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br>
			<input id="cancelBtn" type="button" value="���" onclick="window.close()">
			<br>
			<input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
		</div>
	</div>
</body>
</html>
