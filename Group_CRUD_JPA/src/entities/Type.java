package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Type 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idtype")
	private int id;
	@Column(name="type_name")
	private String name;
	@Column(name="type_desc")
	private String description;
	
	
	// Gets and Sets
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getDescription() 
	{
		return description;
	}
	
	public void setDescription(String description) 
	{
		this.description = description;
	}
	
	public int getId() 
	{
		return id;
	}
}
