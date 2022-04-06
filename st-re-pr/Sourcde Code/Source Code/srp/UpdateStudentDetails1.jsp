<jsp:include flush="true" page="./Header.jsp"></jsp:include>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<head>

<title>Edir Requests</title>
<script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		
		function validate()
		{
			
			
            if(ChkMandatoryField(frm.deptname,'DepartmentName')==false) return false;
            if(ChkMandatoryField(frm.location,'Location')==false) return false;
            
            
		}
		
	</script>

</head>
<body>
<form action="./UpdateStudent" method="post" name="frm">
<br>
<br>
<h3 align=center>STUDENT DETAILS</h3>
<%
/*Declaration of variables*/

Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String deptname,location;
String sno=request.getParameter("sno");

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
       	  pstmt=con.prepareStatement("select * from student_details where student_id=?");
       	  pstmt.setString(1,sno);
    	   rs=pstmt.executeQuery();
}
catch(Exception e)
{
	e.printStackTrace();
}
if(rs!=null)
{
%>
	<br>
	<table align=center>
				
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   
	   
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
	    <tr><td></td><td><input type="hidden"value=<%=sno%> name="sno"></td></tr>
		<tr><td ><b>Student Name:</b></td><td><input type="text"value=<%=rs.getString(2)%> name="sname"></td></tr>
		<tr><td ><b>Current Standard:</b></td><td><input type="text"value="<%=rs.getString(4)%>" name="cstandard" ></td></tr>
		<tr><td ><b>Current Division:</b></td><td><input type="text"value=<%=rs.getString(5)  %> name="cdivision"></td></tr>
		<tr><td ><b>Parent MailId:</b></td><td><input type="text"value="<%=rs.getString(6)%>" name="mailid" ></td></tr>
		<tr><td ><b>Joining Date:</b></td><td><input type="text" value="<%=rs.getString(7)%>" name="joiningdate"></td></tr>
		<tr><td><b>ReportCardNo:</b></td><td><input type="text"value="<%=rs.getString(8)%>" name="rno" readonly></td></tr>
		
		
	<%
	}
	rs.close();		
if(DisRow==0)
{	
	%>		
	  <tr><th colspan=6>No Jobs found</th></tr>
	<%
}
}
%>
</table>
<br>
<br>
<center><input type="submit"value="Update" onClick="return validate()"></center>
</form>
</BODY>
<jsp:include flush="true" page="footer.jsp"></jsp:include>
</HTML>
