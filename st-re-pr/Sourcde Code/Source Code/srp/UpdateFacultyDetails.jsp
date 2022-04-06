<jsp:include flush="true" page="./Header.jsp"></jsp:include>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<title>Adminresponse</title>
<script language="javascript">
function Checkfiles()
{
	
     var fup = document.getElementById('my_file_element'.value;
     alert(fup);
	 if(fup=="")
	 {
	 alert("Upload at least one file");
	 document.getElementById('my_file_element').focus();
	 return false;
	 }
	 else if(fup!="")
	 {
	 alert("Not null");
     var fileName = fup;

     var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	 alert(ext);
     if(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG")

      {
				alert("correct format");
                return true;

      }         

      else

      {

                alert("Upload Gif or Jpg images only");
                document.getElementById('my_file_element').focus();
                return false;

       }
       return false;
	}
}</script>
</HEAD>

<body class="SC">
<form name="get ElementById">
<br>
<br>
<br>
<br>
<br>
<br>

<h3 align=center>UPDATE TEACHER DETAILS</h3>
<%
/*Declaration of variables*/

Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String dno,dname,location;


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
       	  pstmt=con.prepareStatement("select * from faculty_details");
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
	<table class=notebook align=center border=1 cellspacing="0" bordercolor="black">
	<tr class=row_title>
        <th align="center">Teacher Name</th>
		<th align="center">Subject Dealing</th>
		<th align="center">Joining Date</th>
		<th align="center">Parent MailID</th>
		<th align="center">Edit</th>
		<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   
	   DisRow++;
	%>
	 <tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		
		<td align="center"><%=rs.getString(2)  %></td>
		<td align="center"><%=rs.getString(4)%></td>
		<td align="center"><%=rs.getString(5)  %></td>
		<td align="center"><%=rs.getString(6)%></td>
		
		<td align="center"><a href="UpdateFacultyDetails1.jsp?fid=<%=rs.getString(1)%>">Edit</a></td>
		<%
	}
	rs.close();		
if(DisRow==0)
{	
	%>		
			<tr><th colspan=5>No Records found</th></tr>
	<%
}
}
%>
</table>
<br>	<br>	<br>
</BODY>
<jsp:include flush="true" page="./footer.jsp"></jsp:include>
</HTML>