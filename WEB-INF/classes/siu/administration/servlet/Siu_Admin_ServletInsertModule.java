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


public class Siu_Admin_ServletInsertModule extends HttpServlet
{
        // this object contain the result of invocate the method validateUser
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container newModule;
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

                newModule = new Siu_Container();

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));

                String mod_name      = request.getParameter("mod_name").trim();
                String mod_link = request.getParameter("mod_link").trim();
                String label_id  = request.getParameter("label_id").trim();
                String mod_status    = request.getParameter("mod_status").trim();
                String mod_linkadm    = request.getParameter("mod_linkadm").trim();

                int status            = 0;

                if(mod_status.equals("Activado"))
                        status=1;


                //String sql = "insert into siu_admin_module values(DEFAULT,\'"+mod_name+"\',\'"+status+"\',\'"+label_id+"\',\'"+mod_link+"\')";
                String sql = "insert into siu_admin_module values(DEFAULT,\'"+mod_name+"\',\'"+status+"\',\'"+label_id+"\',\'"+mod_link+"\',\'"+mod_linkadm+"\')";


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
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00046";
                else
                {
                        url = "/jsp/administration/common/Siu_Admin_JspUpdateModule.jsp";
                        newModule.setElement(mod_name);
                        newModule.setElement(mod_link);
                        newModule.setElement(label_id);
                        newModule.setElement(mod_status);
                        newModule.setElement(mod_linkadm);


                        session.setAttribute("newModule",newModule);

                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

