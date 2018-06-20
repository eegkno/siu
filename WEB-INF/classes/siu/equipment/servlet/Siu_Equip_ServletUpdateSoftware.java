package siu.equipment.servlet;
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


public class Siu_Equip_ServletUpdateSoftware extends HttpServlet
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

                Enumeration enu = request.getParameterNames();
                String value1 = request.getParameter("RadioGroup");

                System.out.println("valor1 = "+value1);


                	if(value1.equals("radio1") )
                        {
		                agregar = request.getParameter("agregar");
		                option = 1;
                        }
                        else
                        {
                                while(enu.hasMoreElements())
                                {
                                 String value = (String)enu.nextElement();
                        	 System.out.println("valor = "+value);
                                 if(value.equals("QuitSend"))
                                        System.out.println("valor = "+value);
                                 else if (value.equals("radio2"))
                                      System.out.println("valor = "+value);
                                 else if (value.equals("RadioGroup"))
                                      System.out.println("valor = "+value);
                                 else
                                        v.add(value);
                                }
                                 option = 2;


                        }

                 System.out.println("opcion = "+option);

                try
                {
                      software = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      
                      if (option == 1)
                      {
                          String t[][] = software.hacerSelect("select * from siu_equip_software");
      
                          if(t.length==0)
                              r=1;
                          else
                          {
                               String t2[][] = software.hacerSelect("select max(sw_id) from siu_equip_software");
                               r = Integer.valueOf(t2[0][0]).intValue()+1;
                          }
      
                          sql = "insert into siu_equip_software values(\'"+r+"\',\'"+agregar+"\')";
                          System.out.println(sql);
                          software.hacerInsert(sql);
                      }
                      if (option == 2)
                      {
                      	  String datos = (String)v.get(0) ;
                      	  for (int i = 1; i < v.size(); i++)
                          {
                              datos = datos +","+(String)v.get(i);
                          }

                          sql = "delete from siu_equip_software where sw_id in ("+datos+")";
                          System.out.println(sql);
                          software.hacerInsert(sql);

                      }


                      String tSw[][] = software.hacerSelect("select * from siu_equip_software");
                      irow = software.getRenglon();
                      icolum = software.getColumna();
                      sw.removeElements();
                      sw.setElement(tSw);



                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }


                session.setAttribute("sw",sw);
                url = "/jsp/equipment/common/Siu_Equip_JspAdmSoftware.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }
}

