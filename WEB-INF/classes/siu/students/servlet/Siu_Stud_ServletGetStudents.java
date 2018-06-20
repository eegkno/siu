package siu.students.servlet;
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


public class Siu_Stud_ServletGetStudents extends HttpServlet
{
        private String url = "";
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Admin_DBConector dHist;
        private Siu_Container history;

        public void init()
        {
                context = getServletContext();
                parameters = (Siu_ContainerLabel)context.getAttribute("parameters");
                history = new Siu_Container();
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
                String login =       request.getParameter("login");

                String url = "";
                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                int icolum = 0;
                int irow = 0;
                String sql = "select "+
                                     " hist_personal "+
                             " from "+
                                     " siu_stud_historical "+
                             " where "+
                                     " hist_login='"+login+"'";
                                     System.out.println(sql);
                try
                {
                      dHist = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      String tHist[][] = dHist.hacerSelect(sql);
                      if( tHist.length == 0)
                      {
                             url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00037";
                      }
                      else
                      {
                      //System.out.println(tHist[0][0]);
                      //System.out.println(sql);
                            history.removeElements();
                            history.setElement(tHist);
                            session.setAttribute("history",history);
                            url = "/jsp/students/common/Siu_Stud_JspGetStudents.jsp";
                      }

                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }


                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

