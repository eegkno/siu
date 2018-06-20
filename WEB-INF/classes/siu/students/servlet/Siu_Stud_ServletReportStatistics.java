package siu.students.servlet;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.URL;
import siu.administration.common.utility.Siu_ContainerLabel;
import siu.administration.common.utility.Siu_Container;
import javax.servlet.ServletContext.*;
import siu.administration.common.utility.Siu_ContainerLabel;

public class Siu_Stud_ServletReportStatistics extends HttpServlet
{

        private String url = "";
        private ServletContext context;
        private Siu_ContainerLabel labels;
        
        /*
        public void init()
        {
                context = getServletContext();
                labels = (Siu_ContainerLabel)context.getAttribute("labels");
        }
        */

        public void doGet(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
                try
        	{
                    go(request,response);
                }
                catch(Exception e)
                {
                        System.out.println("Excepcion generada" + e);
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00062";
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                        requestDispatcher.forward(request,response);
                }
        }

        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
                try
        	{
                    go(request,response);
                }
                catch(Exception e)
                {
                        System.out.println("Excepcion generada" + e);
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00062";
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                        requestDispatcher.forward(request,response);
                }

        }

        public void go(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
        	
                response.setContentType("application/vnd.ms-excel");
                PrintWriter out = response.getWriter();
                HttpSession session = request.getSession(false);


                Siu_Container statistics = (Siu_Container)session.getAttribute("statistics");
                Siu_Container param = (Siu_Container)session.getAttribute("param");
                String Id = (String)session.getValue("Id");
                String tStat[][]=null;
                
                labels =  (Siu_ContainerLabel)session.getAttribute("labels");

                if(statistics.getSize()==1)
                       tStat = (String[][])statistics.getElement(0);
                else
                       System.out.println("Vector"+statistics.getSize());


                out.println("<html>" );
                out.println("<head><title>SIU</title></head>");
                out.println("<body link=\"0000FF\" vlink=\"0000FF\" alink=\"0000FF\">");
                out.println("<form name=\"forma\" method=\"post\" id=\"forma\" action=\"\" >" );
                out.println("<p>&nbsp;</p>" );
                out.println("<p>&nbsp;</p>" );
                out.println("<h1 align=\"center\"><font size=\"4\" face=\"Verdana,");
                out.println("Arial, Helvetica, sans-serif\">"+labels.getElement("00014")+"</font></h1>");
                

                out.println("<p>&nbsp;</p>" );
                out.println(" <p>"+labels.getElement("00081")+" </p>");
                out.println("<p>&nbsp;</p>" );
                out.println("<table width=\"84\"  border=\"1\" align=\"center\"  bordercolor=\"#000000\" bgcolor=\"#FFFFFF\">");

        	for(int i = 0; i<param.getSize(); i++)
        	{
            	   
            		if((i%2)==0)
            		{
            		   out.println("<tr bordercolor=\"#FFFFFF\">");
            		   out.println("<td>"+labels.getElement((String)param.getElement(i)) +":  </td>");
            	        }
            	        else
            	        {
            	    	   out.println("<td>"+param.getElement(i) +"</td>");
            		   out.println("</tr>");

            	       }
               }
                out.println("</table>");

                out.println("<p>&nbsp;</p>");


                 //String alumno=request.getParameter("personal");
                
                 out.println("<table border=\"1\" align=\"center\" bordercolor=\"#000000\" bordercolorlight=\"#000000\" cellspacing=\"0\" cellpadding=\"0\" >");
                 for(int i = 0; i < tStat.length;i++) 
                 {
                               if(i == 0)
                                 out.println("<tr>");
                               else
                                 out.println("</tr><tr>");
                               for(int j=0;j<tStat[0].length ;j++){
                                if (!tStat[i][j].equals("null")){
                                 out.println("<td bgcolor=\"#CCCCCC\"><pre>"+tStat[i][j]+"</pre></td>");
                		}
                        	}
                  }

                out.println("</table>");
                out.println("</body>");
                out.println("</html>");

        }





}
