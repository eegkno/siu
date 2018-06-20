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
<jsp:useBean id="mod" class="siu.administration.common.utility.Siu_Container" scope="session" />




<%!
   HttpSession session =null;
   String Id = "";
   String option="";
   String m[][]=null;
%>
<%

   session = request.getSession(false);

     option = (String)session.getValue("option");
     m=(String[][])mod.getElement(0);
%>



<html>
<head>
	<title><%=labels.getElement("00001")%></title>
				<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletUpdateModule" >

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3"><%=labels.getElement("00008")%>  <%=labels.getElement("00014")%></p>
    <p>&nbsp;</p>
  </div>
  <br>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td>
	  
<table border="0" align="center" >
<%
  for (int i = 0; i < m.length; i++)
  {

    	if((i%2)==0)
        {%>
              <tr bgcolor="#e3eff6">                 
                <td  width="200" align="center"  class="eventosbold" ><a href="<%=m[i][1]%>"><%=labels.getElement(m[i][0])%></a></td>
              </tr>

        <%
        }
        else
        {
        %>
              <tr bgcolor="#e3eff6">                  
                  <td  width="200" align="center" class="eventosbold" ><a href="<%=m[i][1]%>"><%=labels.getElement(m[i][0])%></a></td>
              </tr>

        <%}
}
    	
%>
</table>	  
	  
	  </td>
    </tr>
  </table>
  <br>
  <br>

<p>&nbsp;</p>
</form>
</body>
</html>
