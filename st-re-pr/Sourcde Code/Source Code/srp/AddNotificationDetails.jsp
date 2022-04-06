<jsp:include flush="true" page="Header.jsp"></jsp:include>
<%@page import="java.sql.*" %>
<% 

 Connection con=null;
 PreparedStatement pstmt=null;
 ResultSet rs=null;
 int count=0;
 String Fac=null;
try
{	
	ServletContext sc=getServletContext();
	String driver=sc.getInitParameter("driver");
	String url=sc.getInitParameter("url");
	String uname=sc.getInitParameter("user");
	String pwd=sc.getInitParameter("dbpassword");
	Class.forName(driver);
	 System.out.println("...........3.......");
	 con=DriverManager.getConnection(url,uname,pwd);
       	  pstmt=con.prepareStatement("select count(faculty_id) from faculty_details");
       	  rs=pstmt.executeQuery();
       	  while(rs.next())
       	  {
       	    count=rs.getInt(1)+1;
       	  }
       	  
       	 
       	 
       	  Fac="Teacher"+count;
       	 
       
   	   
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


<HTML>
<head>
<script type="text/javascript" src="dateget.js">


</script>


<body bgcolor="silver"><center>
<br>
<br>
<br>
<form name="fone" action="./AddNotificationDetails" method="Post">
<font size="4" >Enter Notification Details</font><br><br>
<table>


<tr><td valign="top"><b>Enter If Any Notification:</b></td><td><textarea rows="3" cols="20" name="notification"></textarea></td></tr>



<tr><td><b>Notification Date:</b></td><td><input type="text" name="ndate" size="26"></td><td><a href="javascript:show_calendar('document.fone.ndate', document.fone.ndate.value);">date</a></td></tr>

<%

if(request.getParameter("msg")!=null)
{
%>
<tr><td colspan="2" align="center"><p><b><font color="blue"><%=request.getParameter("msg") %></font></b></p>
<%
}
 %>
</table>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<input type="submit" value="ADD"></form>

</body>


<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
