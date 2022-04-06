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
       	    System.out.println("count"+rs.getInt(1));
       	    System.out.println("count1"+count);
       	  }
       	  
       	 
       	 
       	  Fac="Teacher"+count;
       	 
   	   
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


<HTML>

<br>
<br>
<br>
<body bgcolor="silver"><center>
<form name="fone" action="./AddFacultyDetails" method="Post">
<font size="4" >ENTER TEACHER DETAILS</font><br><br>
<table>


<tr><td><b>Teacher ID:</b></td><td><input type="text" name="tid" value=<%=Fac%> readonly ></td></tr>
<tr><td><b>Teacher Name:</b></td><td><input type="text" name="tname" value="">
<tr><td><b>EmailID:</b></td><td><input type="text" name="mailid" value="">

<tr><td><b>Subject Dealing:</b></td><td><input type="text" name="subjectdealing" value=""></td></tr>

<tr><td><b>Joining Date:</b></td><td><input type="text" name="joiningdate" value=""></td></tr>

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

</center></body>


<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
