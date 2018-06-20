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
<jsp:useBean id="newModule" class="siu.administration.common.utility.Siu_Container" scope="session" />



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

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3"><%=labels.getElement("00008")%>  <%=labels.getElement("00014")%></p>
  </div>
  <br>
   <table width="421"  border="0" align="center"  bordercolor="#000000" >
		    <tr >
			<td width="397"  align="center" class="drop_eventos"><%=labels.getElement("00152")%> </td>
			</tr>
  </table>




   <p>&nbsp;</p>
   <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
     <tr bgcolor="#e3eff6">
       <td><table  border="0" align="center">
         <tr  bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00018")%> : </div></th>
           <td width="300"><div align="left" class="eventosbold" ><%=newModule.getElement(0)%> </div></td>
         </tr>
         <tr  bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00044")%> : </div></th>
           <td ><div align="left" class="eventosbold" ><%=newModule.getElement(1)%> </div></td>
         </tr>
         <tr  bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00048")%> : </div></th>
           <td ><div align="left" class="eventosbold" ><%=newModule.getElement(4)%> </div></td>
         </tr>
         <tr  bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00045")%> : </div></th>
           <td><div align="left" class="eventosbold" ><%=newModule.getElement(2)%> </div></td>
         </tr>
         <tr  bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00021")%> : </div></th>
           <td><div align="left" class="eventosbold" ><%=newModule.getElement(3)%> </div></td>
         </tr>
       </table></td>
     </tr>
   </table>
   <p>&nbsp;</p>
   <p>&nbsp;</p>
</form>
</body>
</html>
