<jsp:include flush="true" page="TeacherHeader.jsp"></jsp:include>
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
       	  pstmt=con.prepareStatement("select student_id,student_name from student_details");
       	  rs=pstmt.executeQuery();
       	 
       	 
       
   	   
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


<HTML>
<head>
<script type="text/javascript">
function Exam()
{
var exam=fone.ename.value;
alert(exam);
if(exam=='Assignment' || exam=='UnitTest')
{
fone.amarks.value=25;
}
else
{
fone.amarks.value=100;
}

}

</script>


<body bgcolor="silver"><center>
<br>
<br>
<br>
<form name="fone" action="AddReportCardDetails" method="Post">
<font size="4" >PUBLISH REEPORT</font><br><br>
<table>


<tr><td><b>Student ID:</b></td><td><select name="sid">
<%
while(rs.next())
{
%>
<option value=<%=rs.getString(1) %>><%=rs.getString(2) %></option>
<%
}
 %>

</td></tr>

<tr><td><b>Exam Name:</b></td><td><select name="ename" onchange="return Exam()">

<option value="Quarterly">Quarterly</option>
<option value="HalfYearly">HalfYearly</option>
<option value="Annual">Annual</option>
<option value="Assignment">Assignment</option>
<option value="UnitTest1">UnitTest1</option>
<option value="UnitTest1">UnitTest2</option>
<option value="UnitTest1">UnitTest3</option>

</select>
</td>
</tr>

<tr><td><b>Actual Marks:</b></td><td><input type="text" name="amarks" value=""></td></tr>
<tr><td><b>Subject Name:</b></td><td><input type="text" name="subjectname" value=""></td></tr>

<tr><td><b>Total Marks:</b></td><td><input type="text" name="totalmarks" value=""></td></tr>

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
