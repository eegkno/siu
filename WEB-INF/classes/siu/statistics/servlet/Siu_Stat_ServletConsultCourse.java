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


public class Siu_Stat_ServletConsultCourse extends HttpServlet
{
        // this object contain the result of invocate the method validateUser

        private Siu_Admin_DBConector stat;
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container course;

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
                String option =  request.getParameter("option");
                String semestre = request.getParameter("semestre");
                System.out.println("option"+option+"   semestre"+semestre);

                course = new  Siu_Container();

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));

                String sql = "select s.sem_name,c.cla_teacher,c.cla_name,c.cla_initialdate,c.cla_finaldate,c.cla_iniitialhour,c.cla_finalhour,c.cla_days from  siu_statistics_classcourse c inner join siu_statistics_semester s on c.sem_id=s.sem_id  where c.sem_id=\'"+semestre+"\' and cla_type = \'"+option+"\'";

                try
                {
                   stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);


                   String s[][] = stat.hacerSelect(sql);

                   course.removeElements();

                   course.setElement(s);
                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                session.setAttribute("course",course);

                url = "/jsp/statistics/common/Siu_Stat_JspShowCourse.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

