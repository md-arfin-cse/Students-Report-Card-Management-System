<html>
<body bgcolor="white">
<form>
	<%
	HttpSession hs=request.getSession();
    String uname=(String)hs.getAttribute("uname");
	String role=(String)hs.getAttribute("role");
	 %>
<div style="position:absolute; left:0px; top:1px;">
<table width="1010px" bgcolor=black>
<tr>
<td>
<img src="./images/school.jpg" height="158px" width="300px" ></img>
</td>
</tr>
</table>
</div>
<div style="position:absolute; left:440px; top:100px;">
<font face="arial narrow" size="6px" color="orange"><b>Student Result Processing</b></font>
</div>

<div style="position:absolute; left:700px; top:119px;">
<font color=orange>
       <b>  <%if(role.equals("admin")){%>Welcome,&nbsp;&nbsp; Admin<%} else {%>Welcome,&nbsp;&nbsp;<%=uname%> <%} %> </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
       <b>[ <%if(role.equals("admin")){%><a href="./AdminHome.jsp"><%} else if(role.equals("student")){%> <a href="./StudentHome.jsp?cat=Tester"><%} else if(uname.equals("Developer")){%><a href="./DeveloperHome.jsp?cat=Developer&uname=<%=uname%>"><%}else if(uname.equals("HrManager")){%><a href="./HrMangerHome.jsp?cat=HrMangager&uname=<%=uname%>"><%} %><font color="orange">home</font></a> ]</b>&nbsp;
            <%if(role=="student"){%><b>[ <a href="./logout.jsp"><font color="orange" size="3px">logout</font></a> ]</b><%} %>
       </font>     
</div>
<div style="position:absolute; left:0px; top:190px;">
<hr color=black>
</div>

<br><br><br><br><br><br><br><br>
<script type="text/javascript">
sfHover = function() {
   var sfEls = document.getElementById("nav").getElementsByTagName("LI");
   for (var i=0; i<sfEls.length; i++) {
      sfEls[i].onmouseover=function() {
         this.className+=" over";
      }
      sfEls[i].onmouseout=function() {
         this.className=this.className.replace(new RegExp(" over\\b"), "");
      }
   }
}
if (window.attachEvent) window.attachEvent("onload", sfHover);

</script>


<style type="text/css">

ul#nav, ul#nav ul {
   margin: 0;
   padding: 0px;
   list-style: none;
   
   }

ul#nav  li {
   position: relative;
   float: left;
   width:140px;
   font-size: 12px;
  
   
  
}
   
#nav li ul {
   position: absolute;
   margin-left: -999em; /* hide menu from view */
   top: 20;
   left:0;
}

/* Styles for Menu Items */
ul#nav  li a {
   display: block;
   text-decoration: none;
   color:"black";
   padding: 2px;
   border: 1px solid #ccc;
   
   min-height:0;
   }
/* commented backslash mac hiding hack \*/
* html ul#nav  li a {height:1%;   position:relative;}
/* end hack */

/* this sets all hovered lists to black */
#nav li:hover a,#nav  li.over a,
#nav li:hover li a:hover,#nav li.over li a:hover {
   color: #fff;
   background-color: black;}
    
/* set dropdown to default */
#nav li:hover li a,#nav li.over li a {
   color: black;
   background-color:silver; */
}
#nav li ul li a { padding: 2px 2px; } /* Sub Menu Styles */
#nav li:hover ul,#nav li.over ul {margin-left:0; } /* show menu*/

</style>

<body bgcolor="white">
<form>

<table border=0 align=right>
        <tr><td>
<font size="3px">
  <ul id="nav">
  <li><a href="#">View</a>
  <ul id="nav">
       <li><a href="./ViewStudentProfile.jsp">Profile</a></li>
       <li><a href="./ViewNotification.jsp">Notification</a></li>
       <li><a href="./ViewReport1.jsp">Report</a></li>
       <li><a href="./ViewRemarks.jsp">Remarks</a></li>
       <li><a href="./ViewTimeTable.jsp">TimeTable</a></li>
       
    </ul>
  </li>
  <li><a href="#">Edit</a>
    <ul>
	   <li><a href="./Recchange_pass.jsp">Password</a></li>
      
         
    </ul>    
  </li>
  
   
  
  </font>
        
        </td></tr>
        
    </table><br>
    


	
	

</form>
</body>
</html>