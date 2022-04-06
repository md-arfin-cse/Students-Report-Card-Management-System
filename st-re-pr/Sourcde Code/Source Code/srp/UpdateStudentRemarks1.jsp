<jsp:include flush="true" page="Header.jsp"></jsp:include>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<head>
<script language="javascript">
function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		
		function validate()
		{
			if(ChkMandatoryField(frm.universityname,'UniversityName')==false) return false;
            if(ChkMandatoryField(frm.location,'Location')==false) return false;
             if(ChkMandatoryField(frm.phno,'PhoneNo')==false) return false;
            if(ChkMandatoryField(frm.address,'Address')==false) return false;
            if(ChkMandatoryField(frm.www,'www')==false) return false;
            
             
              
            
            
            
            
		}
		
	</script>
	<script type="text/javascript" src="dateget.js"></script>


<title>Edir Requests</title>
</head>

<body>



<form action="./UpdateStudentRemarks" method="post" name="frm">
<br>
<br>
<br>
<br>
<h3 align=center>UPDATE STUDENT REMARKS</h3></font></h3>
<%
/*Declaration of variables*/

Connection con;
PreparedStatement pstmt,pstmt1;
ResultSet rs=null,rs1=null;

String universityname,location,phoneno,address,www;
 String uid=request.getParameter("uid");

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
System.out.println("executed"+request.getParameter("rid"));
       	  pstmt=con.prepareStatement("select * from student_remarks where remark_id=?");
       	  pstmt.setString(1,request.getParameter("rid") );
       	  rs=pstmt.executeQuery();


	     
       	
    	  


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
	<table align="center">
	<td><input type="hidden" name="rid" value=<%=request.getParameter("rid") %>></td></tr>
	<tr><td><b>StudentId:</td><td><input type="text" name="sid" value=<%=rs.getString(1) %>></td></tr>
<tr><td><b>Remarks:</td><td><textarea cols=20 rows="3" name="remark" ><%=rs.getString(2)%></textarea></td></tr>
<tr><td><b>Date:</td><td><input type="text" name="date" value=<%=rs.getString(3)  %>></td><td><a href="javascript:show_calendar('document.frm.date', document.frm.date.value);">date</a></td></tr>

<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<tr><td colspan="2"><center><input type="submit"value="Update" onclick="return validate()"></center></td></tr>
</table>

	
	<% 
	   	
if(DisRow==0)
{	
	%>		
	  <tr><th colspan=6>No Jobs found</th></tr>
	<%
}
}
}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
</table>
<br>
<br>

</form>
<br><br>
</BODY>
<jsp:include flush="true" page="footer.jsp"></jsp:include>
</HTML>




	
       	 
       
   	   
