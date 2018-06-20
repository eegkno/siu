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
   String option="";

%>
<%

   session = request.getSession(false);

     option = (String)session.getValue("option");
%>



<html>
<head>
	<title><%=labels.getElement("00001")%></title>
		<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">	
</head>
<script language="JavaScript" >
var nav5 = window.Event ? true : false;
function acceptLet(evt)
{
        var key = nav5 ? evt.which : evt.keyCode;
        return ((key >= 97 && key <= 122));
}

function Valida(form)
{

        if(form.user_login.value=="")
        {
                alert('<%=labels.getElement("00049")%>');
                form.user_login.focus();
                return;
        }
       
        form.submit();
}
</script>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletResponseConsultUser" >

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3"><%=labels.getElement("00006")%>  <%=labels.getElement("00014")%></p>
  </div>
  <p>&nbsp;</p>
  <p><br>
  </p>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td><table width="346" border="0" align="center" >
        <tr bgcolor="#e3eff6" >
          <th width="90" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00002")%> : </div></th>
          <td><input type="text" name="user_login" onKeyPress="return acceptLet(event)"  class="whiteBox"></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <br>
  <br>
  <p>&nbsp;</p>
  <table width="200" border="0" align="center">
    <tr>
      <th scope="col"><input type="button" name="enviar" value=<%=labels.getElement("00010")%> onClick="Valida(this.form)"></th>
      <th scope="col"><input type="reset" name="borrar" value=<%=labels.getElement("00009")%>></th>
    </tr>
  </table>
  <!--
  <%=option%>
-->
  <p>&nbsp;</p>
</form>
</body>
</html>
