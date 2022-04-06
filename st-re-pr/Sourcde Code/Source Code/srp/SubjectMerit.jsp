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
       	  pstmt=con.prepareStatement("select distinct currentstandard from student_details");
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
<script language="javascript">
function examid()
{
window.alert(document.frm.sid.value);
window.location.href="./SubjectMerit.jsp?sid="+document.frm.sid.value+"&eid="+document.frm.ename.value+"&subject="+document.frm.subject.value;


}



</script>

<body bgcolor="silver"><center>
<br>
<br>
<br>
<form name="frm" >
<font size="4" >SUBJECTWISE MERIT</font><br><br>
<table>


<tr><td><b>Standard:</b></td><td><select name="sid">
<%
while(rs.next())
{
%>
<option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
<%
}
%>

</td></tr>

<tr><td><b>Exam Name:</b></td><td><select name="ename">

<option value="Quarterly">Quarterly</option>
<option value="HalfYearly">HalfYearly</option>
<option value="Annual">Annual</option>
<option value="Assignment">Assignment</option>
<option value="UnitTest">UnitTest</option>
</select>
</td>
</tr>

<tr><td><b>Subject:</b></td><td><select name="subject">

<option value="Telugu">Telugu</option>
<option value="Hindi">Hindi</option>
<option value="English">English</option>
<option value="Maths">Maths</option>
<option value="Science">Science</option>
<option value="Social">Social</option>
</select>
</td>
</tr>
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


<input type="submit" value="SUBMIT" onclick="return examid()"></form>

<table border="1" bordercolor="black" cellspacing="0" align="center">
<%
if(request.getParameter("sid")!=null)
 {
  System.out.println("executed"+request.getParameter("sid"));
 %>
 
 <tr><td align="center"><b>Student Name</td><td align="center"><b> Marks Secured</td>
</tr>
	<%
 try
 {
    System.out.println("executed"+request.getParameter("sid"));
    int i=0;
String ss= request.getParameter("subject");
  //pstmt=con.prepareStatement("Select subject_name,actual_marks,scored_marks from student_report where student_id=? and test_id=?");
  pstmt=con.prepareStatement("select max("+ss+"),d.student_name from studentreport1 r,student_details d where test_id=? and d.student_id=r.student_id and d.currentstandard=? group by r.test_id");

 // pstmt.setString(1,request.getParameter("subject"));
  pstmt.setString(1,request.getParameter("ename"));
  pstmt.setString(2,request.getParameter("sid"));
    rs=pstmt.executeQuery();
    System.out.println("--executing1--");
    while(rs.next())
    {
    System.out.println("--executing--"+rs.getString(1));
      i=i+1;
  %>
     
     <tr><td align="center"><%=rs.getString(2) %></td><td align="center"><%=rs.getString(1)%></td></tr>
     
    
 <%
     }
     

     }
 
    catch(Exception e)
    {
       e.printStackTrace();
    }
   } 
 %>
    
	
	
	

 
</table><br>


</body>


<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
