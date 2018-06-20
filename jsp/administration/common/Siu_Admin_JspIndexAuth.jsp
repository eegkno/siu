<%@page
import="java.lang.*"
import="java.util.*"
import="java.io.*"
import="java.text.*"
import="javax.servlet.http.*"
import="javax.servlet.*"
import="javax.servlet.*"
import="siu.administration.common.utility.Siu_Container"
import="siu.administration.common.utility.Siu_ContainerLabel"
%>

<jsp:useBean id="ruser" class="siu.administration.common.utility.Siu_Container" scope="session" />
<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />

<%!
   HttpSession session =null;
   String Id = "";
   String tabla[][];
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   tabla =   (String[][])ruser.getElement(7);
%>


<html>

<head>
<title>Menú</title>
<link rel="stylesheet" type="text/css" href="/siu/css/03css001.css">
</head>


<body background="/siu/images/chromeleft.jpg">
<p>&nbsp;</p>
<p align="center"> <font color="#000000" size="5" face="Georgia, Times New Roman, Times, serif"></font></p>



<table width="141" border="0">
  <tr>
    <td width="140">&nbsp;</td>
  </tr>
<%
  for (int i = 0; i < tabla.length; i++)
  {
  %>
  <tr>
    <td rowspan="-9"><a href="<%=tabla[i][1]%>" target="central" class="menu1">  <%=labels.getElement(tabla[i][0])%></a></td>
  </tr>
    <tr>
    <td width="140">&nbsp;</td>
  </tr>
  <p>&nbsp;</p>
  <%
  }
  %>


</table>
<p>&nbsp;</p>
</body>

</html>
