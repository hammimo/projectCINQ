package com.project.root.member.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.root.member.dto.MemberDTO;
import com.project.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

   @Autowired
   private MemberMapper mapper;
   
   
   @Override
   public int register(MemberDTO member) {
      try {
         return mapper.register(member);
      }catch (Exception e) {
         return 0;
      }
   }
   
   @Override
   public int idCheck(String id) {
      MemberDTO dto = mapper.user_check(id);
      if(dto != null) {
         return 0;
      }
      return 1;
   }
   
   @Override
   public int user_check(HttpServletRequest request) {
      MemberDTO dto = mapper.user_check(request.getParameter("id"));
      if(dto != null) {
          if(request.getParameter("pw").equals(dto.getPw())) { 
             return 0; 
         }
         
      }
      
      return 1;
   }
   
   @Override
   public void info(String id, Model model) {
      MemberDTO dto = mapper.getMember(id);
      model.addAttribute("info", dto);
   }
   
   @Override
   public String getMessage(HttpServletRequest request, String msg, String url) {

      String message = null;
      String path = request.getContextPath();
      message = "<script>alert('" + msg + "');";
      message += "location.href='" + path + url + "';</script>";
      return message;
      
   }
   
   @Override
   public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
      
      MemberDTO dto = new MemberDTO();
      dto.setId(mul.getParameter("id"));
      dto.setPw(mul.getParameter("pw"));
      dto.setName(mul.getParameter("name"));
      dto.setEmail(mul.getParameter("email"));
      dto.setTel(mul.getParameter("tel"));
      dto.setGender(mul.getParameter("gender"));
      dto.setBirthday(mul.getParameter("birthday"));
      
      int result = 0;
      try {
         result = mapper.modify(dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      String msg, url;
      if(result == 1) {
         msg = "회원정보가 수정 되었습니다...";
         url = "/member/myinfo1?id="+dto.getId();
      } else {
         msg = "회원정보 수정 오류입니다~";
         url = "/member/modify_form?id="+dto.getId();
      }
      
      return getMessage(request, msg, url);
      
   }
   
   @Override
   public String memberDelete(String id, HttpServletRequest request) {

      int result = mapper.delete(id);
      String msg, url;
      if(result == 1) {
         msg = "삭제 되었습니다...";
         url = "/member/logout";
      } else {
         msg = "삭제 오류입니다~";
         url = "/member/myinfo1?id="+id;
      }
      
      return getMessage(request, msg, url);
      
   }
   
   @Override
   public void createFile(String id) {
      String path1 = "C:\\spring\\";
      String path2 = path1+"image_repo\\";
      String path3 = path2+id+"\\";
      String path4 = path3+"join";
      String path5 = path3+"reservation";
      
      File Folder1 = new File(path1);
      File Folder2 = new File(path2);
      File Folder3 = new File(path3);
      File Folder4 = new File(path4);
      File Folder5 = new File(path5);
      
      
      if (!Folder1.exists()) {
         try{
             Folder1.mkdir(); //폴더 생성합니다.
             System.out.println("c:\\spring 폴더가 생성되었습니다.");
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
            }else {
         System.out.println("이미 c:\\spring 폴더가 생성되어 있습니다.");
      }
      
      if (!Folder2.exists()) {
         try{
             Folder2.mkdir(); //폴더 생성합니다.
             System.out.println("c:\\spring\\image_repo 폴더가 생성되었습니다.");
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
            }else {
         System.out.println("이미 c:\\spring\\image_repo 폴더가 생성되어 있습니다.");
      }
      
      if (!Folder3.exists()) {
         try{
             Folder3.mkdir(); //폴더 생성합니다.
             System.out.println("C:\\spring\\image_repo\\"+id+"폴더가 생성되었습니다.");
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
            }else {
         System.out.println("이미 C:\\spring\\image_repo\\"+id+"폴더가 생성되어 있습니다.");
      }
      
      if (!Folder4.exists()) {
         try{
             Folder4.mkdir(); //폴더 생성합니다.
             System.out.println("C:\\spring\\image_repo\\"+id+"//join 폴더가 생성되었습니다.");
              } 
              catch(Exception e){
             e.getStackTrace();
         }        
            }else {
         System.out.println("이미 C:\\spring\\image_repo\\"+id+"//join 폴더가 생성되어 있습니다.");
      }
      if (!Folder5.exists()) {
          try{
              Folder5.mkdir(); //폴더 생성합니다.
              System.out.println("C:\\spring\\image_repo\\"+id+"//reservation 폴더가 생성되었습니다.");
               } 
               catch(Exception e){
              e.getStackTrace();
          }        
             }else {
          System.out.println("이미 C:\\spring\\image_repo\\"+id+"//reservation 폴더가 생성되어 있습니다.");
       }
      

      
   }
   
   @Override
   public void deleteFile(String id) {
      String path = "C:\\spring\\image_repo\\"+id;
      String path2 = path+"\\join";
      
      
      File folder = new File(path);
      File folder2 = new File(path2);
      
      try {
         while(folder2.exists()) {
            File[] listFiles = folder2.listFiles();
            
            for(File file : listFiles) {
               file.delete();
               System.out.println("파일이 삭제되었습니다");
            }
            
            if(listFiles.length == 0 && folder2.isDirectory()) {
               folder2.delete();
               System.out.println("폴더가 삭제되었습니다.");
            }
         }
      } catch (Exception e) {
         e.getStackTrace();
      }
      
      
      
      try {
         while(folder.exists()) {
            File[] listFiles = folder.listFiles();
            
            for(File file : listFiles) {
               file.delete();
               System.out.println("파일이 삭제되었습니다");
            }
            
            if(listFiles.length == 0 && folder.isDirectory()) {
               folder.delete();
               System.out.println("폴더가 삭제되었습니다.");
            }
         }
      } catch (Exception e) {
         e.getStackTrace();
      }
   }
    
}