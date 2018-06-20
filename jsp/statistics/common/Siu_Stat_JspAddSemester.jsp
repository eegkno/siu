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
<jsp:useBean id="sw" class="siu.administration.common.utility.Siu_Container" scope="session" />

<%!
   HttpSession session =null;
   String Id = "";
   String t[][]=null;
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   if(sw.getSize()>=1)
   {
   		t = (String[][])sw.getElement(0);
	}

%>


<html>
<head>
<title><%=labels.getElement("00033")%></title>
				<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">
<script language="javascript">
var nav6 = window.Event ? true : false;
function acceptNum(evt)
{
        var key = nav6 ? evt.which : evt.keyCode;
        return ((key == 58)||  (key == 45) ||(key >= 48 && key <= 57));
}

var nav5 = window.Event ? true : false;
function acceptLet(evt)
{
        var key = nav5 ? evt.which : evt.keyCode;
        return (key == 32 || (key >= 97 && key <= 122));
}

var nav4 = window.Event ? true : false;

function acceptNumLet(evt)
{
        var key = nav4 ? evt.which : evt.keyCode;
        return ((key >= 48 && key <= 57) || (key >= 97 && key <= 122) ||(key >= 65 && key <= 90) || key == 32  );
}

function Valida(form)
{
		if(form.agregar.value=="")
        {
                alert('<%=labels.getElement("00117")%>');
                form.agregar.focus();
                return;
        }
		if(form.txtFech.value=="")
        {
                alert('<%=labels.getElement("00133")%>');
                form.txtFech.focus();
                return;
        }
		if(form.txtFech2.value=="")
        {
                alert('<%=labels.getElement("00134")%>');
                form.txtFech2.focus();
                return;
        }				
		if(form.txtFech.value>=form.txtFech2.value)
        {
                alert('<%=labels.getElement("00153")%>');
                form.txtFech2.focus();
                return;
        }		
		form.submit();
}

function Valida2(form)
{
		if(form.materia.value=="")
        {
                alert('<%=labels.getElement("00135")%>');
                form.materia.focus();
                return;
        }
		if(form.profesor.value=="")
        {
                alert('<%=labels.getElement("00136")%>');
                form.profesor.focus();
                return;
        }
		if(form.horaIni.value=="")
        {
                alert('<%=labels.getElement("00137")%>');
                form.horaIni.focus();
				return;
        }
		else{
			//alert(IsValidTime(form.horaIni.value));
			if (!IsValidTime(form.horaIni.value))
			{
				//alert("probando validacion");
                form.horaIni.focus();
				return;
			}
		}
					
		if(form.horaFin.value=="")
        {
                alert('<%=labels.getElement("00138")%>');
                form.horaFin.focus();
                return;
        }
		else{
			if (!IsValidTime(form.horaFin.value))
			{
				//alert("probando validacion");
                form.horaFin.focus();
				return;
			}
		}		
		
		if(form.horaFin.value <= form.horaIni.value){
			alert('<%=labels.getElement("00157")%>');
			form.horaFin.focus();
			return;
		}
		
		
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
		if(cuentaChecked == 1) 
		{
			alert('<%=labels.getElement("00100")%>');
		//return false;
		}
		else
			form.submit();					
}		

function Valida3(form)
{
		if(form.materia.value=="")
        {
                alert('<%=labels.getElement("00135")%>');
                form.materia.focus();
                return;
        }
		if(form.profesor.value=="")
        {
                alert('<%=labels.getElement("00136")%>');
                form.profesor.focus();
                return;
        }
		if(form.txtFech3.value=="")
        {
                alert('<%=labels.getElement("00133")%>');
                form.txtFech3.focus();
                return;
        }
		
		if(form.horaIni.value=="")
        {
                alert('<%=labels.getElement("00137")%>');
                form.horaIni.focus();
				return;
        }
		else{
			//alert(IsValidTime(form.horaIni.value));
			if (!IsValidTime(form.horaIni.value))
			{
				//alert("probando validacion");
                form.horaIni.focus();
				return;
			}
		}
					
		if(form.horaFin.value=="")
        {
                alert('<%=labels.getElement("00138")%>');
                form.horaFin.focus();
                return;
        }
		else{
			if (!IsValidTime(form.horaFin.value))
			{
				//alert("probando validacion");
                form.horaFin.focus();
				return;
			}
		}			
		
		if(form.horaFin.value <= form.horaIni.value)
		{
			alert('<%=labels.getElement("00157")%>');
			form.horaFin.focus();
			return;
		}
		
		
		form.submit();					
}
function Valida4(form)
{
		if(form.materia.value=="")
        {
                alert('<%=labels.getElement("00139")%>');
                form.materia.focus();
                return;
        }
		if(form.profesor.value=="")
        {
                alert('<%=labels.getElement("00136")%>');
                form.profesor.focus();
                return;
        }
		if(form.txtFech5.value=="")
        {
                alert('<%=labels.getElement("00133")%>');
                form.txtFech5.focus();
                return;
        }
		if(form.txtFech4.value=="")
        {
                alert('<%=labels.getElement("00134")%>');
                form.txtFech4.focus();
                return;
        }		
		if(form.horaIni.value=="")
        {
                alert('<%=labels.getElement("00137")%>');
                form.horaIni.focus();
				return;
        }
		else{
			//alert(IsValidTime(form.horaIni.value));
			if (!IsValidTime(form.horaIni.value))
			{
				//alert("probando validacion");
                form.horaIni.focus();
				return;
			}
		}
					
		if(form.horaFin.value=="")
        {
                alert('<%=labels.getElement("00138")%>');
                form.horaFin.focus();
                return;
        }
		else{
			if (!IsValidTime(form.horaFin.value))
			{
				//alert("probando validacion");
                form.horaFin.focus();
				return;
			}
		}			
		
		if(form.horaFin.value <= form.horaIni.value){
			alert('<%=labels.getElement("00157")%>');
			form.horaFin.focus();
			return;
		}
		
		if(form.txtFech5.value>=form.txtFech4.value)
        {
                alert('<%=labels.getElement("00153")%>');
                form.txtFech2.focus();
                return;
        }		
		
		form.submit();					
}
		
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
		if(cuentaChecked == 1) 
		{
			alert('<%=labels.getElement("00100")%>');
		//return false;
		}
		else
			form.submit();		
}


function mode(v) 
{
  var data;
  data=v;
    if (data == 0) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="hidden";
		document.all['cuatro'].style.visibility="hidden";
      }
    if (data == 1) 
      {
        document.all['uno'].style.visibility="visible";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="hidden";
		document.all['cuatro'].style.visibility="hidden";
		//document.all['radio2'].blur();

      }
    if (data == 2) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="visible";
		document.all['tres'].style.visibility="hidden";
		document.all['cuatro'].style.visibility="hidden";
		///document.all['radio1'].blur();

      }
	  if (data == 3) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="visible";
		document.all['cuatro'].style.visibility="hidden";
		//document.all['radio1'].blur();

      }
	  if (data == 4) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="hidden";
		document.all['tres'].style.visibility="hidden";
		document.all['cuatro'].style.visibility="visible";
		//document.all['radio1'].blur();

      }
}


function IsValidTime(timeStr) {

	var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;

	var matchArray = timeStr.match(timePat);
	if (matchArray == null) {
		alert('<%=labels.getElement("00158")%>');
		return false;
	}

	hour = matchArray[1];
	minute = matchArray[2];
	second = matchArray[4];
	ampm = matchArray[6];

	if (second=="") { second = null; }
	if (ampm=="") { ampm = null }

	if (hour < 0  || hour > 23) {
		alert("Hour must be between 1 and 12. (or 0 and 23 for military time)");	
		return false;
	}

	/*if (hour <= 12 && ampm == null) {
		if (confirm("Please indicate which time format you are using.  OK = Standard Time, CANCEL = Military Time")) {
		alert("You must specify AM or PM.");
		return false;
   		}
	}*/

	/*if  (hour > 12 && ampm != null) {
		alert("You can't specify AM or PM for military time.");
		return false;
	}*/

	if (minute<0 || minute > 59) {
		alert ('<%=labels.getElement("00155")%>');
		return false;
	}

	if (second != null && (second < 0 || second > 59)) {
		alert ('<%=labels.getElement("00156")%>');
		return false;
	}

	return true;
}

</script>
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
}
.style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 16px;
}
.style3 {
	color: #000000;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
}
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
.style9 {font-size: 14px}
.style12 {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
.style13 {color: #333333; font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-size: 14px; }
-->
</style>
</head>

<body onLoad="mode(0)">


<form name="add" action="/siu/siu.statistics.servlet.Siu_Stat_ServletUpdateSemester" method="post">
  <div align="center" class="style4">
          <p><em><%=labels.getElement("00033")%></em></p>
    <p>&nbsp;</p>
  </div>
<div align="center"><p class="eventos3"><%=labels.getElement("00118")%></p>
  <p class="style2">&nbsp;</p>
</div>
 
<table width="200" border="0"  align="center">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio" onClick="mode(1)" id="radio"></td>
    <td width="151"><span class="style3"><%=labels.getElement("00116")%>.</span></td>
  </tr>
</table>
    <label>

  </p>
  <p>&nbsp;</p>
  <div id="uno">
  <table width="401" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td width="393">
	  
<table width="390"  border="0" align="center">
    <tr bgcolor="#e3eff6">
      <th width="124" scope="row" align="right"  class="eventosbold" ><div align="left"><%=labels.getElement("00101")%> :</div></th>
      <td width="271"><input type="text" name="agregar" onKeyPress="return acceptNum(event)" class="whiteBox"></td>
    </tr>
	
    <tr bgcolor="#e3eff6">
      <th width="124" scope="row" align="right"  class="eventosbold"><div align="left"><%=labels.getElement("00072")%> :</div></th>
		<td><div align="left"><div align="center" id="popCal" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px">
		<font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><iframe name="popFrame" src="/siu/images/calscript2.htm" frameborder="0" scrolling="no" width=183 height=200></iframe></font>
		</div>
		<SCRIPT event=onclick() for=document>
		popCal.style.visibility = "hidden";
		</SCRIPT>
		<input onClick="popFrame.fPopCalendar(txtFech,txtFech,popCal);return false;" type="image" src="/siu/images/closed.gif" value="V"  name="I1" width="18" height="15">
		<input type="text" name="txtFech" size="13" aling="left" readonly style="font-family: Arial; font-size: 15px" class="whiteBox">
		</div>
		</td>
    </tr>	
	
    <tr bgcolor="#e3eff6">
      <th width="124" scope="row" align="right"  class="eventosbold"><div align="left"><%=labels.getElement("00073")%> :</div></th>
		<td><div align="left">
		<div align="left" id="popCal2" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px">
		<font color="#333333" size="2" face="Arial, Helvetica, sans-serif">
		<iframe name="popFrame2" src="/siu/images/calscript2.htm" frameborder="0" scrolling="no" width=183 height=200></iframe>
		</font>
		</div>
		<SCRIPT event=onclick() for=document>
		popCal2.style.visibility = "hidden";
		</SCRIPT>
		<input onClick="popFrame2.fPopCalendar(txtFech2,txtFech2,popCal2);return false;" 
		type="image" src="/siu/images/closed.gif" value="V" 
		 name="I1" width="18" height="15">
		<input type="text" name="txtFech2" size="13" aling="left" readonly style="font-family: Arial; font-size: 15px" class="whiteBox"> 
		</div>
		</td>
    </tr>		
  </table>	  
	  
	  </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
<p>&nbsp;</p>
  <table width="262" border="0" align="center" >
    <tr>
      <th width="129" height="45" scope="row"><div align="center">
        <input type="button" name="AddSend" value="<%=labels.getElement("00010")%>"  onClick="Valida(this.form)">
      </div></th>
      <td width="123"><div align="center">
        <input type="reset" name="Borrar" value="<%=labels.getElement("00009")%>" >
      </div></td>
    </tr>
  </table>
  </div>

</form>
<form name="quit" method="post" action="/siu/siu.statistics.servlet.Siu_Stat_ServletUpdateSemester">

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="200" border="0"  align="center">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio1" onClick="mode(2)" id="radio1"></td>
    <td width="151"><span class="style2"><%=labels.getElement("00128")%>.</span></td>
  </tr>
</table>

  </div>
  <div id="dos">
  <p>&nbsp;</p>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td >

<table border="0" align="center" >
	<tr bgcolor="#e3eff6">

          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00119")%> :</strong></td>
          <td  width="247" align="center"><div align="left">
            <input type="text" name="materia" onKeyPress="return acceptNumLet(event)" class="whiteBox">
          </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00120")%> :</td>
          <td  width="247" align="center" ><div align="left">
            <input type="text" name="profesor" onKeyPress="return acceptNumLet(event)" class="whiteBox">
          </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00075")%> :</td>
          <td  width="247" align="center" class="eventosbold"><div align="left">
            <input type="text" name="horaIni" onKeyPress="return acceptNum(event)" class="whiteBox">            
            <strong><em>hh:mm</em></strong></div></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00076")%> :</td>
          <td  width="247" align="center" class="eventosbold"><div align="left"><strong><em>
            <input type="text" name="horaFin" onKeyPress="return acceptNum(event)" class="whiteBox">
          hh:mm</em></strong></div></td>
	</tr>
</table>
<table width="368" border="0" align="center" >	
	<tr bgcolor="#e3eff6">
          <td width="362" align="left" class="eventosbold"><%=labels.getElement("00121")%> :</td>         
	</tr>	
</table>
<table width="366" border="0" align="center"  bordercolor=""#D2D0D1"">
	<tr bgcolor="#e3eff6">
          <td width="180" align="center" class="eventosbold"><input type="checkbox" name="checkbox" value="00122"> <%=labels.getElement("00122")%></td>
		  <td width="176" align="center" class="eventosbold" ><input name="checkbox4" type="checkbox" value="00125"><%=labels.getElement("00125")%></span></td>		           
	</tr>	
	<tr bgcolor="#e3eff6">
          <td width="180" align="center" class="eventosbold"><input type="checkbox" name="checkbox2" value="00123"> <%=labels.getElement("00123")%></td>
		  <td width="176" align="center" class="eventosbold"><input type="checkbox" name="checkbox5" value="00125"><%=labels.getElement("00126")%></td>		           
	</tr>	
	<tr bgcolor="#e3eff6">
          <td width="180" align="center" class="eventosbold"><input type="checkbox" name="checkbox3" value="00124"><%=labels.getElement("00124")%></td>
		  <td width="176" align="center" class="eventosbold"><input type="checkbox" name="checkbox6" value="00127"> <%=labels.getElement("00127")%></td>		           
	</tr>		
</table>
	  
	  </td>
    </tr>
  </table>
    


<p>&nbsp;</p>
  
  <table width="256" border="0" align="center">
    <tr>
      <td width="246" scope="row" align="left">
        <input type="button" name="QuitSend" value=<%=labels.getElement("00010")%> onClick="Valida2(this.form)">
      </td>
      <td width="48" align="left">
        <input type="reset" name="Borrar2" value=<%=labels.getElement("00009")%> >
     </td>
    </tr>
  </table>
</div> 
</form>
<form name="quit" method="post" action="/siu/siu.statistics.servlet.Siu_Stat_ServletUpdateSemester" >

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="200" border="0"  align="center">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio2" onClick="mode(3)" id="radio2"></td>
    <td width="151"><span class="style2"><%=labels.getElement("00130")%>.</span></td>
  </tr>
</table>

  </div>
  <div id="tres"> 
  <p>&nbsp;</p>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td>
	  
<table border="0" align="center" >
	<tr bgcolor="#e3eff6">

          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00119")%> :</td>
          <td  width="247" align="center" ><div align="left">
            <input type="text" name="materia" onKeyPress="return acceptNumLet(event)" class="whiteBox">
          </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00120")%> :</td>
          <td  width="247" align="center" ><div align="left">
            <input type="text" name="profesor" onKeyPress="return acceptNumLet(event)" class="whiteBox">
          </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
         <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00129")%> :</td>
         <td><div align="left"></div>
           <div align="center" id="popCal3" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px"> <font color="#333333" size="2" face="Arial, Helvetica, sans-serif">
           <iframe name="popFrame3" src="/siu/images/calscript2.htm" frameborder="0" scrolling="no" width=183 height=200></iframe>
         </font> </div>
           
           <div align="left">
               <SCRIPT event=onclick() for=document>
		   popCal3.style.visibility = "hidden";
		     </SCRIPT>
             <input onClick="popFrame3.fPopCalendar(txtFech3,txtFech3,popCal3);return false;" type="image" src="/siu/images/closed.gif" value="V"  name="I12" width="18" height="15">
             <input type="text" name="txtFech3" size="13" aling="center" readonly style="font-family: Arial; font-size: 15px" class="whiteBox">
        </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"><%=labels.getElement("00075")%> :</td>
        <td  width="247" align="left" class="eventosbold"><input type="text" name="horaIni" onKeyPress="return acceptNum(event)" class="whiteBox">
            <strong><em>hh:mm</em></strong></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00076")%> :</td>
          <td  width="247" align="left" class="eventosbold"><input type="text" name="horaFin" onKeyPress="return acceptNum(event)" class="whiteBox">
            <strong><em>          hh:mm</em></strong></td>
	</tr>
</table>	  
	  </td>
    </tr>
  </table>
   


<p>&nbsp;</p>
  
  <table width="256" border="0" align="center">
    <tr>
      <td width="246" scope="row" align="left">
        <input type="button" name="QuitSend" value=<%=labels.getElement("00010")%> onClick="Valida3(this.form)">
      </td>
      <td width="48" align="left">
        <input type="reset" name="Borrar2" value=<%=labels.getElement("00009")%> >
     </td>
    </tr>
  </table>
</div> 
</form>
<form name="quit" method="post" action="/siu/siu.statistics.servlet.Siu_Stat_ServletUpdateSemester">

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="200" border="0"  align="center">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio3" onClick="mode(4)" id="radio3"></td>
    <td width="151"><span class="style2"><%=labels.getElement("00131")%>.</span></td>
  </tr>
</table>

  </div>
  <div id="cuatro"> 
  <p>&nbsp;</p>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td>
	  
<table border="0" align="center" >
	<tr bgcolor="#e3eff6">

          <td width="109" align="left" class="eventosbold"><%=labels.getElement("00132")%> :</td>
          <td  width="247" align="center" ><div align="left">
            <input type="text" name="materia" onKeyPress="return acceptNumLet(event)" class="whiteBox">
          </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"><%=labels.getElement("00120")%> :</td>
          <td  width="247" align="center" ><div align="left">
            <input type="text" name="profesor" onKeyPress="return acceptNumLet(event)" class="whiteBox">
          </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
         <td width="109" align="left" class="eventosbold"><%=labels.getElement("00072")%> :</td>
         <td><div align="left"></div>
           <div align="center" id="popCal5" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px"> <font color="#333333" size="2" face="Arial, Helvetica, sans-serif">
           <iframe name="popFrame5" src="/siu/images/calscript2.htm" frameborder="0" scrolling="no" width=183 height=200></iframe>
         </font> </div>
           
           <div align="left">
               <SCRIPT event=onclick() for=document>
		   popCal5.style.visibility = "hidden";
		     </SCRIPT>
             <input onClick="popFrame5.fPopCalendar(txtFech5,txtFech5,popCal5);return false;" type="image" src="/siu/images/closed.gif" value="V"  name="I12" width="18" height="15">
             <input type="text" name="txtFech5" size="13" aling="center" readonly style="font-family: Arial; font-size: 15px" class="whiteBox">
        </div></td>
	</tr>
	<tr bgcolor="#e3eff6">
         <td width="109" align="left" class="eventosbold"><%=labels.getElement("00073")%> :</td>
         <td><div align="left"></div>
           <div align="center" id="popCal4" style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; VISIBILITY: hidden; WIDTH: 10px"> <font color="#333333" size="2" face="Arial, Helvetica, sans-serif">
           <iframe name="popFrame4" src="/siu/images/calscript2.htm" frameborder="0" scrolling="no" width=183 height=200></iframe>
         </font> </div>
           
           <div align="left">
               <SCRIPT event=onclick() for=document>
		   popCal4.style.visibility = "hidden";
		     </SCRIPT>
             <input onClick="popFrame4.fPopCalendar(txtFech4,txtFech4,popCal4);return false;" type="image" src="/siu/images/closed.gif" value="V"  name="I12" width="18" height="15">
             <input type="text" name="txtFech4" size="13" aling="center" readonly style="font-family: Arial; font-size: 15px" class="whiteBox">
        </div></td>
	</tr>	
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"><%=labels.getElement("00075")%> :</td>
        <td  width="247" align="left" class="eventosbold"><input type="text" name="horaIni" onKeyPress="return acceptNum(event)" class="whiteBox">
            <em><strong>hh:mm</strong></em></td>
	</tr>
	<tr bgcolor="#e3eff6">
          <td width="109" align="left" class="eventosbold"> <%=labels.getElement("00076")%> :</td>
          <td  width="247" align="left" class="eventosbold"><input type="text" name="horaFin" onKeyPress="return acceptNum(event)" class="whiteBox">
            <strong><em>hh:mm</em></strong></td>
	</tr>
</table>	  
	  </td>
    </tr>
  </table>
   


<p>&nbsp;</p>
  
  <table width="256" border="0" align="center">
    <tr>
      <td width="246" scope="row" align="center">
        <input type="button" name="QuitSend" value=<%=labels.getElement("00010")%> onClick="Valida4(this.form)" >
      </td>
      <td width="48" align="center">
        <input type="reset" name="Borrar2" value=<%=labels.getElement("00009")%> >
     </td>
    </tr>
  </table>
</div> 
</form>

</body>
</html>
