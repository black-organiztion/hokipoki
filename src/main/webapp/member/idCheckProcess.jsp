<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="javax.sql.*" %>    
<%@ page import="javax.naming.*" %>    
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("utf-8");
String chk_id = request.getParameter("id");
Connection conn = null;
ResultSet rs = null;
PreparedStatement pstmt = null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();
	
	pstmt=conn.prepareStatement("select * from member where id=?");
	pstmt.setString(1,chk_id);	
	rs=pstmt.executeQuery();
	
/*  	if(rs.next()){ 		
		response.sendRedirect("idCheck.jsp?chk_id="+chk_id+"&useable=no");
	}else{
		response.sendRedirect("idCheck.jsp?chk_id="+chk_id+"&useable=yes");
	}  */
	
	  if(rs.next()){
		out.println("<script>");
		out.println("location.href='memberidCheck.jsp?chk_id="+chk_id+"&useable=no'");
		out.println("</script>");		
	}else{
		out.println("<script>");
		out.println("location.href='memberidCheck.jsp?chk_id="+chk_id+"&useable=yes'");
		out.println("</script>");	
	} 
	 
	
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		 if(rs!=null)
		 rs.close();
		 if(pstmt!=null)
		 pstmt.close();
		 if(conn!=null)
		 conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}



%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>