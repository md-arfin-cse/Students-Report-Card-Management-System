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
       	  pstmt=con.prepareStatement("select student_id from student_details");
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
<script type="text/javascript" src="dateget.js"></script>


<body bgcolor="silver"><center>
<br>
<br>
<br>
<form name="fone" action="./AddStudentRemarks" method="Post">
<font size="4" >ENTER STUDENT REMARKS</font><br><br>
<table>


<tr><td><b>Student ID:</b></td><td><select name="sid">
<%
while(rs.next())
{
%>
<option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
<%
}
 %>

</td></tr>

<tr><td valign="top"><b>Enter Remarks:</b></td><td><textarea name="remarks" cols="25" rows="5"></textarea>


</td>
</tr>

<tr><td><b>Date:</b></td><td><input type="text" name="date" value="" size="32"></td><td><a href="javascript:show_calendar('document.fone.date', document.fone.date.value);">date</a></td></tr>

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
