<html>
<%
String msg=null;

msg=request.getParameter("msg");

 %>
<head>
<script type="text/javascript">
function check()
{
<%
if(request.getParameter("msg")!=null)
{
%>
var msg='Please Check your userid and password';
alert(msg);
<%
}


if(request.getParameter("msg1")!=null)
{
%>
var msg1='Permission not granted';
alert(msg1);
<%
}

%>
}

//}
</script>
</head>
<body onload="return check()"><center>

<div style="position:absolute; left:0px; top:1px;">
<table width=100% bgcolor=black>
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

<br><br><br><br><br><br><br>
<table width="100%">
	<tr>
	<td align=""></td>
	</tr>
</table>
<hr>
<br><br>
<table width="80%" border=0 cellpadding=12>
<tr><td>
<p align="justify"> <font face="arial narrow"><b>
	Intelli-School project is aimed at developing a school administration system which can Stream line the administration of school. It solves the problems of school management and make easier to maintain students data and develops a strong interaction between the teachers and students. It finds very easier for the parents to get information regarding their pupils and to contact the respective teacher. It assists the school administration to perform various activities.
</b></font></p>
<td><jsp:include page="./Login.html" /></td>
</tr>
</table>
<br><br><br>
</center>
</body>
<jsp:include page="./footer.jsp" />   

</html>