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


public class Siu_Admin_ServletResponseConsultUser extends HttpServlet
{
        private String url = "";
        private Siu_Admin_DBConector dbc = null;
        private Siu_ContainerLabel parameters;
        private ServletContext context;
        private Siu_Container usr;
        private Siu_Container Modules;
        private Siu_Container ModulesUser;

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
                String option       = (String)session.getValue("option");
                String user_login   =  request.getParameter("user_login");
                String sql          = "";
                String sqlModules = "";
                String sqlModulesUser = "";

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));
                dbc = new  Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                int column = 0;
                int row = 0;
                usr = new Siu_Container();
                Modules = new Siu_Container();
                ModulesUser = new Siu_Container();

                sql= "select * from "+
                                     "siu_admin_user"+
                             " where "+
                                     " user_login = '"+user_login+"'";


                 usr.removeElements();
                 Modules .removeElements();
                 ModulesUser.removeElements();

                 try
                 {
                      String datos[][]    =   dbc.hacerSelect(sql);
                      column              =   dbc.getColumna();
                      row                 =   dbc.getRenglon();

                      //System.out.println(datos.length+"  "+row) ;
                      //System.out.println("option = "+option);
                      if( datos.length == 0)
                      {
                             url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00037";
                      }
                      else
                      {
                          for (int k = 0; k < column; k++)
                          {

                              usr.setElement(datos[0][k]);
                              session.setAttribute("usr",usr);
                          }

                          if (option.equals("1"))
                          {
                                url =  "/jsp/administration/common/Siu_Admin_JspPerInfUser.jsp";
                          }
                          if (option.equals("2"))
                          {

                          	url =  "/jsp/administration/common/Siu_Admin_JspPassUser.jsp";
                          }
                          if (option.equals("3"))
                          {

                          	sqlModules= "select "+
                                                   "sam.mod_id,sal.label_number "+
                                            "from "+
                                                   "( siu_admin_module sam "+
                                            "inner join "+
                                                   "siu_admin_label sal "+
                                            "on "+
                                                   "sal.label_id=sam.label_id)";
                                                   

                                sqlModulesUser="select "+
                                                    "mod_id "+
                                                "from "+
                                                    "siu_admin_module_user "+
                                                "where "+
                                                     "user_login='"+user_login+"'";


                                String datosM[][]    =   dbc.hacerSelect(sqlModules);
                                String datosMU[][]    =   dbc.hacerSelect(sqlModulesUser);

                                Modules.setElement(datosM);
                                session.setAttribute("Modules",Modules);


                                /*
                                for (int k = 0; k < datosM.length; k++)
                                {
                                    System.out.println(datosM[k][0]);
                                }
                                */
                                String mu = "";
                                for (int k = 0; k < datosMU.length; k++)
                                {
                                    mu = mu + datosMU[k][0];
                                }
                                ModulesUser.setElement(mu);
                                session.setAttribute("ModulesUser",ModulesUser);

                                //System.out.println(mu);
                                //System.out.println(sqlModulesUser);

                          	url =  "/jsp/administration/common/Siu_Admin_JspProfileUser.jsp";
                          }
                          if(option.equals("4"))
                          {
                          	int r = 0;
                          	 sql = "";
                                 sql = "update siu_admin_user set user_status='1' where user_login='"+user_login+"'";
                                 r = dbc.hacerInsert(sql);
                                 if(r==0)
                                              url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00064";
                                 else
                                              url = "/jsp/administration/common/Siu_Admin_JspPassUpdateUser.jsp";

                          }
                          if(option.equals("5"))
                          {
                                  int r = 0;
                                  sql = "";
                                  sql = "update siu_admin_user set user_status='0' where user_login='"+user_login+"'";

                                  r = dbc.hacerInsert(sql);
                                  if(r==0)
                                              url = "/jsp/administration/error/Siu_Admin_JspError.jsp?error=00065";
                                  else
                                              url = "/jsp/administration/common/Siu_Admin_JspPassUpdateUser.jsp";
                          }

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

