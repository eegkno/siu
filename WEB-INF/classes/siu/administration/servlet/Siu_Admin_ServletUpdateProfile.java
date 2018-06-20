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


public class Siu_Admin_ServletUpdateProfile extends HttpServlet
{
        // this object contain the result of invocate the method validateUser

        private Siu_Admin_DBConector profile;
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container usr;
        private String url = "";
        
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

                usr = (Siu_Container)session.getValue("usr");

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                //String agregar = request.getParameter("agregar");
                String sql = "";
                int r = 0;
                String add = "";

                Enumeration enu = request.getParameterNames();





               try
               {
                      profile = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);



                          sql = "delete  from "+
                                              "siu_admin_module_user "+
                                "where "+
                                              " user_login='"+usr.getElement(3)+"'";
                          
                          profile.hacerInsert(sql);

                          sql = "";
                          while(enu.hasMoreElements())
                          {

                	        String value = (String)enu.nextElement();
                                if(!value.equals("Send"))
                                {
                                        sql = "insert into "+
                                                      "siu_admin_module_user "+
                                              "values(DEFAULT,'"+value+"','"+usr.getElement(3)+"')";
                                       r =  profile.hacerInsert(sql);
                                }

                          }
                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                if(r==0)
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00063";
                else
                        url = "/jsp/administration/common/Siu_Admin_JspPassUpdateUser.jsp";

                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

