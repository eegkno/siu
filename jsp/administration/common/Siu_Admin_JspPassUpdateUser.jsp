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

<jsp:useBean id="parameters" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="user" class="siu.administration.beans.user.Siu_Admin_User" scope="session" />
<jsp:useBean id="usr" class="siu.administration.common.utility.Siu_Container" scope="session" />



<%!
   HttpSession session =null;
   String Id = "";
//   Siu_ContainerLabel parameters;
//   Siu_ContainerLabel labels;
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
//   parameters = (Siu_ContainerLabel)session.getValue("parameters");
//   labels = (Siu_ContainerLabel)session.getValue("labels");
%>



<html>
<head>
	<title><%=labels.getElement("00001")%></title>

		<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">	

</head>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletChangePassUser" >

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3" align="center"><%=labels.getElement("00006")%>  <%=labels.getElement("00014")%></p>
  </div>
  <br>
  <br>
  <br>


   <table width="392"  border="0" align="center"  bordercolor="#000000" >
		    <tr >
			<td width="386"  align="center" class="drop_eventos"><%=labels.getElement("00041")%> </td>
			</tr>
  </table>



   <p>&nbsp;</p>
   <p>&nbsp;</p>
</form>
</body>
</html>
