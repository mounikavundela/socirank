<link href="svec.cdf" rel="stylesheet">
<html>
<%@page import="java.sql.*"%>
<%@ include file="common.jsp" %>
<body bgColor='papayawhip' >

<center>
<font color=red>
<p align="center"><b>
Dataset Uploading</b></p>
</center>
</font>
<form name=student method=post  action=load1.jsp>
<table align=center border=1>
<tr> 
<td width="44%"> 
<div align='right'><font color='red'>Select Dataset File</font></div>
</td>
<td width="56%"> 
<input type=file name=sai>
</select>
</td>
</tr>
<tr>
<td width="44%">&nbsp;</td>
<td width="56%">
<input type="submit" name="Submit" value="Submit">
</td>
</tr>
</table>
</form>
</body>
</html>
