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
</head>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="" >

  <div align="center">
    <p>&nbsp;</p>
    <p><strong><%=labels.getElement("00008")%>  <%=labels.getElement("00014")%></strong></p>
  </div>
  <br>
  <br>
  <br>


<jsp:setProperty name="user" property="*"  />
</jsp:useBean>



  
<h1 align="center">
    <font size="5" face="Verdana,Arial, Helvetica, sans-serif">
          <%=labels.getElement("00046")%>
    </font>
</h1>

  <p>&nbsp;</p>
</form>
</body>
</html>
