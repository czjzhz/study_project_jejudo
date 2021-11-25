<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <% 
 	String[] ages={"10대","20대","30대","40대","50대 이상"};
 
//for(int i=0; i<tel.length;i++){
	 // out.println(tel[i]+"<hr/>");
//}
 	
 	request.setAttribute("ages", ages);
 
 %>	