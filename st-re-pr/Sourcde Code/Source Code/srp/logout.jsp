
<html>
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
<%
HttpSession hs=request.getSession();
hs.invalidate();
 %>
 <hr>
<br><br><br><br><br><br>
<center><font face="arial narrow"><b> You have been logged out. Click <a href="./Home.jsp"><font color="red">here</font></a> to go Home</b></font></center>
<br><br><br><br><br><br>
<jsp:include  page="footer.jsp"></jsp:include>
</html>