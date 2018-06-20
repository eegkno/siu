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


<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />


<%!
   HttpSession session =null;
   String Id = "";
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
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
        return ((key >= 97 && key <= 122));
}
var nav4 = window.Event ? true : false;
function acceptNumLet(evt)
{
        var key = nav4 ? evt.which : evt.keyCode;
        return ((key >= 48 && key <= 57) || (key >= 97 && key <= 122)  );
}

function Valida(form)
{

        if(form.login.value=="")
        {
                alert('<%=labels.getElement("00049")%>');
                form.login.focus();
                return;
        }
       
        form.submit();
}
</script>

<body link="0000FF" vlink="0000FF" alink="0000FF">



<form  name="forma" method="get" action="/siu/siu.students.servlet.Siu_Stud_ServletGetStudents"  >
<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
		  <div align="center"><p class="style2"><%=labels.getElement("00029")%></p>
		  </div>          
          <p>&nbsp;</p>
<p align="center">&nbsp; </p>
<table width="244" border="0" align="center">
  <tr>
    <th width="200" scope="row" bgcolor="#999999"> <span class="style4"><%=labels.getElement("00002")%> : </span></th>
    <td width="200" ><input type="text" name="login"  onKeyPress="return acceptNumLet(event)" >
 </td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="200" border="0" align="center">
  <tr>
    <td align="center"><input type="button" name="Button" value="<%=labels.getElement("00010")%>" onClick="Valida(this.form)"></td>
    <td align="center"><input type="reset" name="reset" value="<%=labels.getElement("00009")%>"></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>

</form>



</body>
</html>
