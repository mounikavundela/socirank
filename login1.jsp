<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ include file="makecon.jsp" %>

<% 
   String uid=request.getParameter("uid");
   String pwd=request.getParameter("pwd");
   session.putValue("blogin",uid);
ResultSet rs=st.executeQuery("select * from users where userid='" + uid + "' and password='" +pwd+  "'");
session.putValue("uid",uid);

if(uid.equals("admin") && pwd.equals("admin"))
{%>
    <jsp:forward page="index.jsp"/>
   <% 
}
 else
   if(rs.next())
   {
    String typs=rs.getString("typs");

   if(typs.equals("h"))
 {
%>
    <jsp:forward page="hod.jsp"/>
   <% }
	else
   if(typs.equals("g"))
{
%>
    <jsp:forward page="guide1.jsp"/>
   <% }
   else
   if(typs.equals("r"))
{
%>
    <jsp:forward page="group.jsp"/>
   <% }
   else
   if(typs.equals("e"))
{
%>
    <jsp:forward page="exam.jsp"/>
   <% }

	else

		{out.println("invalid");}
}

else
  {
	out.println(" <body background=bak.JPG> <center>Login Failed <br><br><a href=welcome.jsp> Login </login>");
   } %> 
  
