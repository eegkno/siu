package siu.administration.common.database;
import java.sql.*;
import java.io.*;
import java.util.*;
import siu.students.business.*;

public class Siu_Admin_DBConector
{

        public String s;
        private Connection conn;
        private Statement sqlStatement;
        private ResultSet rs;
        private ResultSetMetaData rsmd;
        private int reng=0;
        private int icolumna;
        private static Statement stm = null;
        private int rowsAffected = 0;

        public Siu_Admin_DBConector(String className,String ip,String base,String susuario,String spass)
        {
              try
              {
                  Class.forName(className);
                  conn = DriverManager.getConnection(ip+base+"?user="+susuario+"&password="+spass);
              }
              catch(Exception e)
              {
                  System.out.println("Error:"+e.getMessage());
              }
        }

        public void ponerColumna(int ic)
        {
              icolumna=ic;
        }

        public int getColumna()
        {
              return icolumna;
        }

        public int getRenglon()
        {
              return reng;
        }

        public String[][] hacerSelect(String ssql) throws SQLException
        {
            String tabla[][];
            try
            {
               sqlStatement = conn.createStatement();
               //Realizar los renglones totales:
               int itemp=ssql.lastIndexOf("from");
               System.out.println("ITEMP:"+itemp);
               String stemp=ssql.substring(itemp+5,ssql.length() );
               String sql1 = "select count(*) from "+stemp;
               ResultSet rs1 = sqlStatement.executeQuery(sql1);
               int scontador=0;
               while(rs1.next())
                       scontador=rs1.getInt(1);
               //reng=(new Integer(scontador).intValue());
               reng = scontador;
               rs1.close();
               //Empieza el llenado del arreglo
               String sql = ssql;
               rs = sqlStatement.executeQuery(sql);
               rsmd = rs.getMetaData();
               int icolumnas=rsmd.getColumnCount();
               ponerColumna(icolumnas);
               int irenglon=0;
               tabla = new String[reng][icolumnas];

               while(rs.next())
               {
                   for(int i=1;i<=icolumnas;i++)
                       tabla[irenglon][i-1]=""+rs.getObject(i);
                   irenglon++;
               }

               System.out.println("RENGLONES = "+ irenglon +" "+"COLUMNAS = "+icolumnas);
            }
            catch(SQLException e)
            {
                String error=""+e.getMessage();
                tabla = new String[1][1];
                tabla[0][0]="error"+e;
            }
            catch(NullPointerException e)
            {
                String error=""+e.getMessage();
                tabla = new String[1][1];
                tabla[0][0]="error"+e;
            }
            return tabla;
          }

        public String[][] hacerSelectEd(String ssql) throws SQLException
        {
            String tabla[][];
            try
            {
            	System.out.println("ssql = "+ssql);

               sqlStatement = conn.createStatement();
               //Empieza el llenado del arreglo
               String sql = ssql;
               rs = sqlStatement.executeQuery(sql);
               rsmd = rs.getMetaData();
               int icolumnas=rsmd.getColumnCount();
               ponerColumna(icolumnas);
               int irenglon=0;
               tabla = new String[reng][icolumnas];

               while(rs.next())
               {
                   for(int i=1;i<=icolumnas;i++)
                       tabla[irenglon][i-1]=""+rs.getObject(i);
                   irenglon++;
               }

               System.out.println("RENGLONES = "+ irenglon +" "+"COLUMNAS = "+icolumnas);
            }
            catch(SQLException e)
            {
                System.out.println("Error en select : "+e);
                tabla = new String[1][1];
                tabla[0][0]="-------"+e;

            }
            catch(NullPointerException e)
            {
                System.out.println("Error en select : "+e);
                tabla = new String[1][1];
                tabla[0][0]="--------"+e;

            }
            return tabla;
          }


         public int cuentaRenglones(String columnas, int totalColumnas, String condiciones) throws SQLException
         {
            int reng = 0;
            sqlStatement = conn.createStatement();
            String sql = "select "+columnas+" from " + condiciones;
            rs = sqlStatement.executeQuery(sql);
            while (rs.next())
                reng++;
            return reng;
          }

          public void close()
          {
               try
               {
                  conn.close();
               }
               catch(SQLException e)
               {
               }
         }

        public int hacerInsert(String sql) throws SQLException
	{
		System.out.println(sql);
	        try
                {
                        stm = conn.createStatement();
        		rowsAffected = stm.executeUpdate(sql);
        	}
                catch(Exception e)
                {
                       System.out.println("--------------------------------------------------------------------------");
                       System.out.println("EXCEPTION GENERADA");
                       System.out.println(e.toString());
                       System.out.println("--------------------------------------------------------------------------");
                       //System.out.println("Error:"+e.getMessage());
                }
		return rowsAffected;
	 }


      public Vector GeneraVector(String sql,String columna){

              PreparedStatement pstm1=null;
              ResultSet res1=null;
              Vector vector = new Vector();
              
              System.out.println("En genera vector "+sql);


              try {
                       pstm1=conn.prepareStatement(sql);
                       res1=pstm1.executeQuery();
            
                         while(res1.next()){
                             vector.addElement(res1.getString(Integer.parseInt(columna)));
                         }

                         for (int j=0;j<=vector.size()-1;j++){
                            System.out.println("Elemento"+j+ "  :  "+vector.get(j));
                         }

                         conn.close();
              }
              catch(Exception e) {
               System.out.println("Error:"+e.getMessage());
              }

              return vector;
        }


        public int Contador(String columnas) {
              int reng = 0;
              ResultSet rs1;
              try{

                        Statement sqlS = conn.createStatement();
                        rs1 = sqlS.executeQuery(columnas);
                        while (rs1.next())
                                reng++;
                                
                                
                        conn.close();
                   }
              catch(Exception e) {
                  System.out.println("Error:"+e.getMessage());
              }
      
                 return reng;
          }



public Vector Fecha(String sqlf){

           PreparedStatement pstm2=null;
           ResultSet res2=null;
           Vector vf = new Vector(0,1);

        try {
             pstm2=conn.prepareStatement(sqlf);
             res2=pstm2.executeQuery();

               while(res2.next()){

                   switch(Integer.parseInt(res2.getString(1))){
                        case 1:
                        vf.addElement("00104");
                        break;
                        case 2:
                        vf.addElement("00105");
                        break;
                        case 3:
                        vf.addElement("00106");
                        break;
                        case 4:
                        vf.addElement("00107");
                        break;
                        case 5:
                        vf.addElement("00108");
                        break;
                        case 6:
                        vf.addElement("00109");
                        break;
                        case 7:
                        vf.addElement("00110");
                        break;
                        case 8:
                        vf.addElement("00111");
                        break;
                        case 9:
                        vf.addElement("00112");
                        break;
                        case 10:
                        vf.addElement("00113");
                        break;
                        case 11:
                        vf.addElement("00114");
                        break;
                        case 12:
                        vf.addElement("00115");
                        break;
 			}
		}

               for (int j=0;j<=vf.size()-1;j++){
                  System.out.println("Elemento"+j+ "  :  "+vf.get(j));
               }

//            conn.close();
        }
        catch(Exception e) {
             System.out.println("Error:"+e.getMessage());
        }

           return vf;
        }





         public static void main(String args[])
         {
               try
               {
                  Siu_Admin_DBConector c = new Siu_Admin_DBConector("org.postgresql.Driver","jdbc:postgresql://127.0.0.1:5432/","siu","postgres","hola123");
                  String tabla[][] = c.hacerSelect(args[0]);
                 // c.hacerSelect(args[0]);
                  //Siu_Stat_Utility.getMeses(c,2,"2004-1");

                  for(int i=0;i<c.reng;i++)
                  {
                      for(int j=0;j<(c.getColumna());j++)
                        System.out.println(""+tabla[i][j]);
                  }
                  


                  c.close();
               }
               catch(Exception e)
               {
                  System.out.println("Error:"+e);
               }
         }

}
