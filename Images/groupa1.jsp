<%@ include file="common.jsp" %>
<link href="svec.cdf" rel="stylesheet">
<%@ page import="java.sql.*" %>
<html>
<body bgColor='papayawhip' >
<%
try{
String branch= request.getParameter("branchid");
String branch1= request.getParameter("branchid");
int nospb =  Integer.parseInt(request.getParameter("nos"));


	PreparedStatement sst6=null;
	st5.executeUpdate("delete nob");
	
	String cmd4="INSERT INTO nob VALUES(?)";
	sst6=con.prepareStatement(cmd4);

		sst6.setInt(1,nospb);
		int eff3=sst6.executeUpdate();



    java.text.SimpleDateFormat fmt=new java.text.SimpleDateFormat("yyyy");
    String msgdate=fmt.format(new java.util.Date()).toString();


ResultSet rs1 = st1.executeQuery("select count(*) from student where status = 'c' and branch='" + branch + "'");
ResultSet rs2 = st2.executeQuery("select mod(count(*)," + nospb + ") from student where status = 'c' and branch='" + branch + "'");
ResultSet rs4 = st7.executeQuery("select floor(mod(count(*)," + nospb + ")) from student where status = 'c' and branch='" + branch + "'");

String nn=null;

while(rs4.next())
{
nn=rs4.getString(1);
}



int ts=0,ts1=0,rss=0,val1=0;
String sid=null;
int[] tm;
tm = new int[150];    
String names[] = new String[150];



for(int y=0;y<=149;y++)
   tm[y] = 0;



//ts total batches
//ts1  remain students

int tos=0;

if(rs1.next())
{
ts = rs1.getInt(1);
tos = ts;
}
rs1.close();
rss=ts;


if(rs2.next())
{
ts1 = rs2.getInt(1);
}
ts=ts/nospb;
rs2.close();

if(ts1>0)
{
ts++;
rss++;
}

int bacremains = ts-(tos/nospb);
int batchcons = tos/nospb;
int remainstud=0;

if(batchcons>=1)
  remainstud = tos-(tos/nospb * nospb);

 

int[][] tm1 = new int[nospb][ts];      


for(int y=0;y<nospb;y++)
  for(int yy=0;yy<ts;yy++)
   tm1[y][yy] = 0;





String cmd ="insert into pgroups values (?,?,?,?,?)";
String cmd1 ="insert into users values (?,?,?)";


PreparedStatement sst=null,sst1=null;
sst=con.prepareStatement(cmd);
sst1=con.prepareStatement(cmd1);


    String getid="select MAX(to_number(substr(studid,length(branch)+1))) from pgroups where branch='" + branch + "'";

	ResultSet rs7=st6.executeQuery(getid);
	int val=0;
		if(rs7.next()){
			val=rs7.getInt(1);
			if (val>0){ val+=1;}
			else{val=1;}
		}

val1=val;
int j = 1;

for(j=1;j<=rss;j++)
{
if(j%nospb==0)
{
branch1 = branch + val;
sst1.setString(1,branch1);
sst1.setString(2,branch1);
sst1.setString(3,"r");
val++;
int eff1=sst1.executeUpdate();
}

}


ResultSet rs = st.executeQuery("select studid,marks,branch,status from student where branch='" + branch + "' and status not in ('s') order by marks desc");
ResultSet rs3 = st3.executeQuery("select studid,marks,branch,status from student where branch='" + branch + "' and status not in ('s') order by marks desc");

int u=0;

while(rs3.next())
{
names[u] = rs3.getString(1);
tm[u++] = rs3.getInt(2);
}






int val2=0,k=1;
String sid1=null;
val2=val1;
String t = null;
int z = 0,z1=0,extra=0,tns=0;


		if(rs.next())
		{
		sid1 = rs.getString(1);
		}

int end=0;
end = nospb;

int ll = (tos/ts) + 1;

int start1=0,end1=ts,ii=0,lp=0,rx=0;


for(int tr=0;tr<nospb;tr++)
{


if(tr%2==1 && tr>0)
{
start1=end1;
end1= (end1 + ts)-1;
}
else
if(tr%2==0 && tr>0)
{
start1=end1+nospb;
end1= (start1 + ts)-1;
}


 out.println("loop " + tr + "  " + start1  + "  " + end1);





	if(remainstud>0)
	{
	
	if(tr==0)
	{ lp=ts-1;
	  for(;start1<end1;start1++)
	   {
           tns++;
	   tm1[tr][lp] = tm[ii++];
	    out.println(tm1[tr][lp] + "-");
		lp--;
	   }
	}
	else
	if(tr%2==1)
	{ lp=ts-1;
	  for(;end1>=start1;end1--)
	   {
	   tns++;
	   tm1[tr][lp] = tm[end1];
	    out.println(tm1[tr][lp] + "-" );
		lp--;
	
	   }
	}
	else

	{ lp=ts-1;
	  for(;start1<=end1;start1++)
	   {
         tns++;
	   tm1[tr][lp] = tm[start1];
	    out.println(tm1[tr][lp] + "-" );
		lp--;
	
	   }
	}}
else
{
    out.println("extra");
    
    rx=tos-tns;
    if(rx<=nospb)
   {
    for(int ir=0;ir<rx;ir++)
   {
    tm1[tr][extra] = tm[tns];
    out.println(tm1[tr][extra] + "- ");
    extra++;
    tns++;
   }
  }






   


}

out.println("<br>");


remainstud--;

}











for(int r = 1 ;r<=ll ;r++)
{
val1=val2;

if(r==1)
   z=0;
else
if(r==2)
{
  z= ts;
  end = (ts * r);
}
else
if(r%2==0 && r > 1)
{
  z= end + 1;
  end = (ts * r)-1;

}
else
{
  z = end + 1;
  end = ts * r;
  

}

out.println(z);
out.println(end);


if(r==1)
 {
	  for(z=0;z<ts;z++)
	    {
		if(tos>0)
		{
   	       
		branch1 = branch + val1;
		val1++;
		out.println(branch1);
	       out.println(tm[z]);

		st4.executeUpdate("update student set status = 'a' where branch='" + branch + "' and studid ='" + names[z] + "'");		
		sst.setString(1,branch1);
		sst.setString(2,names[z]);
		sst.setString(3,branch);
		sst.setString(4,msgdate);
		sst.setString(5,"a");
		int eff=sst.executeUpdate();

		tos--;		
		}
	   }

}




if(r%2==0)
{
z1=end - 1;
	  for(;z1>=z;z1--)
	    {
		if(tos>0)
		{

		branch1 = branch + val1;
		val1++;
		out.println(branch1);

	       out.println(tm[z1]);

		st4.executeUpdate("update student set status = 'a' where branch='" + branch + "' and studid ='" + names[z-1] + "'");		
		sst.setString(1,branch1);
		sst.setString(2,names[z1]);
		sst.setString(3,branch);
		sst.setString(4,msgdate);
		sst.setString(5,"a");
		int eff=sst.executeUpdate();
		tos--;
	}
		
	   }
}
else
if(r%2==1 && r > 1)
{

	  for(;z<=end;z++)
	    {
		if(tos>0)
		{

		branch1 = branch + val1;
		val1++;
		out.println(branch1);
	       out.println(tm[z-1]);

		st4.executeUpdate("update student set status = 'a' where branch='" + branch + "' and studid ='" + names[z-1] + "'");		
		sst.setString(1,branch1);
		sst.setString(2,names[z-1]);
		sst.setString(3,branch);
		sst.setString(4,msgdate);
		sst.setString(5,"a");
		int eff=sst.executeUpdate();

		tos--;
		}

	   }
}


	

out.println("<br>");







}




out.println("<center>Project Groups Created");
rs.close();


//}


}
catch(Exception e)
{
%>
<body bgColor='papayawhip' >
  <br>  <br>  <br>  <br>
  <center>
  <a href="javascript:history.back()"><img src="images\cont.png" 
border=0></a>&nbsp;&nbsp;
  <br>  <br>  <br>  <br>
<% 
 out.println(e.getMessage());
}
%>
