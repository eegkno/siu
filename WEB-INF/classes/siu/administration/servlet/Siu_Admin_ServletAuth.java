package siu.administration.servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletContext.*;
import siu.administration.common.utility.Siu_ContainerLabel;
import siu.administration.common.database.Siu_Admin_DBConector;



public class Siu_Admin_ServletAuth extends HttpServlet
{
        private String url = "";
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_ContainerLabel labels;
        private Siu_Admin_DBConector dLabels;

        public void init()
        {
                context = getServletContext();
                parameters = (Siu_ContainerLabel)context.getAttribute("parameters");
        }

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
                labels = new Siu_ContainerLabel();

                HttpSession session = request.getSession(true);
        	String Id = session.getId();
                session.setAttribute("Id",Id);
                session.setAttribute("parameters",parameters);

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                int icolum = 0;
                int irow = 0;
                String lang = "";
                int option = 0;
                
                if( request.getParameter("lang") != null)
                {
                     lang = request.getParameter("lang");
                     if(lang.equals("ESP"))
                     	option=1;
                     else
                         option=2;

                }
                else
                     option = 1;

                //System.out.println("classForName" + classForName );
                //System.out.println("IpDataBase" + IpDataBase );
                //System.out.println("dataBase" + dataBase );
                //System.out.println("User" + User );
                //System.out.println("Password" + Password );
                String sql = "select sal.label_number,sal.label_name  from (siu_admin_label sal inner join siu_admin_language_label sall on sall.label_id=sal.label_id and sall.lang_id="+option+")";
                try
                {
                      dLabels = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      String tLabels[][] = dLabels.hacerSelect(sql);
                      irow = dLabels.getRenglon();
                      icolum = dLabels.getColumna();

                      for (int i = 0; i < irow; i++)
                      {
                      	     //System.out.println(i+" "+tLabels[i][0]+" "+tLabels[i][1]);
                             labels.setElement(new String(tLabels[i][0]),new String(tLabels[i][1]));
                      }

                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                session.setAttribute("labels",labels);
                //System.out.println("00005 = "+labels.getElement("00005"));
                //System.out.println("icolumnas = "+icolum+" "+"irenglon = "+irow);
                //System.out.println("Id"+Id);
                //System.out.println("IpDataBase" + IpDataBase );
                //System.out.println("dataBase" + dataBase );
                //System.out.println("User" + User );
                //System.out.println("Password" + Password );

        	url = "/jsp/administration/common/Siu_Admin_JspAuth.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

