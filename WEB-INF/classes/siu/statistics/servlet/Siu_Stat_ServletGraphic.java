package siu.statistics.servlet;
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
import siu.students.business.*;
import java.util.*;

public class Siu_Stat_ServletGraphic extends HttpServlet
{
        // this object contain the result of invocate the method validateUser

        private Siu_Admin_DBConector stat;
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container statistics;

        public void init()
        {
        	context = getServletContext();
                parameters = (Siu_ContainerLabel)context.getAttribute("parameters");
                //sw = new Siu_Container();
        }

        public void doGet(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
                go(request,response);
        }

        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {
        	go(request,response);

        }

        public void go(HttpServletRequest request,HttpServletResponse response)
                throws IOException, ServletException
        {


                HttpSession session = request.getSession(false);
                String url = "";

                statistics = new  Siu_Container();

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                Siu_Container meses = new Siu_Container();

                try
                {
                   stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                   
                   String s[][] = stat.hacerSelect("select sem_id,sem_name from  siu_statistics_semester order by 1");

                   statistics.removeElements();
                   meses.removeElements();
                   statistics.setElement(s);
                   meses = Siu_Stat_Utility.getMeses(stat,1,"ultimo");
                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }


                session.setAttribute("stat",statistics);
                session.setAttribute("meses",meses);

                url = "/jsp/statistics/common/Siu_Stat_JspGraphics.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

