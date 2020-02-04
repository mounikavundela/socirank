<link href="svec.cdf" rel="stylesheet">
<html>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ include file="common.jsp" %>
<body bgColor='papayawhip' >

<%
 try
{

String f = "D:/tomcat/webapps/hash/" +  request.getParameter("sai");
     String s,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10;

st1.executeUpdate("delete from data");
 BufferedReader br1 = new BufferedReader(new FileReader(f));
            while ((s = br1.readLine()) != null) {

              StringTokenizer st1 = new StringTokenizer(s, ",");
            while (st1.hasMoreTokens()) {
          s1 = st1.nextToken();
//out.println("s1="+s1);
                    s2 = st1.nextToken();
//                    System.out.println(s2);
                        s3 = st1.nextToken();
//                    System.out.println(s3);
                        s4 = st1.nextToken();
//                    System.out.println(s4);
                        s5 = st1.nextToken();
//                    System.out.println(s5);
                      s6 = st1.nextToken();
//                       System.out.println(s6);
                       s7 = st1.nextToken();
//                       System.out.println(s7);

                       s8 = st1.nextToken();
  s9 = st1.nextToken();
  s10 = st1.nextToken();
st.executeUpdate("INSERT INTO data  VALUES ('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','" + s6 + "','" + s7 + "','" + s8 + "','" + s9 + "','" + s10 + "')");

            }
}
out.println(" <center>Data Loaded Sucesfully");

 }
catch(Exception e){
out.println("Database Not Loaded ....Error..." + e);
 }

        
%>