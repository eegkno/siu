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
</head><script language="JavaScript" >


	function reloadLanguage(lang)
	{
	    
		document.forma.action = "/siu/siu.administration.servlet.Siu_Admin_ServletIndex?lang=" + lang;
		document.forma.submit();
	}
	
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
        return ((key >= 97 && key <= 122));
}


function Valida(form)
{

        if(form.login.value=="")
        {
                alert('<%=labels.getElement("00049")%>');
                forms.login.focus();
                return;
        }
        if(form.pass.value=="")
        {
                alert('<%=labels.getElement("00039")%>');
                form.pass.focus();
                return;
        }


        form.submit();
}
</script>

<body link="0000FF" vlink="0000FF" alink="0000FF">

<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletValidation">

<p>&nbsp;</p>
<p>&nbsp;</p>
<h1 align="center">
    <font size="5" face="Verdana,Arial, Helvetica, sans-serif">
          <%=labels.getElement("00001")%>
    </font>
</h1>

<p>&nbsp;</p>

<table width="39%" border="0"  align="center" cellpadding="4" cellspacing="0">

  <tr bgcolor="#EEEEEE">
    <td align="right" ><font color="#000000">&nbsp;</font>
    <td><font color="#000000">&nbsp;</font></td>
  </tr>
  
  <tr bgcolor="#EEEEEE">
    <td width="33%" align="right" ><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=labels.getElement("00002")%></strong>
      </font>
    <td width="67%"><font color="#000000">
      <input type="text" name="login" onKeyPress="return acceptLet(event)" >
      </font></td>
  </tr>

  <tr bgcolor="#EEEEEE">
    <td align="right"><font color="#000000" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=labels.getElement("00003")%></strong></font></td>
    <td><font color="#000000">
      <input type="password" name="pass" onKeyPress="return acceptNumLet(event)">
      </font></td>
  </tr>

  <tr bgcolor="#EEEEEE">
    <td align="right"><font color="#000000">&nbsp;</font></td>
    <td><font color="#000000">&nbsp;</font></td>

  </tr>

</table>

<p>&nbsp;</p>
<table width="154" border="0" align="center">
  <tr>
    <td width="72" align="center"><img src="/siu/images/mexico.jpg" width="50" height="30" align="bottom" onClick="reloadLanguage('ESP')"></td>
    <td width="66" align="center"><img src="/siu/images/eeuu.gif" width="50" height="30" align="bottom" onClick="reloadLanguage('ING')"></td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="20%" height="36" border="0" align="center">

<tr>
    <td width="50%" align="center"><input type="button" name="Enviar" value= <%=labels.getElement("00010")%> onClick="Valida(this.form)"></td>
    <td width="50%" align="center"><input type="reset" name="Borrar" value= <%=labels.getElement("00009")%> ></td>
</tr>

</table>

</body>

