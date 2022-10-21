/* script/file.js */

function readURL(input){
   var file = input.files[0]; // 파일 정보
   if(file != ""){
      var reader = new FileReader();
      reader.readAsDataURL(file); // 파일 정보 읽어오기
      reader.onload = function(e){ // 읽기에 성공하면 결과 표시
         $("#preview").attr("src", e.target.result)
      }
   }
}
