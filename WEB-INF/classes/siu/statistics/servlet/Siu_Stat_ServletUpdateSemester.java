package siu.statistics.servlet;
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


public class Siu_Stat_ServletUpdateSemester extends HttpServlet
{
        // this object contain the result of invocate the method validateUser
        //private Siu_Container sw;
        private Siu_Admin_DBConector software;
        private ServletContext context;
        private Siu_ContainerLabel parameters;

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
                int irow = 0;
                int icolum = 0;
                int  iconta=0;
                String svalores[] = new String[16];
                Vector v = new Vector();
                int option = 0;
                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                //String agregar = request.getParameter("agregar");
                String sql = "";
                int r = 0;
                String agregar = "";
                String inicio = "";
                String fin = "";
                String materia = "";
                String profesor ="";
                String horaIni = "";
                String horaFin = "";
                String fechaIni = "";
                String fechaFin = "";
                String dias = "";

                Enumeration enu = request.getParameterNames();
                String value = request.getParameter("RadioGroup");

                if(value.equals("radio") )
                {
    		        agregar = request.getParameter("agregar");
    		        inicio = request.getParameter("txtFech");
    		        fin = request.getParameter("txtFech2");
    		        System.out.println("agregar "+agregar+"inicio "+inicio+"fin "+fin);
    		        option = 1;
                }
                else if (value.equals("radio1"))
                {
                	materia = request.getParameter("materia");
                	profesor = request.getParameter("profesor");
                        horaIni = request.getParameter("horaIni");
                	horaFin = request.getParameter("horaFin");

                        String lunes = request.getParameter("checkbox");
                	String martes = request.getParameter("checkbox2");
                	String miercoles = request.getParameter("checkbox3");
                	String jueves = request.getParameter("checkbox4");
                	String viernes  = request.getParameter("checkbox5");
                	String sabado = request.getParameter("checkbox6");

                        if(lunes != null)
                                 dias = dias+lunes+",";
                        if(martes != null)
                                 dias = dias+martes+",";
                        if(miercoles != null)
                                 dias = dias+miercoles+",";
                        if(jueves != null)
                                 dias = dias+jueves+",";
                        if(viernes != null)
                                 dias = dias+viernes+",";
                        if(sabado != null)
                                 dias = dias+sabado+",";



                	option = 2;
                }
                else if(value.equals("radio2"))
                {
                	materia = request.getParameter("materia");
                	profesor = request.getParameter("profesor");
                	fechaIni = request.getParameter("txtFech3");
                	horaIni = request.getParameter("horaIni");
                	horaFin = request.getParameter("horaFin");

                        option = 3;
                }
                else
                {
                	
                	materia = request.getParameter("materia");
                	profesor = request.getParameter("profesor");
                	fechaIni = request.getParameter("txtFech5");
                	fechaFin = request.getParameter("txtFech4");
                	horaIni = request.getParameter("horaIni");
                	horaFin = request.getParameter("horaFin");
                        option = 4;
                }


               System.out.println("value "+value);
               System.out.println("value "+option);
               System.out.println("materia "+materia);
               System.out.println("profesor "+profesor);
               System.out.println("fechaIni "+fechaIni);
               System.out.println("fechaFin "+fechaFin);
               System.out.println("horaIni "+horaIni);
               System.out.println("horaFin "+horaFin);
               System.out.println("dias "+dias);


                try
                {
                      software = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);

                      if (option == 1)
                      {
                          int i = software.hacerInsert("update Siu_Statistics_Semester set sem_enable = false");
                          System.out.println(" i "+i);


                          i = software.hacerInsert("insert into  Siu_Statistics_Semester values(DEFAULT,'"+agregar+"','"+inicio+"','"+fin+"',true)");

                          //System.out.println(" i "+i+" sql "+"insert into  Siu_Statistics_Semester values('DEFAULT','"+agregar+"','"+inicio+"','"+fin+"',1))");
                          System.out.println(" nueva i "+i);

                      }
                      else if (option == 2)
                      {
                      	   String semId[][] = software.hacerSelect("select sem_id,sem_start,sem_finish from Siu_Statistics_Semester where sem_enable = true");
                      	   fechaIni= semId[0][1];
                      	   fechaFin= semId[0][2];
                           software.hacerInsert("insert into  Siu_Statistics_ClassCourse values(DEFAULT,\'"+semId[0][0]+"\',\'"+profesor+"\',\'"+materia+"\',\'"+fechaIni+"\',\'"+fechaFin+"\',\'"+horaIni+"\',\'"+horaFin+"\',\'"+dias+"\',\'"+option+"\')");
                      }
                      else if (option == 3)
                      {
                      	
                      	   String semId[][] = software.hacerSelect("select sem_id from Siu_Statistics_Semester where sem_enable = true");
                      	   //fechaIni= semId[0][1];
                      	   //fechaFin= semId[0][2];
                           software.hacerInsert("insert into  Siu_Statistics_ClassCourse values(DEFAULT,\'"+semId[0][0]+"\',\'"+profesor+"\',\'"+materia+"\',\'"+fechaIni+"\',\'"+fechaIni+"\',\'"+horaIni+"\',\'"+horaFin+"\',\'"+dias+"\',\'"+option+"\')");

                      }
                      else
                      {
                      	   String semId[][] = software.hacerSelect("select sem_id from Siu_Statistics_Semester where sem_enable = true");
                      	   //fechaIni= semId[0][1];
                      	   //fechaFin= semId[0][2];
                           software.hacerInsert("insert into  Siu_Statistics_ClassCourse values(DEFAULT,\'"+semId[0][0]+"\',\'"+profesor+"\',\'"+materia+"\',\'"+fechaIni+"\',\'"+fechaFin+"\',\'"+horaIni+"\',\'"+horaFin+"\',\'"+dias+"\',\'"+option+"\')");

                      }



                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }

                //session.setAttribute("sw",sw);

                url = "/jsp/statistics/common/Siu_Stat_JspAddSemester.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

