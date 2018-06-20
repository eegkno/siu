package siu.students.business;
import siu.administration.common.database.Siu_Admin_DBConector;
import java.sql.*;
import java.io.*;
import java.util.*;
import siu.administration.common.utility.Siu_Container;

public class Siu_Stat_Utility
{


       public static Siu_Container getMeses(Siu_Admin_DBConector c,int op,String semestre){

              
               Siu_Container v = new Siu_Container();
               String tabla[][] = null;
               String sql = "";
               try
               {
               	  System.out.println("---- en getMeses----"+" "+op+"  "+semestre);
                  //Siu_Admin_DBConector c = new Siu_Admin_DBConector("org.postgresql.Driver","jdbc:postgresql://127.0.0.1:5432/","siu","postgres","hola123");

                  if(op == 1){
                         System.out.println("opcion 1");    	
                        tabla = c.hacerSelect("select sem_start,sem_finish from siu_statistics_semester where sem_enable=\'true\'");
                  }
                  else{
                      sql = "select sem_start,sem_finish from siu_statistics_semester where sem_name=\'"+semestre+"\'";
                       System.out.println("opcion 2"+"   "+sql);

                       tabla = c.hacerSelect(sql);
                       System.out.println("antes "+tabla.length+"   "+tabla[0].length);
                  }
                  System.out.println("desp "+tabla.length+"   "+tabla[0].length);
                  //System.out.println("fecha inicial = "+tabla[0][0]+", fecha final = "+tabla[0][1]);
                  String[] mi =tabla[0][0].split("-");
                  String[] mf =tabla[0][1].split("-");

                  System.out.println("mes inicial = "+mi[1]);
                  System.out.println("mes final = "+mf[1]);

                  int mesi = Integer.parseInt(mi[1]);
                  int mesf = Integer.parseInt(mf[1])+1;
                  int mes = 12;
                  Calendar cal = Calendar.getInstance();
                  int mesActual= cal.get(Calendar.MONTH)+2;
                  System.out.println("mesActual = "+mesActual);



                  while(mesi != mesf && mesi != mesActual)
                  {


                     if(mesi == 1)
                     {
                             System.out.println("mes  de Enero");
                             v.setElement("00104");
                     }
                     if(mesi == 2)
                     {
                             System.out.println("mes  de Febrero");
                             v.setElement("00105");
                     }
                     if(mesi == 3)
                     {
                             System.out.println("mes  de Marzo");
                             v.setElement("00106");
                     }
                     if(mesi == 4)
                     {
                             System.out.println("mes  de Abril");
                             v.setElement("00107");
                     }
                     if(mesi == 5)
                     {
                             System.out.println("mes  de Mayo");
                             v.setElement("00108");
                     }
                     if(mesi == 6)
                     {
                             System.out.println("mes  de Junio");
                             v.setElement("00109");
                     }
                     if(mesi == 7)
                     {
                             System.out.println("mes  de Julio");
                             v.setElement("00110");
                     }
                     if(mesi == 8)
                     {
                             System.out.println("mes  de Agosto");
                             v.setElement("00111");
                     }
                     if(mesi == 9)
                     {
                             System.out.println("mes  de Septiembre");
                             v.setElement("00112");
                     }
                     if(mesi == 10)
                     {
                             System.out.println("mes  de Octubre");
                             v.setElement("00113");
                     }
                     if(mesi == 11)
                     {
                             System.out.println("mes  de Noviembre");
                             v.setElement("00114");
                     }
                     if(mesi == 12)
                     {
                             System.out.println("mes  de Diciembre");
                             v.setElement("00115");
                     }
                     mesi ++;
                     
                     if( mesi != mesf  && mesi > 12 )
                     mesi=1;

                  }



                  System.out.println("v.getSize(); = "+v.getSize());
                  //System.out.println("mes final = "+mesf);
                  c.close();


               }
               catch(Exception e)
               {
                  System.out.println("Error:"+e);
               }
               return v;
       }


        //Metodo para reemplazar cadenas
          public static String reemplazar(String scadena,String old, String reemplazo){
              String scheca = new String(scadena);
              int ilongitud=old.length();
              int icheca=-1;
              icheca=scheca.indexOf(old);
              if(icheca != -1)
                  scadena=scadena.substring(0,icheca)+reemplazo+scadena.substring(icheca+ilongitud);
              return scadena;
          }//Metodo reemplazar 

          public static String dameMes(String mes){
               //mes=mes.toLowerCase();
               String imes="";

                 if(mes.equals("00104"))
                   imes="1";
                 if(mes.equals("00105"))
                   imes="2";
                 if(mes.equals("00106"))
                   imes="3";
                 if(mes.equals("00107"))
                   imes="4";
                 if(mes.equals("00108"))
                   imes="5";
                 if(mes.equals("00109"))
                   imes="6";
                 if(mes.equals("00110"))
                   imes="7";
                 if(mes.equals("00111"))
                   imes="8";
                 if(mes.equals("00112"))
                   imes="9";
                 if(mes.equals("00113"))
                   imes="10";
                 if(mes.equals("00114"))
                   imes="11";
                 if(mes.equals("00115"))
                   imes="12";
                 return imes;
               }



       public static void main(String args[]){
             //  Siu_Stat_Utility.getMeses();

       }


}
