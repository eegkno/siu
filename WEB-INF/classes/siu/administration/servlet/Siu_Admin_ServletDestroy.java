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


public class Siu_Admin_ServletDestroy extends HttpServlet
{
        String url ="";
        public void doGet(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
                /*try
        	{ */
                    go(request,response);
                /*}
                catch(Exception e)
                {

                        System.out.println("Excepcion generada" + e);
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00062";
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                        requestDispatcher.forward(request,response);
                } */
        }

        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
                /*try
        	{ */
                    go(request,response);
                /*}
                catch(Exception e)
                {
                        System.out.println("Excepcion generada" + e);
                        url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00062";
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                        requestDispatcher.forward(request,response);
                } */

        }

        public void go(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
                HttpSession session = request.getSession(false);
                session.invalidate();



                url="/siu/admin.html";
                response.sendRedirect(url);
                //RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                //requestDispatcher.forward(request,response);


        }
}

