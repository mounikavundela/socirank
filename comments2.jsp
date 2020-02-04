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

<form method =post action =comments22.jsp>
<table border=1 align=center>
<caption> <font color=black> <b> Selected Topic Comments</caption>
<Tr>
<td> Select Topic </td>
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
<tr> <td> Select Review </td>
 <td> <select name=review> <option value=1> Positive </option> <option value=2> Negative</option> 
</tr>
</table>
<center>
<input type=submit value=submit>
</form>

