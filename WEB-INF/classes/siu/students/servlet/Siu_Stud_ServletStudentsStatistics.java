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


public class Siu_Stud_ServletStudentsStatistics extends HttpServlet
{
        String url = "";
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container semestre;
        private Siu_Container profession;
        private Siu_Admin_DBConector dLabels;

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
                //labels = new Siu_ContainerLabel();
         	String Id = session.getId();
                session.setAttribute("Id",Id);
                session.setAttribute("parameters",parameters);

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                
                profession = new Siu_Container();
                semestre = new Siu_Container();

                profession.removeElements();
                semestre.removeElements();

                String sql = "select prof_name from siu_stud_profession";
                String sql2 = "select * from siu_stud_semestre where sem_numero in (0,1,2,3,4,5,6,7,8,9,10,11) order by 1";

                try
                {
                      dLabels = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      String tProf[][] = dLabels.hacerSelect(sql);
                      String tSem[][] = dLabels.hacerSelect(sql2);

                      semestre.setElement(tSem);
                      profession.setElement(tProf);


                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                session.setAttribute("semestre",semestre);
                session.setAttribute("profession",profession);

                url = "/jsp/students/common/Siu_Stud_JspStudentsStatistics";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

