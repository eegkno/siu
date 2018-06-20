<%@page
import="java.lang.*"
import="java.util.*"
import="java.io.*"
import="java.text.*"
import="javax.servlet.http.*"
import="javax.servlet.*"
import="javax.servlet.*"
import="siu.administration.common.utility.Siu_ContainerLabel"
import="siu.students.business.Siu_Stat_Utility"
%>

<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="course" class="siu.administration.common.utility.Siu_Container" scope="session" />

<%!
   HttpSession session =null;
   String Id = "";
   String s[][]=null;	
   String opcion = "";
   String dias ="";
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   s= (String[][])course.getElement(0);
   opcion = request.getParameter("option");

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
.style7 {font-size: 16px}
.style8 {color: #FFFFFF}

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
          <p class="style2"><%=labels.getElement("00145")%></p>
          <p>&nbsp;</p>
           

</h1>



<%
if(s.length >0)
{%>
<table border="0" align="center"   width="80%" cellspacing="1" cellpadding="3">
<tr bordercolor="#000000" bgcolor="#000066">
<td width="90"><div align="left" class="style8"><%=labels.getElement("00119")%></div></td>
<td width="90"><div align="left" class="style8"><%=labels.getElement("00120")%></div></td>
<td width="60"><div align="left" class="style8"><%=labels.getElement("00140")%></div></td>
<td width="60"><div align="left" class="style8"><%=labels.getElement("00141")%></div></td>
<td width="60"><div align="left" class="style8"><%=labels.getElement("00075")%></div></td>
<td width="60"><div align="left" class="style8"><%=labels.getElement("00076")%></div></td>


<%if(opcion.equals("2"))
{%>
<td width="60"><div align="left" class="style8"><%=labels.getElement("00121")%></div></td> 
<%}%>

</tr>
<% for (int i = 0; i < s.length; i++)
  {
%>

<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr bordercolordark="#000000" >
      <%
        if((i%2)==0)
        {%>
			  <td width="90" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=s[i][2]%></pre>
			    </div></td>
			  <td width="90" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=s[i][1]%></pre>
			    </div></td>
			  <td width="60" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=s[i][3]%></pre>
			    </div></td>
			  <td width="60" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=s[i][4]%></pre>
			    </div></td>
			  <td width="60" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=s[i][5]%></pre>
			    </div></td>
			  <td width="60" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=s[i][6]%></pre>
			    </div></td>
<%if(opcion.equals("2"))
{%>				
<%
		dias = s[i][7];
		for (int k = 2; k < 8; k++)
		{
   		dias = Siu_Stat_Utility.reemplazar(dias,"0012"+k,(String)labels.getElement("0012"+k));
		}
		
%>				<td width="60" height="15" align="center"   bgcolor="#666666"  ><div align="left">
			    <pre class="style5" ><%=dias%></pre>			  		
				</div></td>	  
				<%}%>
        <%}
        else
        {%>
			  <td width="91" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][2]%></pre>
			    </div></td>
			  <td width="112" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][1]%></pre>
			    </div></td>
			  <td width="47" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][3]%></pre>
			    </div></td>
			  <td width="47" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][4]%></pre>
			    </div></td>
			  <td width="47" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][5]%></pre>
			    </div></td>
			  <td width="47" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][6]%></pre>
			    </div></td>
<%if(opcion.equals("2"))
{%>

<%
		dias = s[i][7];
		for (int k = 2; k < 8; k++)
		{
   		dias = Siu_Stat_Utility.reemplazar(dias,"0012"+k,(String)labels.getElement("0012"+k));
		}
		
%>		
				
			  <td width="53" height="15" align="center"   bgcolor="#cccccc"  ><div align="left">
			    <pre class="style5" ><%=s[i][7]%></pre>
			    </div></td>	
				<%}%>
        <%}%>

<%
  }//end for
%></tr>
</table>  
  <%}//end if
  else
  {%>
  		<p align="center" class="style7"><span class="style4 style7"><strong><%=labels.getElement("00092")%> </strong></span></p>
  <%}
%>




</body>
</html>
