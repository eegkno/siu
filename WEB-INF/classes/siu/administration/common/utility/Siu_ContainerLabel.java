package siu.administration.common.utility;

import java.util.Hashtable;

public class Siu_ContainerLabel
{
	private Hashtable ht = null;

	public Siu_ContainerLabel()
	{
		this.ht = new Hashtable();
	}

	public int getSize()
	{
		return this.ht.size();
	}
	
	public void setElement(Object ok,Object o)
	{
		this.ht.put(ok,o);
	}
	
	public Object getElement(Object ok)
	{
		return this.ht.get(ok);
	}
}
