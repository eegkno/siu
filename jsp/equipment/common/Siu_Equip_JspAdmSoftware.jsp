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

function Valida(form)
{
		if(form.agregar.value=="")
        {
                alert('<%=labels.getElement("00099")%>');
                form.agregar.focus();
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

      }
    if (data == 1) 
      {
        document.all['uno'].style.visibility="visible";
        document.all['dos'].style.visibility="hidden";
		document.all['radio2'].blur();

      }
    if (data == 2) 
      {
        document.all['uno'].style.visibility="hidden";
        document.all['dos'].style.visibility="visible";
		document.all['radio1'].blur();

      }
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
-->
</style>
</head>

<body onLoad="mode(0)">


<form name="add" action="/siu/siu.equipment.servlet.Siu_Equip_ServletUpdateSoftware" method="post">
  <div align="center" class="style4">
          <p>&nbsp;</p>
  </div>
<div align="center"><p class="eventos3"><%=labels.getElement("00069")%></p>
  <p class="style2">&nbsp;</p>
</div>
 
<table width="200" border="0"  align="center">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio1" onClick="mode(1)" id="radio1"></td>
    <td width="151"><span class="style3"><%=labels.getElement("00035")%>.</span></td>
  </tr>
</table>
    <label>

  </p>
  <div id="uno">
    <table  border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td width="342">
<table  border="0" align="center">
    <tr bgcolor="#e3eff6">
      <th width="200" scope="row" align="right" class="eventosbold"><div align="left"><%=labels.getElement("00070")%>:</div></th>
      <td width="247"><input type="text" name="agregar" class="whiteBox"></td>
    </tr>
  </table>
</td>
    </tr>
  </table>
  
    <p>&nbsp;</p>
    <table width="262" border="0" align="center" >
    <tr>
      <th width="129" height="45" scope="row"><div align="center">
        <input type="button" name="AddSend" value="<%=labels.getElement("00010")%>" onClick="Valida(this.form)" >
      </div></th>
      <td width="123"><div align="center">
        <input type="reset" name="Borrar" value="<%=labels.getElement("00009")%>" >
      </div></td>
    </tr>
  </table>
  </div>

</form>
<form name="quit" method="post" action="/siu/siu.equipment.servlet.Siu_Equip_ServletUpdateSoftware">

<table width="200" border="0"  align="center">
  <tr>
    <td width="33"><input type="radio" name="RadioGroup" value="radio2" onClick="mode(2)" id="radio2"></td>
    <td width="151"><span class="style2"><%=labels.getElement("00036")%>.</span></td>
  </tr>
</table>

  </div>
  <p>&nbsp;</p>
  <div id="dos">  
  <table width="325" border="0" align="center">
    <tr>
      <th width="129" scope="row"></th>

    </tr>
  </table>
<%
if( sw.getSize()>=1)
{%>
 <table width="381"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
    <tr bgcolor="#e3eff6">
      <td width="373" height="30" >
<table border="0" align="center" >
 <% for (int i = 0; i < t.length; i++)
  {
%>
 
<tr bgcolor="#e3eff6">
            <%
        if((i%2)==0)
        {%>
          <td width="20" align="center" > <input type="checkbox" name="<%=t[i][0]%>" value="T"></td>
          <td  width="200" align="left" class="eventosbold"><%=t[i][1]%></td>

        <%}
        else
        {%>
          <td width="20" align="center" > <input type="checkbox" name="<%=t[i][0]%>" value="T" ></td>
          <td  width="200" align="left" class="eventosbold"><%=t[i][1]%></td>
        <%}%>



</tr>

<%
  }//end for
%>
</table>
</td>
    </tr>
  </table>

  <p>&nbsp;</p>
  <table width="304" border="0" align="center">
    <tr align="center">
      <th width="246" scope="row"><div align="center">
        <input type="button" name="QuitSend" value=<%=labels.getElement("00010")%> onClick="Val(this.form)">
      </div></th>
      
    </tr>
  </table>
  </div>
  <p>&nbsp;</p>
  <p>&nbsp;    </p>
  <div align="center">
    <% 
  }//end if
  else
  {%>
 			   <p align="center"><span class="style2"><%=labels.getElement("00092")%> </span></p>
    <%}
  %>
  </div>
</form>
</body>
</html>
