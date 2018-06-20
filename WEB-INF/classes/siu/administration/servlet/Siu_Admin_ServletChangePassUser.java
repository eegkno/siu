package siu.administration.servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletContext.*;
import siu.administration.common.utility.Siu_ContainerLabel;
import siu.administration.common.utility.Siu_Container;
import siu.administration.common.database.Siu_Admin_DBConector;
import siu.administration.business.user.Siu_Admin_BusinessUser;


public class Siu_Admin_ServletChangePassUser extends HttpServlet
{
        private String url = "";
        private Siu_Admin_DBConector dbc = null;
        private Siu_ContainerLabel parameters;
        private ServletContext context;
        private Siu_Container usr;

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

                String user_password   =  request.getParameter("pass");

                String sql          = "";
                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                dbc = new  Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                int update = 0;

                usr =  (Siu_Container)session.getValue("usr");

                sql= "update siu_admin_user set  "+
                                     "user_password = '"+user_password+"'"+
                             " where "+
                                     " user_login = '"+usr.getElement(4)+"'";


                //System.out.println(sql);

                 try
                 {
                      update    =   dbc.hacerInsert(sql);

                  }
                  catch(SQLException e)
                  {
                          System.out.println("Error:"+e.getMessage());
                  }


                url = "/jsp/administration/common/Siu_Admin_JspPassUpdateUser.jsp";


                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

