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


public class Siu_Admin_ServletValidateAuth extends HttpServlet
{
        private String url = "";
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Admin_BusinessUser buser; //this object is the refrence to invocate the method validateUser
        private Siu_Container user;           //this object contain the the values of the user
        private Siu_Container ruser;          // this object contain the result of invocate the method validateUser

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
                user =  new  Siu_Container();
        	ruser =  new  Siu_Container();

                HttpSession session = request.getSession(false);
                buser = new Siu_Admin_BusinessUser();

        	String Id =           session.getId();
                session.setAttribute("Id",Id);
                session.setAttribute("parameters",parameters);
                String login =        request.getParameter("login");
                String pass =         request.getParameter("pass");
                user.setElement(login);
                user.setElement(pass);
                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                ruser = buser.validateUserAuth(parameters,user);

                String error = (String)ruser.getElement(6);
                System.out.println("ruser = " + error);
                System.out.println("size = "+ruser.getSize());

                if (error.equals("0"))
                   url = "/jsp/administration/common/Siu_Admin_JspMainAuth.jsp";
                if (error.equals("1"))
                   url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00057";
                if (error.equals("2"))
                   url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00061";
                if (error.equals("3"))
                   url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00059";
                if (error.equals("4"))
                   url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00060";
                if (error.equals("5"))
                url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00154";

                // ruser contiene los datos del usuario una vez que fue validado
                session.setAttribute("ruser",ruser);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

