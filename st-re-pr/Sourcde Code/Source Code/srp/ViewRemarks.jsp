<jsp:include flush="true" page="StudentHeader.jsp"></jsp:include>
<%@ page import="java.sql.*"%>
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
       	  pstmt=con.prepareStatement("select * from student_remarks  where student_id=?");
       	  pstmt.setString(1,(String)session.getAttribute("userid"));
    	  rs=pstmt.executeQuery();
    	   
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
 
<HTML>
<br><br>
<head>
<script language="javascript" src="dateget.js">
</script>
<script language="javascript">
function onlyNumsAllowed()
	{
	    var iKeyCode;

		iKeyCode = event.keyCode;

	    //
	    //  If key pressed is not 0 - 9, don't allow it through.
	    //
	    if( iKeyCode < 48 || iKeyCode > 57 )
	        event.keyCode = null;
	}

function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		
function validate()
		{
			
			if(ChkMandatoryField(fone.flightname,'flightname')==false) return false;
            
            if(ChkMandatoryField(fone.fare,'fare')==false) return false;
            if(ChkMandatoryField(fone.date,'date')==false) return false;
            if(ChkMandatoryField(fone.takeoftime,'takeoftime')==false) return false;
            if(ChkMandatoryField(fone.duration,'duration')==false) return false;
		}
</script>
</head>
<body bgcolor="#FFFAF0"><center>
<form name="frm" method="get">
<font > <h4>VIEW REMARKS</h4></font><br>
<table>
<caption><font size="4" color="choll"></font></caption>





</table>



<table border=1 bordercolor="black" align="center" cellspacing="0">
<tr bgcolor="pink" ><th><b>Remarks</b></th><th><b>Date</b></th></tr>
  
	
    	  	
   
   
    <%
    	
    	
		
		
    	  try
    	  {
    	  
    	  while(rs.next())
    	  {
            System.out.println("--entered--");    
    	  %>
    	   <tr>
    	  	<td><%=rs.getString(2) %>   </td>
    	  	<td><%=rs.getString(3) %>   </td> 
    	    </tr>
    	  		 
    	  
    	   <%
    		  
    	  }
    	 
    	
    
    	
		
		
		

    	  
    	  //pstmt.setString(1,itemname);
    	  //pstmt.setString(2,itemdescription);
    	  //pstmt.setString(3,itemprice);
    	 
   	  	  pstmt.execute();
   	  	System.out.println(".......4........");
    	  
    	  System.out.println(".......5........");
		}
		
		catch(Exception e)
		{System.out.println(".......6........");
			e.printStackTrace();
		}
    
    %>
</table></center>



</body>


<jsp:include flush="true" page="footer.jsp"></jsp:include>
</html>
