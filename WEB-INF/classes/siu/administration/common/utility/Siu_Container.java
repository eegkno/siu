package siu.administration.common.utility;

import java.util.Vector;

public class Siu_Container
{
	private Vector vector = null;
	
	public Siu_Container()
	{
		this.vector = new Vector(0,1);
	}

	public int getSize()
	{
		return this.vector.size();
	}
	
	public void setElement(Object o)
	{
		this.vector.addElement(o);
	}
	
	public Object getElement(int index)
	{
		return this.vector.elementAt(index);
	}
	
	public void removeElements()
        {
               this.vector.removeAllElements();
        }

}
