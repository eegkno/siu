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
<jsp:useBean id="usr" class="siu.administration.common.utility.Siu_Container" scope="session" />



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
<script language="JavaScript">

var nav4 = window.Event ? true : false;

function acceptNumLet(evt)
{
        var key = nav4 ? evt.which : evt.keyCode;
        return ((key >= 48 && key <= 57) || (key >= 97 && key <= 122));
}

function Valida(form)
{
        if(form.pass.value=="")
        {
                alert("<%=labels.getElement("00039")%>");
                form.pass.focus();
                return;
        }
        if(form.confpass.value=="")
        {
                alert("<%=labels.getElement("00038")%>");
                form.confpass.focus();
                return;
        }

        if (form.pass.value != form.confpass.value)
        {
                alert("<%=labels.getElement("00040")%>");
                form.reset();
                form.pass.focus();
                return;
        }
        form.submit();
}
</script>

</head>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletChangePassUser" >

  <div align="center">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="eventos3" align="center"><%=labels.getElement("00006")%>  <%=labels.getElement("00014")%></p>
  </div>
  <br>
  <br>


   <table width="392"  border="0" align="center"  bordercolor="#000000" >
		    <tr >
			<td width="386"  align="center" class="drop_eventos"><%=labels.getElement("00012")%> </td>
			</tr>
  </table>
  
   <p>&nbsp;</p>
   <table width="386" border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
     <tr bgcolor="#e3eff6">
       <td><table  border="0" align="center">
         <tr bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00018")%> : </div></th>
           <td width="300"><div align="left" class="eventosbold"><%=usr.getElement(0)+"  "+usr.getElement(1)+"  "+usr.getElement(2)%> </div></td>
         </tr>
         <tr bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00003")%> :</div></th>
           <td><div align="left">
               <input type="password" name="pass" onKeyPress="return acceptNumLet(event)" class="whiteBox">
           </div></td>
         </tr>
         <tr bgcolor="#e3eff6">
           <th width="100" scope="row" class="eventosbold"><div align="left"><%=labels.getElement("00038")%> :</div></th>
           <td><div align="left">
               <input type="password" name="confpass"  onKeyPress="return acceptNumLet(event)" class="whiteBox">
           </div></td>
         </tr>
       </table></td>
     </tr>
   </table>
  <p align="center">&nbsp; </p>
  <p>&nbsp;</p>
  <table width="100" border="0" align="center">
    <tr>
      <th scope="col"><input type="button" name="enviar" value=<%=labels.getElement("00010")%>  onClick="Valida(this.form)"></th>
      <th scope="col"><input type="reset" name="borrar" value=<%=labels.getElement("00009")%>></th>
    </tr>
  </table>
</form>
</body>
</html>
