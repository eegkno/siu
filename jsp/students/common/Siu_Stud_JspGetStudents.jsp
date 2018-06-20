<%@page
import="java.lang.*"
import="java.util.*"
import="java.io.*"
import="java.text.*"
import="javax.servlet.http.*"
import="javax.servlet.*"
import="javax.servlet.*"
import="siu.administration.common.utility.Siu_ContainerLabel"
import="siu.administration.common.utility.Siu_Container"
%>


<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="history" class="siu.administration.common.utility.Siu_Container" scope="session" />


<%!
   HttpSession session =null;
   String Id = "";
   String tHist[][];
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   tHist =  (String[][])history.getElement(0);
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
.style4 {font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 16px; }

-->
      </style>
</head>

<body link="0000FF" vlink="0000FF" alink="0000FF">

<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
		  <div align="center"><p class="style2"><%=labels.getElement("00029")%></p>
		    <p class="style2">&nbsp;</p>
		  </div>

<table border="1" align="center" bordercolor="#000000" bordercolorlight="#000000" cellspacing="0" cellpadding="0" >
<tr>
<td bgcolor="#CCCCCC"><pre>

              <%=tHist[0][0]%>

</pre></td>
</table>






</body>
</html>
