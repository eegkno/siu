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
import java.util.*;
import siu.students.business.*;


public class Siu_Stat_ServletSetGraphic extends HttpServlet
{
        // this object contain the result of invocate the method validateUser

        private Siu_Admin_DBConector stat;
        private ServletContext context;
        private Siu_ContainerLabel parameters;
        private Siu_Container graphics;

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

                System.out.println("option en Siu_Stat_ServletSetGraphic = "+option);

                graphics = new  Siu_Container();

                String classForName =  (String)parameters.getElement(new String("classForName"));
                String IpDataBase =  (String)parameters.getElement(new String("IpDataBase"));
                String dataBase =    (String)parameters.getElement(new String("dataBase"));
                String User =        (String)parameters.getElement(new String("User"));
                String Password =    (String)parameters.getElement(new String("Password"));


                //si la opcion es 1, se obienen graficas por semestre



                try
                {
                   stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);


                if(Integer.parseInt(option)==1)
                {
                    String semestre =  request.getParameter("semestre");

                    String[] s = semestre.split("-");
                    
                    String sem = s[0].substring(3,4);
                    
                    sem = sem+s[1];
                    
                    System.out.println("sem"+sem);
                    



                    //para sacar estadisticas por semestre
                    String sql1 = "select sem_numero,sem_nombre from siu_stud_semestre where sem_numero < 12 order by sem_numero";
                    String sql2 = "select c.acc_login from (siu_stud_semestre s inner join  siu_stud_account c on c.sem_numero=s.sem_numero) where s.sem_nombre='SEMESTRE' and c.acc_accounttype like'%"+sem+"%'";

                     Vector ve=stat.GeneraVector(sql1,"2");

                     String[] leyenda=new String[ve.size()];
                     double[] promedio=new double[ve.size()];
                     String query = "";


                      for (int j=0;j<ve.size();j++)
                      {
                      	stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                    	leyenda[j]=(String)ve.get(j);
                            query=  Siu_Stat_Utility.reemplazar(sql2,"SEMESTRE",leyenda[j]);
                            //System.out.println("query["+j+"] = "+query);
                    	promedio[j]=stat.Contador(query);
                      }

                      for (int j=0;j<ve.size();j++)
                      {
                    	System.out.println("leyenda["+j+"] = "+leyenda[j]+"       "+"promedio["+j+"] = "+promedio[j]);
                      }


                      graphics.removeElements();
                      graphics.setElement(getTitulos(leyenda,ve.size()));
                      graphics.setElement(promedio);
                      graphics.setElement("1");
                }
                else if(Integer.parseInt(option)==2){


                           String semestre =  request.getParameter("semestre");

                    String[] s = semestre.split("-");
                    
                    String sem = s[0].substring(3,4);
                    
                    sem = sem+s[1];
                    
                    System.out.println("sem"+sem);


                           String sql="select * from siu_stud_profession order by 1";
                           String sql2="select c.acc_login from ( siu_stud_account c inner join siu_stud_profession ca on ca.prof_id=c.prof_id ) where ca.prof_name='CARRERA' and c.acc_accounttype like'%"+sem+"%'";

                           Vector ve=stat.GeneraVector(sql,"2");
                           String[] leyenda=new String[ve.size()];
                           double[] promedio=new double[ve.size()];




                            for (int j=0;j<ve.size();j++)
                            {
                              stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                              leyenda[j]=(String)ve.get(j);
                              promedio[j]=stat.Contador(Siu_Stat_Utility.reemplazar(sql2,"CARRERA",leyenda[j]));
                            }
                            graphics.removeElements();
                            graphics.setElement(getTitulos(leyenda,ve.size()));
                            graphics.setElement(promedio);
                            graphics.setElement("2");
                }
                else if(Integer.parseInt(option)==3){

                           graphics.removeElements();

                           String semestre =  request.getParameter("semestre");
                           //1er select
                           String[][] tabla = stat.hacerSelect("select sem_start,sem_finish from siu_statistics_semester where sem_name=\'"+semestre+"\'");

                           
                           String sql = "select count(*) from siu_stud_statistics where stat_date > \'"+tabla[0][0]+"\' and stat_date < \'"+tabla[0][1]+"\' group by extract(month from stat_date) order by extract(month from stat_date)";
                           String sql2 = "select distinct extract(month from stat_date),extract(year from stat_date) from siu_stud_statistics where stat_date > \'"+tabla[0][0]+"\' and stat_date < \'"+tabla[0][1]+"\' order by extract(year from stat_date), 1 ";

                           System.out.println( "   sql = "+sql);
                           System.out.println( "   sql2 = "+sql2);

                           //preparando el select de los meses
                           stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                           Vector ve=stat.Fecha(sql2);

                           

                           //peraparandpo el select de #
                           stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                           Vector ve2 =  stat.GeneraVector(sql,"1");
                           String[] leyenda=new String[ve.size()];
                           double[] promedio=new double[ve2.size()];

                           for (int j=0;j<ve2.size();j++)
                            {
                              leyenda[j]=(String)ve.get(j);
			      System.out.println("++++++++"+leyenda[j]);
                              promedio[j]=Double.parseDouble((String)ve2.get(j));
                            }

                           Siu_ContainerLabel labels = (Siu_ContainerLabel)session.getAttribute("labels");
                           
                           System.out.println("labels :"+labels.getSize());
                           graphics.removeElements();
                           graphics.setElement(getTitulos(leyenda,ve.size(),labels));
                           graphics.setElement(promedio);
                           graphics.setElement("3");

                }
                else {
                          graphics.removeElements();

                          String mes =  request.getParameter("mes");
                          System.out.println("MES: "+mes);
                          String imes = Siu_Stat_Utility.dameMes(mes);

                          System.out.println("imes: "+imes);

                          String sql2="select extract(year from sem_start) from siu_statistics_semester where sem_enable=\'true\' " ;
                          System.out.println("sql2: "+sql2);
                          String[][] tabla = stat.hacerSelect(sql2);
                          
                          String anio = (tabla[0][0]).substring(0,4);
                          System.out.println("anio: "+anio);

                          String sql ="select count(*),extract(day from stat_date)   from siu_stud_statistics where extract(month from stat_date)=\'"+imes+
                          "\' and extract(year from stat_date) = \'"+anio+"\' group by extract(day from stat_date) order by extract(day from stat_date)";



                          System.out.println("sql: "+sql);

                          stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                          Vector ve=stat.GeneraVector(sql,"1");
                          
                          stat = new Siu_Admin_DBConector(classForName,IpDataBase,dataBase,User,Password);
                          Vector ve2=stat.GeneraVector(sql,"2");

                          String[] leyenda=new String[ve.size()];
                          double[] promedio=new double[ve.size()];

                          for (int j=0;j<ve.size();j++)
                          {
                            leyenda[j]=(String)ve2.get(j);
                            promedio[j]=Double.parseDouble((String)ve.get(j));
                          }

                          System.out.println("leyenda: "+leyenda.length+"   promedio: "+promedio.length);

                           graphics.setElement(getTitulos(leyenda,ve.size()));
                           graphics.setElement(promedio);
                           graphics.setElement("4");

                }

                }
                catch(Exception e)
                {
                       System.out.println("Error:"+e.getMessage());
                }
                
                request.setAttribute("graphics",graphics);


                url = "/jsp/statistics/common/Siu_Stat_JspGetGraphics.jsp";
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request,response);

        }

        public static String getTitulos( String leyenda[],int tamano,Siu_ContainerLabel scl  )
        {
               String leyendaS = "";

                for (int j=0;j<tamano;j++)
                {

              	//System.out.println("leyenda["+j+"] = "+leyenda[j]+"       "+"promedio["+j+"] = "+promedio[j]);
                      if(j < tamano-1)
                           leyendaS=leyendaS+scl.getElement(leyenda[j])+",";
                      else
                          leyendaS=leyendaS+scl.getElement(leyenda[j]);

                }

                return  leyendaS;

        }

        public static String getTitulos(String leyenda[],int tamano)
        {
               String leyendaS = "";

                for (int j=0;j<tamano;j++)
                {

              	//System.out.println("leyenda["+j+"] = "+leyenda[j]+"       "+"promedio["+j+"] = "+promedio[j]);
                      if(j < tamano-1)
                           leyendaS=leyendaS+leyenda[j]+",";
                      else
                          leyendaS=leyendaS+leyenda[j];

                }
                return  leyendaS;

        }
}

