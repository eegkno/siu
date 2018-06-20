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
<title> <%=labels.getElement("00001")%> </title>  
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	color: #000099;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}

-->
</style>
</head>
     <body class="body style1">
        
        <div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="200" border="0">
            <tr>
              <td><img src="/siu/images/logo_d_comp.jpg" width="211" height="150"></td>
            </tr>
          </table>
          <p>&nbsp;
        
              </p>
        </div>
    </body>
</html>
