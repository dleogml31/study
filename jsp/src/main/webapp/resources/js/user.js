/**
  주석
 **/
function inputCheck(){
      id = document.getElementById("id").value;
      console.log("==========="+id);
      if(id == ""){
         alert("ID를 입력하세요.."); // 메세지 창
         document.getElementById("id").focus(); // 아이디입력했을경우 아이디창으로 마우스이동
      }
   }