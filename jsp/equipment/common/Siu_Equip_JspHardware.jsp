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
.style4 {font-family: Arial, Helvetica, sans-serif}
.style5 {color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; }
.style6 {color: #000000}
.style7 {font-size: 16px}
.style8 {color: #000000; font-family: Arial, Helvetica, sans-serif; }

-->
      </style>
</head>

<body link="0000FF" vlink="0000FF" alink="0000FF" >
<h1 align="center">
<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
          <p class="style2"><%=labels.getElement("00088")%></p>
          <p>&nbsp;</p>
           

</h1>
<%
if(sw.getSize()>=1)
{
  for (int i = 0; i < t.length; i++)
  {
%>
<table width="650"  height="200" border="0" align="center">
<tr>
<td>
    <img  height="150" width="200" src="<%=t[i][6]%>" >
</td>
<td>
<table border="0" align="center"  >
<tr bordercolordark="#000000" >
      <%
        if((i%2)==0)
        {%>
            <tr>
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00082")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][1]%></pre></td>			
            </tr>
			<tr>			
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00083")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][2]%></pre></td>
			</tr>			<tr>
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00084")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][3]%></pre></td>
			</tr>			<tr>
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00085")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][4]%></pre></td>
			</tr>			<tr>			
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00086")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][5]%></pre></td>

        <%}
        else
        {%>
			<tr>
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00082")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][1]%></pre></td>
			</tr>
			<tr>			
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00083")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][2]%></pre></td>
			</tr>			
			<tr>			
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00084")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][3]%></pre></td>
			</tr>			
			<tr>
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00085")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][4]%></pre></td>
			</tr>			
			<tr>			
      		<td width="130" height="10" align="left"   bgcolor="#cccccc"  ><pre class="style8" ><%=labels.getElement("00086")%> :</pre></td>
			<td width="228" height="15" align="center"   bgcolor="#666666"  ><pre class="style5" ><%=t[i][5]%></pre></td>
			</tr>			

        <%}%>

</table>
</td>
</tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<%
  }//end for
  }//end if
  else
  {%>
	<p class="eventos3" align="center"><%=labels.getElement("00092")%></p>  	
  <%}
%>




</body>
</html>
