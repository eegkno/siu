package siu.administration.servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.util.Enumeration;
import javax.servlet.ServletContext.*;
import siu.administration.common.utility.Siu_ContainerLabel;
import siu.administration.common.utility.Siu_Container;
import siu.administration.common.database.Siu_Admin_DBConector;
import siu.administration.business.user.Siu_Admin_BusinessUser;
import siu.administration.beans.user.Siu_Admin_User;


public class Siu_Admin_ServletUpdateDeleteModule extends HttpServlet
{
        // this object contain the result of invocate the method validateUser

        private Siu_Admin_DBConector mod;
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private  String url = "";

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


                HttpSession session = request.getSession(false);



                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                //String agregar = request.getParameter("agregar");
                String sql = "";
                int r = 0;
                String add = "";







               try
               {
               	      Enumeration enu = request.getParameterNames();
               	      mod = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);


                      while(enu.hasMoreElements())
                          {

                	        String value = (String)enu.nextElement();
                                if(!value.equals("enviar"))
                                {
                                        System.out.println(value);

                                        sql = "delete from  siu_admin_module where mod_id=\'"+value+"\'";
                                        r = mod.hacerInsert(sql);

                                }

                          }
                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                if(r==0)
                                url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00066";
                else
                                url = "/jsp/administration/common/Siu_Admin_JspPassUpdateUser.jsp";

                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

