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
      <title> <%=labels.getElement("00014")%> </title>
</head>




      <frameset cols="200,*" frameborder="NO" border="0" framespacing="0" >

        <frame name="frameizq" scrolling= "no" noresize src="/siu/siu.administration.servlet.Siu_Admin_ServletMainAuth">


        <frame name="central" src="/siu/siu.administration.servlet.Siu_Admin_ServletPresentation">


      </frameset>



</html>


