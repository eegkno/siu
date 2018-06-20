package siu.students.servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletContext.*;
import java.util.Enumeration;
import siu.administration.common.utility.Siu_ContainerLabel;
import siu.administration.common.utility.Siu_Container;
import siu.administration.common.database.Siu_Admin_DBConector;
import siu.administration.business.user.Siu_Admin_BusinessUser;
import siu.administration.beans.user.Siu_Admin_User;


public class Siu_Stud_ServletGetStatistics extends HttpServlet
{
        String url = "";
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_ContainerLabel querys;
        private Siu_Container semestre;
        private Siu_Container profession;
        private Siu_Container statistics;
        private Siu_Admin_DBConector dLabels;
        private Siu_Container param;

        public void init()
        {
                context = getServletContext();
                parameters = (Siu_ContainerLabel)context.getAttribute("parameters");
                querys = (Siu_ContainerLabel)context.getAttribute("querys");
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
                String svalores[] = new String[16];
	        int iconta=0;
            	int isuma1=0;
                int isuma2=0;
                int isuma3=0;
                int isuma4=0;
                int isuma5=0;
                int isuma6=0;
                int isuma7=0;
                int itotal=0;
	        String menu_semestre="";
          	String fechaini="";
          	String fechafin="";
          	String horaini="";
          	String horafin="";
          	String menu_carrera="";
          	String seleccion="";
                statistics = new Siu_Container();

                Enumeration en = request.getParameterNames();
                while(en.hasMoreElements())
                {
                    svalores[iconta]=(String)en.nextElement();
                    iconta++;
                }

                for(int i=0;i<iconta;i++)
                {

                      if(svalores[i].equals("check_semestre"))
                      {
            		    menu_semestre = request.getParameter("menu_semestre");
                                if(!menu_semestre.equals(""))
                                    isuma1=1;
                      }
                      if(svalores[i].equals("check_fechaini"))
                      {
            		    fechaini = request.getParameter("txtFech");
                                if(!fechaini.equals(""))
                                    isuma2=2;
                      }
                      if(svalores[i].equals("check_fechafin"))
                      {
            		    fechafin = request.getParameter("txtFech2");
                                if(!fechafin.equals(""))
                                    isuma3=4;
                      }
                      if(svalores[i].equals("check_carrera"))
                      {
            		    menu_carrera = request.getParameter("menu_carrera");
                                if(!menu_carrera.equals(""))
                                    isuma4=8;
                      }
                      if(svalores[i].equals("check_horaini"))
                      {
            		    horaini = request.getParameter("menu_horaini");
                                if(!horaini.equals(""))
                                isuma5=16;
                      }
                      if(svalores[i].equals("check_horafin"))
                      {
            		    horafin = request.getParameter("menu_horafin");
                                if(!horafin.equals(""))
                                    isuma6=32;
                      }
                  }
      	          itotal=isuma1+isuma2+isuma3+isuma4+isuma5+isuma6+isuma7;

                  String sql = (String)querys.getElement(new String(""+itotal));
                  //String sql = (String)querys.getElement(new String("1"));
                  param = new Siu_Container();
                  param.removeElements();
                  
                  if(!menu_semestre.equals(""))
                  {
                        param.setElement("00071");
                        param.setElement(menu_semestre);
                  }

                  if(!fechaini.equals(""))
                  {
                        param.setElement("00072");
                        param.setElement(fechaini);

                  }

                  if(!fechafin.equals(""))
                  {
                        param.setElement("00073");
                        param.setElement(fechafin);
                  }

                  if(!menu_carrera.equals(""))
                  {
                        param.setElement("00074");
                        param.setElement(menu_carrera);
                  }

                  if(!horaini.equals(""))
                  {
                        param.setElement("00075");
                        param.setElement(horaini);
                  }

                  if(!horafin.equals(""))
                  {
                        param.setElement("00076");
                        param.setElement(horafin);
                  }



                  //System.out.println("menu_semestre = "+menu_semestre);
                  //System.out.println("fechaini = "+fechaini);
                  //System.out.println("fechafin = "+fechafin);
                  //System.out.println("menu_carrera = "+menu_carrera);
                  //System.out.println("horaini = "+horaini);
                  //System.out.println("horafin = "+horafin);
                  //System.out.println("itotal = "+itotal);

                  sql=reemplazar(sql,"SEMESTRE",menu_semestre);
                  sql=reemplazar(sql,"FECHAINI",fechaini);
	          sql=reemplazar(sql,"FECHAFIN",fechafin);
	          sql=reemplazar(sql,"CARRERA",menu_carrera);
 	          sql=reemplazar(sql,"HORAINI",horaini);
	          sql=reemplazar(sql,"HORAFIN",horafin);

	          System.out.println("sql = "+sql);
	          


               try
                {
                     dLabels = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                     String tStat1[][] = dLabels.hacerSelect("select sem_name from siu_statistics_semester where sem_enable = 'true'");
                     
                     
                     if(itotal == 1 || itotal == 8 || itotal == 9)
                     {
                         String[] aux = tStat1[0][0].split("-");
                         String a = aux[0].substring(3,4);
                         a += aux[1];
                         sql += "  and c.acc_accounttype like \'%"+a+"%\' order by 1 ";
                     }

                     System.out.println("sql = "+sql);

                     dLabels = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                     String tStat[][] = dLabels.hacerSelect(sql);
                     statistics.setElement(tStat);

                   /*for (int i = 0; i < tStat.length; i++)
	            {
                         System.out.println(tStat[i][0]);

	            }*/

                }
                catch(SQLException e)
                {
                       System.out.println("Error:"+e.getMessage());
                }



                session.setAttribute("statistics",statistics);
                session.setAttribute("param",param);

                url = "/jsp/students/common/Siu_Stud_JspGetStudentsStatistics";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }

//Metodo para reemplazar cadenas
         public String reemplazar(String scadena,String old, String reemplazo)
         {
                String scheca = new String(scadena);
                int ilongitud=old.length();
                int icheca=-1;
                icheca=scheca.indexOf(old);
                if(icheca != -1)
                    scadena=scadena.substring(0,icheca)+reemplazo+scadena.substring(icheca+ilongitud);
                return scadena;
        }//Metodo reemplazar

}

