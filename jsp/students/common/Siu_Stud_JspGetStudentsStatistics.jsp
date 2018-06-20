<%@page
import="java.lang.*"
import="java.util.*"
import="java.io.*"
import="java.text.*"
import="javax.servlet.http.*"
import="javax.servlet.*"
import="javax.servlet.*"
import="siu.administration.common.utility.Siu_ContainerLabel"
%>


<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="statistics" class="siu.administration.common.utility.Siu_Container" scope="session" />
<jsp:useBean id="param" class="siu.administration.common.utility.Siu_Container" scope="session" />



<%!
   HttpSession session =null;
   String Id = "";
   String tStat[][]=null;
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   tStat = (String[][])statistics.getElement(0);
   %>

<html>
<head>

<title><%=labels.getElement("00033")%> </title>
<style type="text/css">
<!--
.style4 {
	font-size: 24px;
	color: #000099;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style5 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0000FF;
	font-size: 18px;
}
.style1 {color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; }
.style2 {color: #000000}
.style8 {color: #FFFFFF}
.style10 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style11 {
	font-family: Arial, Helvetica, sans-serif;
	font-style: italic;
}
</style>


</head>
<script languaje="JavaScript" >

function personal(valor)
{
var dato=valor;
document.forms.forma.login.value=dato;
document.forms.forma.submit();
}

function popUp(URL) 
{
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '_blank', 'titlebar=0,toolbar=1,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=1000,height=600');");
}




</script>

<body background="/fondo.jpg" link="0000FF" vlink="0000FF" alink="0000FF">

<form name="forma" method="post" id="forma" action="/siu/siu.students.servlet.Siu_Stud_ServletGetStudents" >
  <div align="center" class="style4">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
		  <div align="center"><p class="style5"><%=labels.getElement("00030")%></p>
		  </div>          
          <p>&nbsp;</p>
<p align="center">&nbsp; </p>
		  <div align="center" class="style10">  
		    <p><%=labels.getElement("00081")%> </p>
	      </div>
<table width="400"  border="1" align="center"  bordercolor="#000000" bgcolor="#FFFFFF">
<%
	for(int i = 0; i<param.getSize(); i++)
	{
	   
		if((i%2)==0)
		{%>
		    <tr bordercolor="#FFFFFF">
			<td width="185"><span class="style10"><%=labels.getElement((String)param.getElement(i))%> :  </span></td>   	
	  <%}
	   else
	   {%>
	    	<td width="199"><span class="style11"><%=param.getElement(i)%> </span></td>
			</tr>
		   	
	   <%} 
    }
%>
</table>
<p>&nbsp;</p>
<div align="center" >
<table  border="0" bgcolor="" align="center">




<%
  if(tStat[0].length == 3)
  {%>
		<tr>
		  <td width="228" height="15" align="center"   bgcolor="#000066" ><pre class="style8" ><%=labels.getElement("00018")%></pre></td>
		  <td width="228" height="15" align="center"   bgcolor="#000066" ><pre class="style8" ><%=labels.getElement("00002")%></pre></td>
		  <td width="228" height="15" align="center"   bgcolor="#000066" ><pre class="style8" ><%=labels.getElement("00079")%></pre></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		</tr>	 
<%	  for (int i = 0; i < tStat.length; i++)
	  {
	    if((i%2)==0)
		{%>

		<tr>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style2" ><a href="javascript:personal('<%=tStat[i][1]%>')"><%=tStat[i][1]%></a></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style1" ><%=tStat[i][0]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style1" ><%=tStat[i][2]%></pre></td>
		</tr>
	   <%
	   }
	   else
	   {%>
		<tr>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><a href="javascript:personal('<%=tStat[i][1]%>')"><%=tStat[i][1]%></a></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><%=tStat[i][0]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><%=tStat[i][2]%></pre></td>
		</tr>	   
	   <%}
	   }
	 
   }
   else
   {%>
   		<tr bgcolor="#000066">
			<td width="228" height="15" align="center" ><pre class="style8" ><%=labels.getElement("00002")%></pre></td>
		  <td width="228" height="15" align="center" ><pre class="style8" ><%=labels.getElement("00018")%></pre></td>
			<td width="228" height="15" align="center" ><pre class="style8" ><%=labels.getElement("00031")%></pre></td>
		  <td width="228" height="15" align="center" ><pre class="style8" ><%=labels.getElement("00129")%></pre></td>
		  <td width="228" height="15" align="center" ><pre class="style8" ><%=labels.getElement("00078")%></pre></td>
		</tr>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>		
		</tr>
<%   	  for (int i = 0; i < tStat.length; i++)
	  {
	  	if((i%2)==0)
		{%>

		<tr>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style2" ><a href="javascript:personal(<%=tStat[i][2]%>)"><%=tStat[i][2]%></a></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style1" ><%=tStat[i][3]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style1" ><%=tStat[i][4]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style1" ><%=tStat[i][0]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666" ><pre class="style1" ><%=tStat[i][1]%></pre></td>

	<%	 }
	else
	{%>
		<tr>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><pre class="style2" ><a href="javascript:personal('<%=tStat[i][2]%>')"><%=tStat[i][2]%></a></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><%=tStat[i][3]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><%=tStat[i][4]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><%=tStat[i][0]%></pre></td>
			<td width="228" height="15" align="center"   bgcolor="#cccccc" ><pre class="style2" ><%=tStat[i][1]%></pre></td>
		</tr>	
	<%}
		}
   }%>
</table>
<span class="style8"><%=labels.getElement("00077")%></span>
<input name="login" type="hidden" value="">
</div>

<div align="center"><a href="javascript:popUp('/siu/siu.students.servlet.Siu_Stud_ServletSetReport')" >Generar Reporte</a>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>
</body></html>

