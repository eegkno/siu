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
<jsp:useBean id="newUser" class="siu.administration.common.utility.Siu_Container" scope="session" />



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
<form name="forma" method="post" id="forma" action="" >


   <p class="eventos3" align="center"><%=labels.getElement("00006")%>  <%=labels.getElement("00014")%></strong></p>
  
   <p>&nbsp;</p>
   <p><br>
    

   </p>
   <table width="392"  border="0" align="center"  bordercolor="#000000" >
		    <tr >
			<td width="386"  align="center" class="drop_eventos"> 	<%=labels.getElement("00024")%>
              </td>
			</tr>
  </table>

          
          <p align="center">&nbsp;</p>
          <table  border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
            <tr bgcolor="#e3eff6">
              <td><table  border="0" align="center" >
                <tr bgcolor="#e3eff6" >
                  <th width="85" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00018")%> : </div></th>
                  <td width="283"><div align="left" class="eventosbold"><%=newUser.getElement(0)+"  "+newUser.getElement(1)+"  "+newUser.getElement(2)%> </div></td>
                </tr>
                <tr bgcolor="#e3eff6">
                  <th width="85" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00021")%>:</div></th>
                  <td ><div align="left" class="eventosbold"><%=newUser.getElement(3)%> </div></td>
                </tr>
                <tr bgcolor="#e3eff6">
                  <th width="85" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00002")%>:</div></th>
                  <td><div align="left" class="eventosbold"><%=newUser.getElement(4)%> </div></td>
                </tr>
                <tr bgcolor="#e3eff6">
                  <th width="85" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00003")%>:</div></th>
                  <td><div align="left" class="eventosbold"><%=newUser.getElement(4)%> </div></td>
                </tr bgcolor="#e3eff6">
              </table></td>
            </tr>
          </table>
          <p class="eventos3" align="center">&nbsp;</p>
          <p>&nbsp;</p>
</form>
</body>
</html>
