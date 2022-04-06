<jsp:include flush="true" page="Header.jsp"></jsp:include>
<% 

 Connection con=null;
 PreparedStatement pstmt=null;
 ResultSet rs=null;
 int count=0;
 String sid=null,rid=null;
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
       	  pstmt=con.prepareStatement("select count(student_id) from student_details");
       	  rs=pstmt.executeQuery();
       	  while(rs.next())
       	  {
       	    count=rs.getInt(1)+1;
       	  }
       	  
       	 
       	 
       	  sid="Stud"+count;
       	  rid="Rep"+count;
       
   	   
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

<%@page import="java.sql.*" %>
<HTML>
<head>
<script language="javascript">
function validate(){
 if(document.fone.universityname.value==""){
window.alert("universityname is required");
return false;
}
else if(document.fone.location.value==""){
window.alert("location is required");
return false;
}else
if(document.fone.phno.value==""){
window.alert("phno is required");
return false;
}else if(document.fone.address.value==""){
window.alert("address is required");
return false;
}if(document.fone.www.value==""){
window.alert("www is required");
return false;
}
}
</script>
</head>
<body bgcolor="silver"><center>
<form name="fone" action="./AddStudentDetails" method="Post"><br>
<br>
<font> <h1>sandu</h1></font><br>
<table>


<tr><td><b>Student ID:</td><td><input type="text" name="sid" value=<%=sid%> readonly></td></tr>
<tr><td><b>Student Name:</td><td><input type="text" name="sname" value="">
<tr><td><b>Current Standard:</td><td><input type="text" name="currentstandard" value=""></td></tr>
<tr><td><b>Current Division:</td><td><input type="text" name="currentdivision" value="">
<tr><td><b>Parent EmailID:</td><td><input type="text" name="mailid" value=""></td></tr>
<tr><td><b>Joining Date:</td><td><input type="text" name="joiningdate" value=""></td></tr>
<tr><td><b>Report CardNo:</td><td><input type="text" name="cardno" value=<%=rid%> readonly></td></tr>
<%
 String msg=null;
if(request.getParameter("msg")!=null)
{
%>
<tr><td colspan="2" align="center"><p><b><font color="blue"><%=request.getParameter("msg") %></font></b></p>
<%
}
 %>
</table><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp


<input type="submit" name="sub" value="ADD" onclick="return validate()"></center>
</body>

<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
