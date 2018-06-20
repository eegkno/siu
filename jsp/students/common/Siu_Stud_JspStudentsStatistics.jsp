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
<jsp:useBean id="profession" class="siu.administration.common.utility.Siu_Container" scope="session" />
<jsp:useBean id="semestre" class="siu.administration.common.utility.Siu_Container" scope="session" />


<%!
   HttpSession session =null;
   String Id = "";
   String tProf[][]=null;
   String tSem[][]=null;
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   tProf = (String[][])profession.getElement(0);
   tSem = (String[][])semestre.getElement(0);
%>

<html>
<head>
<title><%=labels.getElement("00033")%> </title>
<style type="text/css">
<!--
.style4 {
	font-size: 24px;
	color: #000099;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style5 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0000FF;
	font-size: 18px;
}
.style1 {font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 16px; }
</style>
<script language="javascript">
function Val(form)
{
		var cuentaChecked=0;
		for(var i=0;i<form.elements.length;i++) 
		{
				if(form.elements[i].checked) 
				{
				    //alert(cuentaChecked);
					cuentaChecked+=1;
				}
		}
		//alert(cuentaChecked);
		if(cuentaChecked == 0) 
		{
			alert('<%=labels.getElement("00100")%>');
		return false;
		}
		else
			form.submit();		
}

</script>
</head>

<script languaje="JavaScript" src="/siu/js/validaciones.js">
</script>

<body background="/fondo.jpg" link="0000FF" vlink="0000FF" alink="0000FF">

<form name="forma" method="post" id="forma" action="/siu/siu.students.servlet.Siu_Stud_ServletGetStatistics" >

<div align="center" class="style4">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
		  <div align="center"><p class="style5"><%=labels.getElement("00030")%></p>
		  </div>          
          <p>&nbsp;</p>
<p align="center">&nbsp; </p>

<table  border="0" bgcolor=""align="center">
<tr>
<td width="30%" bgcolor="#999999"> <div align="center"><input name=check_semestre type="checkbox" value=T> <span class="style1"><%=labels.getElement("00071")%></span></div></td>
<td width="36%" bgcolor="#999999"> <div align="center"><input name="check_fechaini" type="checkbox" value=T><span class="style1"><%=labels.getElement("00072")%></span></div></td>
<td width="34%" bgcolor="#999999"> <div align="center"><input name="check_fechafin" type="checkbox" value=T><span class="style1"><%=labels.getElement("00073")%></span></div></td>
</tr>
<tr>
<td><div align="center"><select name="menu_semestre" >
<%
  for (int i = 0; i < tSem.length; i++)
  {
%>
		<option><%=tSem[i][1]%></option>

<%}%>

</select></div></td>
<td><div align="center"><div align="center" id="popCal" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px">
<font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><iframe name="popFrame" src="/siu/images/calscript.htm" frameborder="0" scrolling="no" width=183 height=200></iframe></font>
</div>
<SCRIPT event=onclick() for=document>
popCal.style.visibility = "hidden";
</SCRIPT>
<input onClick="popFrame.fPopCalendar(txtFech,txtFech,popCal);return false;" type="image" src="/siu/images/closed.gif" value="V"  name="I1" width="18" height="15">
<input type="text" name="txtFech" size="13" aling="center" readonly style="font-family: Arial; font-size: 15px">
</div></td>

<td><div align="center">
<div align="center" id="popCal2" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px">
<font color="#333333" size="2" face="Arial, Helvetica, sans-serif">
<iframe name="popFrame2" src="/siu/images/calscript.htm" frameborder="0" scrolling="no" width=183 height=200></iframe>
</font>
</div>
<SCRIPT event=onclick() for=document>
popCal2.style.visibility = "hidden";
</SCRIPT>
<input onClick="popFrame2.fPopCalendar(txtFech2,txtFech2,popCal2);return false;" 
type="image" src="/siu/images/closed.gif" value="V" 
 name="I1" width="18" height="15">
<input type="text" name="txtFech2" size="13" aling="center" readonly style="font-family: Arial; font-size: 15px">
</div></td>
</tr>
		<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		</tr>
<tr>
<td width="30%" bgcolor="#999999"> <div align="center"><input name=check_carrera type="checkbox" value=T><span class="style1"><%=labels.getElement("00074")%></span></div></td>
<td width="36%" bgcolor="#999999"> <div align="center"><input name="check_horaini" type="checkbox" value=T><span class="style1"><%=labels.getElement("00075")%></span></div></td>
<td width="34%" bgcolor="#999999"> <div align="center"><input name="check_horafin" type="checkbox" value=T><span class="style1"><%=labels.getElement("00076")%></span></div></td>
</tr>
<tr>
  <td align="center"><select name="menu_carrera">
<%
  for (int i = 0; i < tProf.length; i++)
  {
%>
		<option><%=tProf[i][0]%></option>

<%}%>
</select></td>
  <td align="center">
  <select name="menu_horaini">
  <option selected>7:00:00</option>
<option>8:00:00</option>
<option>9:00:00</option>
<option>10:00:00</option>
<option>11:00:00</option>
<option>12:00:00</option>
<option>13:00:00</option>
<option>14:00:00</option>
<option>15:00:00</option>
<option>16:00:00</option>
<option>17:00:00</option>
<option>18:00:00</option>
<option>19:00:00</option>
<option>20:00:00</option>
<option>21:00:00</option>
<option>22:00:00</option>
  </select></td>
  <td align="center">
  <select name="menu_horafin">
  <option selected>7:00:00</option>
<option>8:00:00</option>
<option>9:00:00</option>
<option>10:00:00</option>
<option>11:00:00</option>
<option>12:00:00</option>
<option>13:00:00</option>
<option>14:00:00</option>
<option>15:00:00</option>
<option>16:00:00</option>
<option>17:00:00</option>
<option>18:00:00</option>
<option>19:00:00</option>
<option>20:00:00</option>
<option>21:00:00</option>
<option>22:00:00</option>
  </select></td>
</tr>

</table>

<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="25%" border="0" align="center">
<tr>
<td align="center"><input type="button" name="QuitSend" value=<%=labels.getElement("00010")%>  onClick="Val(this.form)"></td>
<td align="center"><input type="reset" name="Borrar" value=<%=labels.getElement("00009")%>></td>
</tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>
</body></html>

