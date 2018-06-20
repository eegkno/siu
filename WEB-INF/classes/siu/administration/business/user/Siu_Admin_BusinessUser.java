
package siu.administration.business.user;

import java.sql.*;
import siu.administration.common.database.Siu_Admin_DBConector;
import siu.administration.common.utility.Siu_Container;
import siu.administration.common.utility.Siu_ContainerLabel;
import siu.administration.business.exception.UserNotFoundException;
import siu.administration.business.exception.SessionException;
import siu.administration.business.exception.NoPermissionException;
import siu.administration.business.exception.PasswordException;

public class Siu_Admin_BusinessUser
{

       private Siu_Admin_DBConector conn;
       private Siu_Container user;

       public Siu_ContainerLabel Param()
       {
                Siu_ContainerLabel param = new Siu_ContainerLabel();
                String classForName="org.postgresql.Driver";
                String IpDataBase = "jdbc:postgresql://127.0.0.1:5432/";
                String dataBase   = "siu";
                String User       = "postgres";
                String Password   = "postgres";

                param.setElement("IpDataBase",IpDataBase);
                param.setElement("dataBase",dataBase);
                param.setElement("User",User);
                param.setElement("Password",Password);

                return  param;
       }


       public  Siu_Container validateUserAuth(Siu_ContainerLabel parameters, Siu_Container us)
       {
                user = new Siu_Container();
                /*
                   La variable error puede tener asociados los siguientes valores
                   0 - No hay error en los datos del usuario
                   1 - No existe el usuario
                   2 - Existe el usuario pero no tiene permisos para ingresar al modulo de administracion
                   3 - Existe el usuario, tiene permisos para el modulo de administracion, pero ya existe una sesion en el siu con el mismo login
                   4 - Existe el usuario, pero el password es incorrecto
                   5 - Usuario deshabilitado
                */
                String error      =    "0";
                String classForName =   (String)parameters.getElement(new String("classForName"));
                String IpDataBase =   (String)parameters.getElement(new String("IpDataBase"));
                String dataBase   =   (String)parameters.getElement(new String("dataBase"));
                String User       =   (String)parameters.getElement(new String("User"));
                String Password   =   (String)parameters.getElement(new String("Password"));
                String login      =   (String)us.getElement(0);
                String pass       =   (String)us.getElement(1);
                String sqlUser    =    " select "+
                                                "user_name,user_firstName,user_lastName,user_login,user_password,user_status"+
                                        " from "+
                                               " siu_admin_user "+
                                        " where "+
                                                "user_login = \'"+login+"\'";

                String sqlModule  = " select "+
                                           "sal.label_number,sam.mod_link "+
                                    " from "+
                                            "(( siu_admin_module_user samu "+
                                    " inner join "+
                                            " siu_admin_module sam "+
                                    " on "+
                                            " sam.mod_id=samu.mod_id and samu.user_login=\'"+login+"\' and sam. mod_status=\'1\' and sam.mod_name!=\'Administracion\')"+ 
                                    " inner join "+
                                            " siu_admin_label sal on sal.label_id = sam.label_id)";

                String sqlSession =   " select "+
                                               "uses_session"+
                                      " from "+
                                               " siu_admin_usersession "+
                                      " where "+
                                               "user_login=\'"+login+"\'";


       	        try
                {
                      conn = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      String tUser[][] = conn.hacerSelect(sqlUser);
                      int irow = conn.getRenglon();
                      int icolum = conn.getColumna();

                      if(irow != 0)
                      {
                            for (int i = 0; i < icolum; i++)
                            {
                            	     //System.out.println(i+" "+tUser[0][i]);
                            	     user.setElement(new String(tUser[0][i]));
                            }
                            if(pass.equals(tUser[0][4]))
                            {
                                  String tUserModule[][] = conn.hacerSelect(sqlModule);
                                  irow = conn.getRenglon();
                                  if (irow != 0)
                                  {
                                           String tUserSession[][] = conn.hacerSelect(sqlSession);
                                           irow = conn.getRenglon();
                                           if(irow == 0)
                                           {
                                                  System.out.println("El usuario tiene  acceso a modulos ");
                                                  if(tUser[0][5].equals("false"))
                                                  {
                                                    error = "5";
                                                    user.setElement(error);
                                                    throw new NoPermissionException( "El usuario no esta habilitado");
                                                  }
                                                  else
                                                  {
                                                    error = "0";
                                                    user.setElement(error);
                                                    user.setElement(tUserModule);
                                                  }
                                           }
                                           else
                                           {
                                             //System.out.println("Hay un usuario dentro del sistema con el mismo login");
                                             error = "3";
                                             user.setElement(error);
                                             throw new SessionException( "Hay un usuario dentro del sistema con el mismo login");
                                           }
                                   }
                                   else
                                   {
                                           //System.out.println("El usuario no tiene acceso al Modulo de administracion");
                                           error = "2";
                                           user.setElement(error);
                                           throw new NoPermissionException( "El usuario no tiene modulos asignados");
                                   }

                            }
                            else
                            {
                                  error = "4";
                                  user.setElement(error);
                                  throw new PasswordException( "El password del usuario es incorrecto");
                            }
                      }
                      else
                      {
                            System.out.println("No existe el usuario");
                            error = "1";
                            for (int i = 0; i < icolum; i++)
                            {
                            	     //System.out.println(i+" "+tUser[0][i]);
                            	     user.setElement("-----");
                            }
                            user.setElement(error);
                            throw new UserNotFoundException( "No existe el usuario");
                      }

                }
                catch(Exception e)
                {
                       System.out.println("--------------------------------------------------------------------------");
                       System.out.println("EXCEPTION GENERADA");
                       System.out.println(e.toString());
                       System.out.println("--------------------------------------------------------------------------");
                       //System.out.println("Error:"+e.getMessage());
                }

          return user;
       }




       public  Siu_Container validateUser(Siu_ContainerLabel parameters, Siu_Container us)
       {
                user = new Siu_Container();
                /*
                   La variable error puede tener asociados los siguientes valores
                   0 - No hay error en los datos del usuario, tiene acceso al modulo de administracion y no tiene otra sesion iniciada
                   1 - No existe el usuario
                   2 - Existe el usuario pero no tiene permisos para ingresar al modulo de administracion
                   3 - Existe el usuario, tiene permisos para el modulo de administracion, pero ya existe una sesion en el siu con el mismo login
                   4 - Existe el usuario, pero el password es incorrecto
                */
                String error      =    "0";
                String classForName =   (String)parameters.getElement(new String("classForName"));
                String IpDataBase =   (String)parameters.getElement(new String("IpDataBase"));
                String dataBase   =   (String)parameters.getElement(new String("dataBase"));
                String User       =   (String)parameters.getElement(new String("User"));
                String Password   =   (String)parameters.getElement(new String("Password"));
                String login      =   (String)us.getElement(0);
                String pass       =   (String)us.getElement(1);
                String sqlUser    =    " select "+
                                              "user_name,user_firstName,user_lastName,user_login,user_password,user_status"+
                                       " from "+
                                              " siu_admin_user "+
                                       " where "+
                                              "user_login = \'"+login+"\'";

                String sqlModule  =   " select "+
                                               "mod_id"+
                                      " from "+
                                               " siu_admin_module_user "+
                                      " where "+
                                               "mod_id='1' and user_login=\'"+login+"\'";
                                            
                // select mod_id from siu_admin_module_user where mod_id='1' and user_login='admin'; 

                String sqlSession =   " select "+
                                               "uses_session"+
                                      " from "+
                                               " siu_admin_usersession "+
                                      " where "+
                                               "user_login=\'"+login+"\'";



       	        try
                {
                      conn = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                      String tUser[][] = conn.hacerSelect(sqlUser);
                      int irow = conn.getRenglon();
                      int icolum = conn.getColumna();
                      if (irow != 0)
                      {
                            for (int i = 0; i < icolum; i++)
                            {
                            	     //System.out.println(i+" "+tUser[0][i]);
                            	     user.setElement(new String(tUser[0][i]));
                            }
                            if(pass.equals(tUser[0][4]))
                            {
                                  String tUserModule[][] = conn.hacerSelect(sqlModule);
                                  irow = conn.getRenglon();
                                  if (irow != 0)
                                  {
                                           String tUserSession[][] = conn.hacerSelect(sqlSession);
                                           irow = conn.getRenglon();
                                           if(irow == 0)
                                           {
                                           	if(tUser[0][5].equals("false"))
                                                  {
                                                    error = "5";
                                                    user.setElement(error);
                                                    throw new NoPermissionException( "El usuario no esta habilitado");
                                                  }
                                                  else
                                                  {
                                                    System.out.println("El usuario tiene total acceso al modulo de administracion");
                                                    error = "0";
                                                    user.setElement(error);
                                                  }
                                           }
                                           else
                                           {
                                                  //System.out.println("Hay un usuario dentro del sistema con el mismo login");
                                                  error = "3";
                                                  user.setElement(error);
                                                  throw new SessionException( "Hay un usuario dentro del sistema con el mismo login");
                                           }

                                  }
                                  else
                                  {
                                           //System.out.println("El usuario no tiene acceso al Modulo de administracion");
                                           error = "2";
                                           user.setElement(error);
                                           throw new NoPermissionException( "El usuario no tiene acceso al Modulo de administracion");
                                  }
                            }
                            else
                            {
                                  //System.out.println("El password del usuario es incorrecto");
                                  error = "4";
                                  user.setElement(error);
                                  throw new PasswordException( "El password del usuario es incorrecto");
                            }
                      }
                      else
                      {
                            System.out.println("No existe el usuario");
                            error = "1";
                            for (int i = 0; i < icolum; i++)
                            {
                            	     //System.out.println(i+" "+tUser[0][i]);
                            	     user.setElement("-----");
                            }
                            user.setElement(error);
                            throw new UserNotFoundException( "No existe el usuario");
                      }
                      conn.close();
                }
                catch(Exception e)
                {
                       System.out.println("--------------------------------------------------------------------------");
                       System.out.println("EXCEPTION GENERADA");
                       System.out.println(e.toString());
                       System.out.println("--------------------------------------------------------------------------");
                       //System.out.println("Error:"+e.getMessage());
                }
                return user;

       }

       public String createLoginUser(String user_name,String user_firstName,String user_lastName)
       {
              user_name      = user_name.trim().substring(0, 2);
              user_firstName = user_firstName.trim().substring(0, 2);
              user_lastName  = user_lastName.trim().substring(0, 2);
              String login = user_name+user_firstName+user_lastName;

              return login;
       }

       public static void main(String args[])
       {
              Siu_Admin_BusinessUser sabu = new Siu_Admin_BusinessUser();
              //sabu.Param();
              //Siu_Container usuario = new Siu_Container();
              //usuario.setElement("admin");
              //usuario.setElement("1dm3");
              //System.out.println(sabu.validateUser(sabu.Param(),usuario).getSize());
              System.out.println(sabu.createLoginUser(" edgar eduardo","  garcia cano","castillo  "));
       }

}
