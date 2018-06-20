package siu.administration.common.database;
import java.io.InputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import javax.servlet.*;

import siu.administration.common.utility.Siu_ContainerLabel;


public class Siu_Admin_DBContextFile implements ServletContextListener
{
    //ArrayList parameters;
    Siu_ContainerLabel parameters;
    Siu_ContainerLabel querys;
    String line = "";
    String arrayParameters[];
    String arrayDates[];
    String file="";
    String fileQ="" ;


    public Siu_Admin_DBContextFile()
    {
        parameters = new Siu_ContainerLabel();
        querys = new Siu_ContainerLabel();
    }

    public void contextInitialized(ServletContextEvent servletcontextevent)
    {
        ServletContext servletcontext = servletcontextevent.getServletContext();
        servletcontext.log(" ++++++++++  Loadind database parameters +++++++++ ");
        file = servletcontext.getInitParameter("DBParameters");
        servletcontext.log("***********" + "File = " + file + "***********");
        fileQ = servletcontext.getInitParameter("datos");
        servletcontext.log("***********" + "File = " + fileQ + "***********");

        try
        {
            InputStream inputstream = servletcontext.getResourceAsStream(file);
            BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(inputstream));
            do
            {
                line = bufferedreader.readLine();
                if(line != null)
                {
                    servletcontext.log(line);
                    arrayParameters = line.split("=");
                    parameters.setElement(new String(arrayParameters[0]), new String (arrayParameters[1]));
                }
            } while(line != null);
            bufferedreader.close();
            
            line="";
            InputStream inputstream1 = servletcontext.getResourceAsStream(fileQ);
            BufferedReader bufferedreader1 = new BufferedReader(new InputStreamReader(inputstream1));
            do
            {
                line = bufferedreader1.readLine();
                if(line != null)
                {
                    servletcontext.log(line);
                    arrayDates = line.split("#");
                    //System.out.println(arrayDates[0]+" "+arrayDates[1]);
                    querys.setElement(new String(arrayDates[0]), new String (arrayDates[1]));
                }
            } while(line != null);
            bufferedreader1.close();

            //System.out.println("parameters context"+parameters.getElement(new String("IpDataBase")));
            servletcontext.setAttribute("parameters", parameters);
            servletcontext.setAttribute("querys", querys);
            servletcontext.log(" The file is loading the database parameters");
            servletcontext.log(" The file is loading the database querys");
        }
        catch(Exception exception)
        {
            servletcontext.log("Excepcion en Siu_Admin_DBContextFile ");
            exception.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent servletcontextevent)
    {
    }


}
