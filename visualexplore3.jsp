<link href="svec.cdf" rel="stylesheet">
<%@page import="java.sql.*"%>
<%@ include file="common.jsp" %>
<body bgColor='papayawhip' text="#FFFFFF">
<%
String str ="";
    
String s = "select distinct country from data";
String s1 = "select distinct topic from data";
ResultSet rs = st.executeQuery(s);
ResultSet rs1 = st1.executeQuery(s1);
%>

<form method =post action =visualexplore33.jsp>
<table border=1 align=center>
<caption> <font color=black> <b> Selected Device Visual Exploration </caption>
<Tr>
<td> Select country </td>
<td> <select name=country>
<%
while(rs.next())
{
%>
<option> <%=rs.getString(1)%> </option>
<%
  } %>
</select>
</tr>
<tr> 
<td> Topic  </td>
<td> <select name=topic>
<%
while(rs1.next())
{
%>
<option> <%=rs1.getString(1)%> </option>
<%
  } %>
</select>
</tr>
<tr> <td> Device </td>
 <td> <select name=review> <option value=l> Linux </option> <option value=w> Windows</option> 
</tr>
</table>
<center>
<input type=submit value=submit>
</form>

