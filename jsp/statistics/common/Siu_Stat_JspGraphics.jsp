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
<jsp:useBean id="stat" class="siu.administration.common.utility.Siu_Container" scope="session" />
<jsp:useBean id="meses" class="siu.administration.common.utility.Siu_Container" scope="session" />


<%!
   HttpSession session =null;
   String Id = "";
   String s[][]=null;	
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   s= (String[][])stat.getElement(0);
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

</script>

<body link="0000FF" vlink="0000FF" alink="0000FF" >
<form>
<h1 align="center">
<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
          <p class="style2"><%=labels.getElement("00146")%></p>
          <p>&nbsp;</p>
  </h1>

<table width="208" border="0" align="center">

  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a onClick="window.open('/siu/siu.statistics.servlet.Siu_Stat_ServletSetGraphic?option=1&semestre=<%=s[s.length-1][1]%>','','width=1000,height=800,scrollbars=no,resizable=no,status=no, location=no, menubar=no,directories=no');" href="#"><%=labels.getElement("00071")%>s</a></span></div></th>    
  </tr>
  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a   onClick="window.open('/siu/siu.statistics.servlet.Siu_Stat_ServletSetGraphic?option=2&semestre=<%=s[s.length-1][1]%>','','width=1000,height=800,scrollbars=no,resizable=no,status=no, location=no, menubar=no,directories=no');" href="#" ><%=labels.getElement("00074")%>s</a></span></div></th>    
  </tr>	
</table>


<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="208" border="0" align="center">
<tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><%=labels.getElement("00147")%></span></div></th>    
  </tr>
  <tr>
  <td>&nbsp;</td>
  </tr>
<%
if(s.length > 0)
{
	for(int i = 0; i < s.length; i++)
	{%>
  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a href="#" onClick="window.open('/siu/siu.statistics.servlet.Siu_Stat_ServletSetGraphic?option=3&semestre=<%=s[i][1]%>','','width=1000,height=800,scrollbars=no,resizable=no,status=no, location=no, menubar=no,directories=no');" ><%=s[i][1]%></a></span></div></th>    
  </tr>
	<%}
}%>
</table>

<p>&nbsp;</p>
<p>&nbsp;</p>

<table width="208" border="0" align="center">
<tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><%=labels.getElement("00148")%> <%=s[s.length-1][1]%></span></div></th>    
  </tr>
  <tr>
  <td>&nbsp;</td>
  </tr>
<%for(int j = 0; j<meses.getSize();j++)
{%>
  <tr>
    <th width="202" scope="row" align="right" bgcolor="#999999"><div align="center"><span class="style5"><a href="#" onClick="window.open('/siu/siu.statistics.servlet.Siu_Stat_ServletSetGraphic?option=4&mes=<%=meses.getElement(j)%>','','width=1000,height=800,scrollbars=yes,resizable=no,status=no, location=no, menubar=no,directories=no');"><%=labels.getElement(meses.getElement(j))%></a></span></div></th>    
  </tr>
<%}%>
</table>

  

  
</p>
</form>
</body>
</html>
