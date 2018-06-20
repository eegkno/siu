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
import siu.administration.beans.user.Siu_Admin_User;


public class Siu_Admin_ServletInsertUser extends HttpServlet
{
        // this object contain the result of invocate the method validateUser
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container newUser;
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
                Siu_Admin_BusinessUser sabu = new Siu_Admin_BusinessUser();

                newUser = new Siu_Container();

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));

                String user_name      = request.getParameter("user_name").trim();
                String user_firstName = request.getParameter("user_firstName").trim();
                String user_lastName  = request.getParameter("user_lastName").trim();
                String user_status    = request.getParameter("user_status").trim();
                String user_login     =   sabu.createLoginUser(user_name,user_firstName,user_lastName);
                int status            = 0;

                if(user_status.equals("Activado"))
                        status=1;


                String sql            = " insert into "+
                                                     " siu_admin_user "+
                                        " values( \'"+
                                                user_name+"\',\'"+user_firstName+"\',\'"+user_lastName+"\',\'"+user_login+"\',\'"+user_login+"\',\'"+status+"\'"+
                                                " ) ";
                int result = 0;
                try
                {
                    Siu_Admin_DBConector sadbc = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                    result = sadbc.hacerInsert(sql);
                }
                catch(Exception e)
                {
                     System.out.println("--------------------------------------------------------------------------");
                     System.out.println("EXCEPTION GENERADA");
                     System.out.println(e.toString());
                     System.out.println("--------------------------------------------------------------------------");
                     //System.out.println("Error:"+e.getMessage());
                }

                System.out.println(sql+" "+result);

                if(result==0)
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00025";
                else
                {
                        url = "/jsp/administration/common/Siu_Admin_JspUpdateUser.jsp";
                        newUser.setElement(user_name);
                        newUser.setElement(user_firstName);
                        newUser.setElement(user_lastName);
                        newUser.setElement(user_status);
                        newUser.setElement(user_login);

                        session.setAttribute("newUser",newUser);

                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

