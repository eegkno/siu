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
   String error="";
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   error = request.getParameter("error");
%>


<html>
<head>
      <title> !!! <%=labels.getElement(error)%>!!!</title>
	  	<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">
</head>

<body link="0000FF" vlink="0000FF" alink="0000FF">

<form name="forma" method="post" id="forma" action="">

<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="center"><p class="eventos3">
               !!! <%=labels.getElement(error)%>!!!
</p>
</div>    


<p>&nbsp;</p>


<p>&nbsp;</p>


</body>

