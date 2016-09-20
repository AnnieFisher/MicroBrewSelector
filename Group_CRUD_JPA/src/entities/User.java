package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class User 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="iduser")
	private int id;
	private String username;
	private String password;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	private String city;
	private String state;
	
	//JOIN Beer to Add to User Favorites List
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "beer_user", joinColumns = @JoinColumn(name = "user_iduser"), 
				inverseJoinColumns = @JoinColumn(name = "beer_idbeer"))
	private List<Beer> favorites;

	
	// Gets and Sets
	public String getUsername() 
	{
		return username;
	}

	public void setUsername(String username) 
	{
		this.username = username;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getFirstName() 
	{
		return firstName;
	}

	public void setFirstName(String firstName) 
	{
		this.firstName = firstName;
	}

	public String getLastName() 
	{
		return lastName;
	}

	public void setLastName(String lastName) 
	{
		this.lastName = lastName;
	}

	public String getCity() 
	{
		return city;
	}

	public void setCity(String city) 
	{
		this.city = city;
	}

	public String getState() 
	{
		return state;
	}

	public void setState(String state) 
	{
		this.state = state;
	}

	public List<Beer> getFavorites() 
	{
		return favorites;
	}

	public void setFavorites(List<Beer> favorites) 
	{
		this.favorites = favorites;
	}

	public int getId() 
	{
		return id;
	}
	
	
	//Add/Remove
	public void addBeer(Beer beer) 
	{
		if (favorites == null) {
			favorites = new ArrayList<>();
		}
		if (!favorites.contains(beer)) {
			favorites.add(beer);
			beer.addUser(this);
		}
	}

	public void removeBeer(Beer beer) 
	{
		if (favorites != null && favorites.contains(beer)) 
		{
			favorites.remove(beer);
			beer.removeUser(this);
		}
	}
}
