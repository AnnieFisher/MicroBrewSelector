package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	
	//JOIN Beer
	@ManyToMany
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
}
