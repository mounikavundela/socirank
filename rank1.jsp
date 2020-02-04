<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@ page import="org.jfree.chart.plot.PiePlot3D" %>
<%@ page import="org.jfree.data.general.DefaultPieDataset" %>
<%@ page import="org.jfree.data.general.PieDataset" %>
<%@ page import="org.jfree.data.jdbc.JDBCPieDataset" %>
<%@ include file="common.jsp" %>


<%


	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	Statement st4 = con.createStatement();
	Statement st5 = con.createStatement();
	Statement st6 = con.createStatement();
	Statement st7 = con.createStatement();
	Statement st8 = con.createStatement();
	Statement st9 = con.createStatement();
	Statement st10 = con.createStatement();
	Statement st11 = con.createStatement();
//st2.executeUpdate("drop table at");
// st1.executeUpdate("create table at as select userid,equery,count(*)-(count(*)-1) aa from //logsearch group by userid,equery");

String query="select topic,count(*) from data group by topic";





JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/live","com.mysql.jdbc.Driver","root","root");

dataset.executeQuery( query);
JFreeChart chart = ChartFactory .createLineChart("Ranking in Graph", "category", "counts",dataset,PlotOrientation.VERTICAL,true, true, false);


ChartUtilities.saveChartAsJPEG(new File("D:/tomcat/webapps/hash/charts/123.jpg"), chart, 400, 300);

JFreeChart cha;

dataset.executeQuery(query);
        cha = ChartFactory.createBarChart3D("Frequent Items Bar Graph", "Words", "counts",dataset, PlotOrientation.VERTICAL, true, true, false);

try
{ 

%>
<table>
<%
ChartUtilities.saveChartAsJPEG(new File("D:/tomcat/webapps/hash/charts/1234.jpg"), cha, 400, 300);



DefaultPieDataset dataset1 = new JDBCPieDataset(con ,query);
PieDataset dataset3 = dataset1;
JFreeChart chart1= ChartFactory.createPieChart3D(
            "Frequent Items Pie Chart", dataset1, true, true, false);
ChartUtilities.saveChartAsJPEG(new File("C:/Program Files/Apache Group/Tomcat 4.1/webapps/hash/charts/12345.jpg"), chart1, 400, 300);



JFreeChart chart2 = ChartFactory .createAreaChart("Frequent Items Area Graph", "Words", "Counts",dataset,PlotOrientation.VERTICAL,true, true, false);

ChartUtilities.saveChartAsJPEG(new File("D:/tomcat/webapps/hash/charts/123456.jpg"), chart2, 400, 300);


response.sendRedirect("groupan1.jsp");

%>
</table>
<%
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}

%>


