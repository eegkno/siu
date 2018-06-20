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

<jsp:useBean id="parameters"  class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="labels"      class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="user"        class="siu.administration.beans.user.Siu_Admin_User" scope="session" />
<jsp:useBean id="usr"         class="siu.administration.common.utility.Siu_Container" scope="session" />
<jsp:useBean id="Modules"     class="siu.administration.common.utility.Siu_Container" scope="session" />
<jsp:useBean id="ModulesUser" class="siu.administration.common.utility.Siu_Container" scope="session" />




<%!
   HttpSession session =null;
   String Id = "";
   String m[][]=null;
   String mu = "";
%>

<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   m = (String[][])Modules.getElement(0);
   mu = (String)ModulesUser.getElement(0);
%>



<html>
<head>
	<title><%=labels.getElement("00001")%></title>
		<link href="../../../css/estilos.css" rel="stylesheet" type="text/css">
<link href="/siu/css/estilos.css" rel="stylesheet" type="text/css">	

</head>
<body link="0000FF" vlink="0000FF" alink="0000FF">
<form name="forma" method="post" id="forma" action="/siu/siu.administration.servlet.Siu_Admin_ServletUpdateProfile" >

  <div align="center">
    <p>&nbsp;</p>
    <p class="eventos3" align="center"><%=labels.getElement("00006")%>  <%=labels.getElement("00014")%></p>
  </div>
  <br>
  <table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr  bgcolor="#e3eff6">
      <td >
<table border="0" align="center" >
<%
  for (int i = 0; i < m.length; i++)
  { 
    if( mu.indexOf(m[i][0]) != -1)
    {
    	if((i%2)==0)
        {%>
              <tr bgcolor="#e3eff6">
                  <td width="20"   align="center"><input type="checkbox" name="<%=m[i][0]%>" value="T" checked  ></td>
                  <td  width="200" align="left" class="eventosbold" ><%=labels.getElement(m[i][1])%></td>
              </tr>
              
        <%
        }
        else
        {
        %>
              <tr bgcolor="#e3eff6">
                  <td width="20" align="center" > <input type="checkbox" name="<%=m[i][0]%>" value="T" checked></td>
                  <td  width="200" align="left" class="eventosbold" ><%=labels.getElement(m[i][1])%></td>
              </tr>

        <%}
    
    }
    else
    {
    	if((i%2)==0)
        {%>
              <tr bgcolor="#e3eff6">
                <td width="20" align="center" > <input type="checkbox" name="<%=m[i][0]%>" value="T" ></td>
                  <td  width="200" align="left" class="eventosbold" ><%=labels.getElement(m[i][1])%></td>
              </tr>

        <%
        }
        else
        {
        %>
              <tr  bgcolor="#e3eff6">
                <td width="20" height="32" align="center" > <input type="checkbox" name="<%=m[i][0]%>" value="T" ></td>
                  <td  width="200" align="left" class="eventosbold"><%=labels.getElement(m[i][1])%></td>
              </tr>

        <%}
      }

  }
%>
</table>
	  
	  
	  </td>
    </tr>
  </table>
  <br>
  <br>




  <p>&nbsp;</p>
  <table width="257" border="0" align="center">
    <tr>
      <th scope="row"><div align="center">
        <input type="submit" name="Send" value=<%=labels.getElement("00010")%>>
      </div></th>
      <td><div align="center">
        <input type="reset" name="Borrar" value=<%=labels.getElement("00009")%>>
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
