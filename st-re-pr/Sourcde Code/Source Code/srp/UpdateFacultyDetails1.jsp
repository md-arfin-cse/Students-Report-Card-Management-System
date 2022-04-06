<jsp:include flush="true" page="./Header.jsp"></jsp:include>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>

<title>Edir Requests</title>
<head>
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
<form action="./UpdateFaculty" method="post" name="frm">
<br>
<br>
<h3 align=center>FACULTY DETAILS</h3>
<%
/*Declaration of variables*/

Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String deptname,location;
String fid=request.getParameter("fid");

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
       	  pstmt=con.prepareStatement("select * from faculty_details where faculty_id=?");
       	  pstmt.setString(1,fid);
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
	    <tr><td></td><td><input type="hidden"value=<%=fid%> name="fno"></td></tr>
		<tr><td ><b>Teacher Name:</b></td><td><input type="text"value=<%=rs.getString(2)%> name="tname"></td></tr>
		<tr><td ><b>Subject Dealing:</b></td><td><input type="text"value="<%=rs.getString(4)%>" name="sdealing" ></td></tr>
		<tr><td ><b>Joining Date:</b></td><td><input type="text"value=<%=rs.getString(5)  %> name="jdate"></td></tr>
		<tr><td ><b>MailId:</b></td><td><input type="text"value="<%=rs.getString(6)%>" name="mailid" ></td></tr>
		
		
		
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
