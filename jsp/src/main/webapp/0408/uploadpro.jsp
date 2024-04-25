<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.io.File" %>
    <h1>/jsp/0408/uploadpro.jsp</h1>
    
    <%
       //String path= "C:\\Project\\workspace\\save";
    
		String path = request.getRealPath("resources/image");
   		out.println(path);
   		
   		
       int max= 1024*1024*10; // 10M
       String enc = "UTF-8";
       DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
       MultipartRequest mr = new MultipartRequest(request,path,max,enc,df);
    
       String name = mr.getParameter("name");
 //      String save = mr.getParameter("save");
       
       String sysName = mr.getFilesystemName("save");
       String orgName = mr.getOriginalFileName("save");
       String fileType = mr.getContentType("save");
      
      
      System.out.println("fileType:::"+fileType);
      System.out.println("sysName:::"+sysName);
       
       File f = mr.getFile("save");
       long fileSize = f.length(); 
       
       String [] type = fileType.split("/");
       if(!type[0].equals("image")){
          f.delete();
       }
    
    %>
    
    <h1>name : <%= name %></h1>
    <h1>파일 원본 이름 : <%=orgName %> </h1>
    <h1>파일 업로드 된 이름 : <%=sysName %> </h1>
    <h1>파일 종류 : <%=fileType %> </h1>
     <h1>파일 크기 : <%=fileSize %></h1>
     
     <img src="/jsp/resources/image/<%=sysName%>" />
    

    

    
    