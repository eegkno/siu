<%@page
import="java.lang.*"
import="java.util.*"
import="java.io.*"
import="java.text.*"
import="javax.servlet.http.*"
import="javax.servlet.*"
import="javax.servlet.*"
import="siu.administration.common.utility.Siu_ContainerLabel"
import ="com.ve.kavachart.servlet.*"
%>

<jsp:useBean id="labels" class="siu.administration.common.utility.Siu_ContainerLabel" scope="session" />
<jsp:useBean id="graphics" class="siu.administration.common.utility.Siu_Container" scope="request" />



<%!
   HttpSession session =null;
   String Id = "";
   String leyenda=null;	
   double promedio[]=null;	
   String opcion ="";
   Bean chart = null;
   String prom[][]=null;
%>
<%

   session = request.getSession(false);
   Id = (String)session.getValue("Id");
   leyenda= (String)graphics.getElement(0);  
   promedio= (double[])graphics.getElement(1);
   opcion= (String)graphics.getElement(2);
  
%>

<% 
	if(opcion.equals("1") || opcion.equals("2"))
	{
			
			chart = new pieApp();
			chart.loadProperties(application.getRealPath("styles/pie.properties"));
			chart.setProperty("writeDirectory", application.getRealPath("images/KavaChartImages"));
			if(opcion.equals("1"))
				chart.setProperty("titleString",labels.getElement("00071")+"s");
			else
				chart.setProperty("titleString",labels.getElement("00074")+"s");
				
			chart.setProperty("dataset0Labels",leyenda);
			
			for(int i=0;i<promedio.length;i++){
				chart.accumulateProperty("dataset0yValues", Double.toString(promedio[i]));
			}
	}
	else if (opcion.equals("3") || opcion.equals("4"))
	{
	
			
			chart = new columnApp();
			chart.loadProperties(application.getRealPath("styles/column.properties"));
			//add some random data here:
			for(int i=0;i<promedio.length;i++){
				chart.accumulateProperty("dataset0yValues", Double.toString(promedio[i]));
			}
			
			//set a few other properties to make the chart look nice
			
			chart.setProperty("writeDirectory", application.getRealPath("images/KavaChartImages"));
			chart.setProperty("dataset0Labels",leyenda);
			chart.setProperty("dwellYString", "value: XX");
			if(opcion.equals("3")){
				chart.setProperty("titleString", labels.getElement("00147")+"     ( "+request.getParameter("semestre")+" )");
				chart.setProperty("yAxisEnd","40000.0");
				chart.setProperty("yAxisTitle",labels.getElement("00150"));
				chart.setProperty("xAxisTitle",labels.getElement("00149"));
			}else{
				chart.setProperty("titleString", labels.getElement("00147")+"     ( "+labels.getElement(request.getParameter("mes"))+" )");
				chart.setProperty("yAxisEnd","3000.0");
				chart.setProperty("yAxisTitle",labels.getElement("00150"));
				chart.setProperty("xAxisTitle",labels.getElement("00151"));
				chart.setProperty("barLabelAngle","90");
			}
			
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

-->
      </style>
</head>
<script language="javascript">

</script>

<body link="0000FF" vlink="0000FF" alink="0000FF" >
<form>

<br>
<h1 align="center">
<div align="center" class="style1">
          <p>&nbsp;</p>
          <p><em><%=labels.getElement("00033")%></em></p>
          <p>&nbsp;</p>
  </div>
          <p class="style2"><%= chart.getLinkMap() %>
          <img src=images/KavaChartImages/<%= chart.getFileName() %> BORDER=0 ISMAP USEMAP=#map0></p>
  </h1>
  
  
 </form>
</body>
</html>
