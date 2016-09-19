package entities;

import java.util.ArrayList;
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
	private String url;
	
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
	
	//JOIN User To See Which Users Have Favorited This Beer
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	//Add/Remove
	public void addUser(User user) 
	{
		if (users == null) {
			users = new ArrayList<>();
		}
		if (!users.contains(user)) {
			users.add(user);
			user.addBeer(this);
		}
	}

	public void removeUser(User user) 
	{
		if (users != null && users.contains(user)) 
		{
			users.remove(user);
			user.removeBeer(this);
		}
	}
	
}
