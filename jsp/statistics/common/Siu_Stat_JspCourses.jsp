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

<%!
   HttpSession session =null;
   String Id = "";
   String s[][]=null;	
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   s= (String[][])statistics.getElement(0);
%>

<html>
<head>
      <title><%=labels.getElement("00033")%></title>
<style type="text/css">

<!--
.style1 {
	font-size: 24px;
	color: #000099;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style2 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0000FF;
	font-size: 18px;
}
.style4 {font-family: Arial, Helvetica, sans-serif}
.style5 {color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; }
.style6 {color: #000000}
.style7 {font-size: 16px}

-->
      </style>
</head>
<script language="javascript">
function mode(v) 
{
  var data;
  data=v;
    if (data == 0) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="hidden";		
      }
    if (data == 1) 
      {
        document.all['uno'].style.visibility="visible";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="hidden";		
		//document.all['radio2'].blur();

      }
    if (data == 2) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="visible";
		document.all['tres'].style.visibility="hidden";
		
		///document.all['radio1'].blur();

      }
	  if (data == 3) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="visible";		
		//document.all['radio1'].blur();

      }
	 
}
</script>

<body link="0000FF" vlink="0000FF" alink="0000FF" onLoad="mode(0)">
<form>
<h1 align="center">
<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
          <p class="style2"><%=labels.getElement("00145")%></p>
          <p>&nbsp;</p>
           

</h1>

<table width="200" border="0"  align="center" bgcolor="#666666">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio" onClick="mode(1)" id="radio" bgcolor="#666666"></td>
    <td width="151"><span class="style3" bgcolor="#666666"><span class="style5"><%=labels.getElement("00142")%></span></span></td>
  </tr>
</table>

<p>&nbsp;</p>
<div id ="uno">
<table width="208" border="0" align="center">
<%
if(s.length > 0)
{
	for(int i = 0; i < s.length; i++)
	{%>
  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a href="/siu/siu.statistics.servlet.Siu_Stat_ServletConsultCourse?option=2&semestre=<%=s[i][0]%>"><%=s[i][1]%></a></span></div></th>    
  </tr>
	<%}
}
else
{%>
	<div align="center"> <%=labels.getElement("00092")%> </div>
<%}%>
</table>
  
</div>
<p>&nbsp;</p>
  <table width="200" border="0"  align="center" bgcolor="#666666">
    <tr>
      <td width="33"><input type="radio" name="RadioGroup" value="radio" onClick="mode(2)" id="radio2" bgcolor="#666666"></td>
      <td width="151"><span class="style3" bgcolor="#666666"><span class="style5"><%=labels.getElement("00143")%></span></span></td>
    </tr>
  </table>
  <p>&nbsp;</p>

<div id ="dos">
<table width="208" border="0" align="center">
<%
if(s.length > 0)
{
	for(int i = 0; i < s.length; i++)
	{%>
  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a href="/siu/siu.statistics.servlet.Siu_Stat_ServletConsultCourse?option=3&semestre=<%=s[i][0]%>"><%=s[i][1]%></a></span></div></th>    
  </tr>
	<%}
}
else
{%>
	<div align="center"> <%=labels.getElement("00092")%> </div>
<%}%>
</table>
</div>

  <p>&nbsp;</p>
  <table width="200" border="0"  align="center" bgcolor="#666666">
    <tr>
      <td width="33"><input type="radio" name="RadioGroup" value="radio" onClick="mode(3)" id="radio2" bgcolor="#666666"></td>
      <td width="151"><span class="style3" bgcolor="#666666"><span class="style5"><%=labels.getElement("00144")%></span></span></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <div id="tres">
<table width="208" border="0" align="center">
<%
if(s.length > 0)
{
	for(int i = 0; i < s.length; i++)
	{%>
  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a href="/siu/siu.statistics.servlet.Siu_Stat_ServletConsultCourse?option=4&semestre=<%=s[i][0]%>"><%=s[i][1]%></a></span></div></th>    
  </tr>
	<%}
}
else
{%>
	<div align="center"><%=labels.getElement("00092")%> </div>
<%}%>
</table>
  </div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>

<p>&nbsp;</p>
<p align="center" class="style7"><span class="style4 style7"><strong> </strong></span></p>




</form>
</body>
</html>
