<jsp:include flush="true" page="TeacherHeader.jsp"></jsp:include>
<%@ page errorPage="error.jsp"%>
<% 
/*	String login = (String)session.getAttribute("recid");
	if(login==null)
	{
		response.sendRedirect("logbean.jsp");
	}*/
	String msg=request.getParameter("msg");
	if(msg==null)
	{
		 msg="";
	}
%>
<html>
<head>
<title>Untitled Document</title>
<link href="port.css" rel="stylesheet" type="text/css">
<link href="ISSCSS.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background-color: white;
}
body,td,th {
	color: #990099;
	font-weight: bold;
	font-style: italic;
}
-->
</style></head>

<body>
<br>
<br>
<br>

 <h2 align="center" class="Sitemap1">change password </h2>

<form name="form1" method="post" action="PasswordChange1">
  <center>
    <p>&nbsp;</p>
    <p><font color="red"><%=msg%></font>
        </p>
  </center>
  <table width="352" height="105" border="0" align="center">
    <tr>
      <td width="171" class="text"><div align="left">Old Password : </div></td>
      <td width="171"><input name="opass" type="password" class="borderBlue" id="opass"></td>
    </tr>
    <tr>
      <td class="text"><div align="left">New Password : </div></td>
      <td><input name="npass" type="password" class="borderBlue" id="npass"></td>
    </tr>
    <tr>
      <td class="text"><div align="left">Confirm Password : </div></td>
      <td><input name="cpass" type="password" class="borderBlue" id="cpass"></td>
    </tr>
  </table>
  <br>
 <font color="red"></center></font>
 <div align="center"></div>
  <p align="center">
    <input name="Submit" type="submit" id="button" value="Submit">
  </p>
</form>
<jsp:include flush="true" page="footer.jsp"></jsp:include>
</body>
</html>
