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

<%!
   HttpSession session =null;
   String Id = "";
   Siu_ContainerLabel parameters;
   Siu_ContainerLabel labels;
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   parameters = (Siu_ContainerLabel)session.getValue("parameters");
   labels = (Siu_ContainerLabel)session.getValue("labels");
%>

<html>
<head>
      <title> <%=labels.getElement("00001")%> </title>
</head>

<body link="0000FF" vlink="0000FF" alink="0000FF">

<form name="forma" method="post" id="forma" action="" >

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h1 align="center">
    <font size="5" face="Verdana,Arial, Helvetica, sans-serif">
          <%=labels.getElement("00001")%>
    </font>
</h1>

<p>&nbsp;</p>

<table width="39%" border="0"  align="center" cellpadding="4" cellspacing="0">

  <tr bgcolor="#EEEEEE">
    <td align="right" ><font color="#000000">&nbsp;</font>
    <td><font color="#000000">&nbsp;</font></td>
  </tr>
  
  <tr bgcolor="#EEEEEE">
    <td width="33%" align="right" ><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=labels.getElement("00002")%></strong>
      </font>
    <td width="67%"><font color="#000000">
      <input type="text" name="login">
      </font></td>
  </tr>

  <tr bgcolor="#EEEEEE">
    <td align="right"><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=labels.getElement("00003")%></strong></font></td>
    <td><font color="#000000">
      <input type="password" name="pass">
      </font></td>
  </tr>

  <tr bgcolor="#EEEEEE">
    <td align="right"><font color="#000000">&nbsp;</font></td>
    <td><font color="#000000">&nbsp;</font></td>

  </tr>

</table>

<p>&nbsp;</p>

<table width="20%" height="36" border="0" align="center">

<tr>
    <td width="50%" align="center"><input type="submit" name="Enviar" value= <%=labels.getElement("00010")%> ></td>
    <td width="50%" align="center"><input type="reset" name="Borrar" value= <%=labels.getElement("00009")%> ></td>
</tr>

</table>

</body>

