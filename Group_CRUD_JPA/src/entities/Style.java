package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Style 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idstyle")
	private int id;
	@Column(name="style_name")
	private String name;
	@Column(name="style_desc")
	private String desc;
	
	
	// Gets and Sets
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getDesc() 
	{
		return desc;
	}
	
	public void setDesc(String desc) 
	{
		this.desc = desc;
	}
	
	public int getId() 
	{
		return id;
	}
}
