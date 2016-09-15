package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Beer 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idbeer")
	private int id;
	@Column(name="beer_name")
	private String name;
	private int rating;
	
	//JOIN Type
	@OneToOne
	@JoinColumn(name="type_idtype")
	private Type type;
	
	//JOIN Taste
	@OneToOne
	@JoinColumn(name="taste_idtaste")
	private Taste taste;
	
	//JOIN Style
	@OneToOne
	@JoinColumn(name="style_idstyle")
	private Style style;
	
	//JOIN Brand
	@OneToOne
	@JoinColumn(name="brand_idbrand")
	private Brand brand;
	
	//JOIN User
	@ManyToMany(mappedBy="favorites")
	private List<User> users;
	
	// Gets and Sets
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public int getRating() 
	{
		return rating;
	}
	
	public void setRating(int rating) 
	{
		this.rating = rating;
	}
	
	public int getId() 
	{
		return id;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Taste getTaste() {
		return taste;
	}

	public void setTaste(Taste taste) {
		this.taste = taste;
	}

	public Style getStyle() {
		return style;
	}

	public void setStyle(Style style) {
		this.style = style;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	
}
