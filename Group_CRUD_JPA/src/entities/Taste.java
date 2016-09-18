package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Taste 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idtaste")
	private int id;
	@Column(name="taste_name")
	private String name;
	
	
	// Gets and Sets
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}

	public int getId() 
	{
		return id;
	}
}
