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


public class Siu_Admin_ServletDeleteModule extends HttpServlet
{
        private String url = "";
        private Siu_Admin_DBConector dbc = null;
        private Siu_ContainerLabel parameters;
        private ServletContext context;
        private Siu_Container mod;

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
                dbc = new  Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                
                String sql = "select mod_id,mod_name,mod_status,label_id,mod_link from siu_admin_module "+
                             " where "+
                                    " mod_name != 'Administracion' "+
                             " and "+
                                    " mod_name != 'Software' "+
                             " and "+
                                    " mod_name != 'Cursos' "+
                             " and "+
                                    " mod_name != 'Conexiones' "+
                             " and "+
                                    " mod_name != 'Direcciones IP' "+
                             " and "+
                                    " mod_name != 'Alumnos' "+
                             " and "+
                                    " mod_name != 'Hardware' "+
                             " and "+
                                    " mod_name != 'Estadisticas'"+
                             " and "+
                                    " mod_name != 'Graficas'";                                    

                                    //System.out.println(sql);
                try
                {
                        String modules[][] = dbc.hacerSelect(sql);
                        mod = new Siu_Container();
                        mod.removeElements();
                        mod.setElement(modules);
                        session.setAttribute("mod",mod);

                }
                catch(SQLException e)
                {
                        System.out.println("Error:"+e.getMessage());
                }



                url = "/jsp/administration/common/Siu_Admin_JspDeleteModule.jsp";

                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

