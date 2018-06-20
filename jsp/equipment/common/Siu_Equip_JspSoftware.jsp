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
<jsp:useBean id="sw" class="siu.administration.common.utility.Siu_Container" scope="session" />

<%!
   HttpSession session =null;
   String Id = "";

%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");

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

<body link="0000FF" vlink="0000FF" alink="0000FF" >
<h1 align="center">
<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
          <p class="style2"><%=labels.getElement("00032")%></p>
          <p>&nbsp;</p>
           

</h1>
<%
if(sw.getSize() >=1)
{
  for (int i = 0; i < sw.getSize(); i++)
  {
%>
<table border="0" align="center"  >
<tr bordercolordark="#000000" >
      <%
        if((i%2)==0)
        {%>
      <td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=sw.getElement(i)%></pre></td>
        <%}
        else
        {%>
        <td width="228" height="15" bgcolor="#cccccc" align="center" ><pre class="style4 style6"><%=sw.getElement(i)%></pre></td>
        <%}%>
</tr>
</table>
<%
  }//end for
  }//end if
  else
  {%>
  		<p class="eventos3" align="center"><%=labels.getElement("00092")%></p>  
  <%}
%>




</body>
</html>
