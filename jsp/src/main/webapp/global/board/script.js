function writeSave(){
	if(document.writeform.writer.value==""){
	  alert("작성자 입력하세요.");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){
	  alert("제목 입력하세요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하세요.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert("비밀번호를 입력하세요.");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    

