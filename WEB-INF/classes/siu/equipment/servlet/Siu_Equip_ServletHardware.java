package siu.equipment.servlet;
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


public class Siu_Equip_ServletHardware extends HttpServlet
{
        // this object contain the result of invocate the method validateUser
        private Siu_Container sw;
        private Siu_Admin_DBConector software;
        private ServletContext context;
        private Siu_ContainerLabel parameters;

        public void init()
        {
        	context = getServletContext();
                parameters = (Siu_ContainerLabel)context.getAttribute("parameters");
                sw = new Siu_Container();
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
                int irow = 0;
                int icolum = 0;

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));

                try
                {
                      software = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      String tSw[][] = software.hacerSelect("select * from siu_equip_hardware");
                      irow = software.getRenglon();
                      icolum = software.getColumna();
                      sw.removeElements();
                      for (int i = 0; i < irow; i++)
                      {
                      	     //System.out.println(i+"  "+tSw[i][1]);
                             sw.setElement(tSw);
                      }

                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                session.setAttribute("sw",sw);
                url = "/jsp/equipment/common/Siu_Equip_JspHardware.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

