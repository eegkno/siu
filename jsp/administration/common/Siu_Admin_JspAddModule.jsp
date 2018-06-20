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
        return ((key >= 48 && key <= 57) || (key >= 97 && key <= 122) ||(key >= 65 && key <= 90) || key == 32  );
}

var nav5 = window.Event ? true : false;
function acceptLet(evt)
{
        var key = nav5 ? evt.which : evt.keyCode;
        return ((key >= 97 && key <= 122));
}

var nav6 = window.Event ? true : false;
function acceptNum(evt)
{
        var key = nav6 ? evt.which : evt.keyCode;
        return ((key >= 48 && key <= 57));
}


function Valida(form)
{

        if(form.mod_name.value=="")
        {
                alert('<%=labels.getElement("00050")%>');
                form.mod_name.focus();
                return;
        }
        if(form.mod_link.value=="")
        {
                alert('<%=labels.getElement("00051")%>');
                form.mod_link.focus();
                return;
        }
        /*if(form.mod_linkadm.value=="")
        {
                alert('<%=labels.getElement("00052")%>');
                form.mod_linkadm.focus();
                return;
        }*/
		if(form.label_id.value=="")
        {
                alert('<%=labels.getElement("00053")%>');
                form.label_id.focus();
                return;
        }

        form.submit();
}
</script>

<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletInsertModule" >

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3" align="center"><%=labels.getElement("00008")%>  <%=labels.getElement("00014")%></p>
    <p class="eventos3" align="center">&nbsp;</p>
  </div>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td><table width="346" border="0" align="center">
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00018")%> : </div></th>
          <td><input type="text" name="mod_name" onKeyPress="return acceptNumLet(event)" class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00044")%> : </div></th>
          <td><input type="text" name="mod_link"  class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00048")%> : </div></th>
          <td><input type="text" name="mod_linkadm" class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" cope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00045")%> : </div></th>
          <td><input type="text" name="label_id" onKeyPress="return acceptNum(event)" class="whiteBox"></td>
        </tr>
        <tr bgcolor="#e3eff6">
          <th width="90" scope="row" class="eventosbold" ><div align="left"><%=labels.getElement("00021")%> : </div></th>
          <td><select name="mod_status" class="whiteBox">
              <option><%=labels.getElement("00022")%></option>
              <option><%=labels.getElement("00023")%></option>
          </select></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <br>
  <br>
  <br>
  <jsp:setProperty name="user" property="*"  />
</jsp:useBean>


  <table width="200" border="0" align="center">
    <tr>
      <th scope="col"><input type="button" name="enviar" value=<%=labels.getElement("00010")%> onClick="Valida(this.form)"></th>
      <th scope="col"><input type="reset" name="borrar" value=<%=labels.getElement("00009")%>></th>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
