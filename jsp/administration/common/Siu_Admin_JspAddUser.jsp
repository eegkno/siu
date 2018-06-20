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
	<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" >
var nav4 = window.Event ? true : false;

function acceptNumLet(evt)
{
        var key = nav4 ? evt.which : evt.keyCode;
        return ((key >= 48 && key <= 57) || (key >= 97 && key <= 122));
}

var nav5 = window.Event ? true : false;
function acceptLet(evt)
{
        var key = nav5 ? evt.which : evt.keyCode;
        return (key == 32 || (key >= 97 && key <= 122));
}

var nav6 = window.Event ? true : false;
function acceptNum(evt)
{
        var key = nav6 ? evt.which : evt.keyCode;
        return ((key >= 48 && key <= 57));
}


function Valida(form)
{

        if(form.user_name.value=="")
        {
                alert('<%=labels.getElement("00054")%>');
                form.user_name.focus();
                return;
        }
        if(form.user_firstName.value=="")
        {
                alert('<%=labels.getElement("00055")%>');
                form.user_firstName.focus();
                return;
        }
        if(form.user_lastName.value=="")
        {
                alert('<%=labels.getElement("00056")%>');
                form.user_lastName.focus();
                return;
        }


        form.submit();
}
</script>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletInsertUser" >

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3"><%=labels.getElement("00006")%>  <%=labels.getElement("00014")%></p>
    <p class="eventos3">&nbsp;</p>
  </div>
  <br>
  <table  border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td><table width="346" border="0" align="center">
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row"  class="eventosbold" ><div align="left"><%=labels.getElement("00018")%>(s) </div></th>
          <td><input type="text" name="user_name" onKeyPress="return acceptLet(event)" class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00019")%></div></th>
          <td><input type="text" name="user_firstName" onKeyPress="return acceptLet(event)" class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" cope="row" class="eventosbold"><div align="left"><%=labels.getElement("00020")%></div></th>
          <td><input type="text" name="user_lastName" onKeyPress="return acceptLet(event)" class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00021")%></div></th>
          <td><select name="user_status" class="whiteBox">
              <option><%=labels.getElement("00022")%></option>
              <option><%=labels.getElement("00023")%></option>
          </select></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <br>
  <br>
  <p>&nbsp;</p>
  <jsp:setProperty name="user" property="*"  />
</jsp:useBean>


  <table width="200" border="0" align="center">
    <tr >
      <th scope="col"><input type="button" name="enviar" value=<%=labels.getElement("00010")%> onClick="Valida(this.form)"></th>
      <th scope="col"><input type="reset" name="borrar" value=<%=labels.getElement("00009")%>></th>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
