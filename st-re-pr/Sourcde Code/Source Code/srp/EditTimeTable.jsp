<jsp:include flush="true" page="Header.jsp"></jsp:include>
<% 

 Connection con=null;
 PreparedStatement pstmt=null;
 ResultSet rs=null;
 
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
       	  pstmt=con.prepareStatement("select examid from examination_details");
       	  rs=pstmt.executeQuery();
       	 
       
   	   
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

<%@page import="java.sql.*" %>
<HTML>
<head>
<br><br>
<script language="javascript">
function examid()
{
window.alert(document.frm.search.value);
window.location.href="./EditTimeTable.jsp?search="+document.frm.search.value;


}
</script>


<script language="javascript" src="dateget.js">
</script>
</head>
<body bgcolor="silver"><center>
<form name="frm"  method="Post" action="EditTimeTable">
<font> <h4>ENTER TIME DETAILS/SCHEDULE DETAILS</h4></font><br>
<br><br>
<center>
 <table>
            <tr>
                <td style="width: 563px; height: 26px" align="center">
                    <strong>
                        Enter Exam Id:<select name="search" onchange="return examid();">
                        
                        <%
                        if(request.getParameter("search")!=null)
                        {
                        %>
                         <option value=<%=request.getParameter("search") %>><%=request.getParameter("search") %></option>
                         <%
                         }
                         
                         while(rs.next())
                         {
                         %>
                         <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
                         <%
                         
                         }
                        
                        %>
                         
                        
                        <input type="submit" value="  GO  " name="go">
                        
       
            </tr>
  </table>
        <br />
      
        &nbsp; &nbsp;&nbsp;
    </center>
<table>
<%
if(request.getParameter("search")!=null)
 {
  System.out.println("executed"+request.getParameter("search"));
 %>
 
 <tr><td align="center"><b>Subject:</td><td align="center"><b>Date:</td>
	<tr></tr>
	<%
 try
 {
 System.out.println("executed"+request.getParameter("search"));
 int i=0;
  pstmt=con.prepareStatement("select s.subject,s.date,l.time from examination_details l,time_details s where l.examid=s.examid and l.examid=?");
  pstmt.setString(1,request.getParameter("search"));
    rs=pstmt.executeQuery();
    while(rs.next())
    {
    i=i+1;
 %>
     <tr><td><b><input type="text" name=s<%=i%> value=<%=rs.getString(1) %>></td><td><input type="text" name=d<%=i%> value=<%=rs.getString(2) %>></td><td><a href="javascript:show_calendar('document.frm.d<%=i %>',document.frm.d<%=i %>.value);">date</a></td></tr>
     <%
     if(i==6)
     {
     %>
     	<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr><td><b>The Time of Exams Is:</td><td><input type="text" name="time" value=<%=rs.getString(3) %>></td><td><a href="javascript:show_calendar('document.frm.time', document.frm.time.value);">date</a></td></tr>
	<%
	}
	 %>	
<%
     }
    } 
    catch(Exception e)
    {
    e.printStackTrace();
    
    }
   } 
 %>
    
	
	
	

 
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="submit" name="sub" value="ADD" onclick="return validate()"></center>
</body>

<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
