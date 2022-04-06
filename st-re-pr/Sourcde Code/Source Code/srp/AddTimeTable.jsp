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
<script language="javascript" src="dateget.js">
</script>
</head>
<body bgcolor="silver"><center>
<form name="frm" action="./AddTimeTable" method="Post">
<font> <h4>ENTER TIME DETAILS/SCHEDULE DETAILS</h4></font><br>
<table>


<tr><td align="center"><b>Enter ExamId:</td><td><select name="examid">
<option value="Quarterly">Quarterly</option>
<option value="HalfYearly">HalfYearly</option>
<option value="Annual">Annual</option>
<option value="Assignment">Assignment</option>
<option value="UnitTest1">UnitTest1</option>
<option value="UnitTest1">UnitTest2</option>
<option value="UnitTest1">UnitTest3</option>

</select>
</td></tr>
<tr></tr>
<tr><td align="center"><b>Subject:</td><td align="center"><b>Date:</td>
<tr></tr>
<tr><td><b><input type="text" name="s1" value=""></td><td><input type="text" name="d1" value=""></td><td><a href="javascript:show_calendar('document.frm.d1', document.frm.d1.value);">date</a></td></tr>
<tr><td><b><input type="text" name="s2" value=""></td><td><input type="text" name="d2" value=""></td><td><a href="javascript:show_calendar('document.frm.d2', document.frm.d2.value);">date</a></td></tr>
<tr><td><b><input type="text" name="s3" value=""></td><td><input type="text" name="d3" value=""></td><td><a href="javascript:show_calendar('document.frm.d3', document.frm.d3.value);">date</a></td></tr>
<tr><td><b><input type="text" name="s4" value=""></td><td><input type="text" name="d4" value=""></td><td><a href="javascript:show_calendar('document.frm.d4', document.frm.d4.value);">date</a></td></tr>
<tr><td><b><input type="text" name="s5" value=""></td><td><input type="text" name="d5" value=""></td><td><a href="javascript:show_calendar('document.frm.d5', document.frm.d5.value);">date</a></td></tr>
<tr><td><b><input type="text" name="s6" value=""></td><td><input type="text" name="d6" value=""></td><td><a href="javascript:show_calendar('document.frm.d6', document.frm.d6.value);">date</a></td></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr><td><b>The Time of Exams Is:</td><td><input type="text" name="time" value=""></td></tr>
<%
 String msg=null;
if(request.getParameter("msg")!=null)
{
%>
<tr><td colspan="2" align="center"><p><b><font color="blue"><%=request.getParameter("msg") %></font></b></p>
<%
}
 %>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<input type="submit" name="sub" value="ADD" onclick="return validate()"></center>
</body>

<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
