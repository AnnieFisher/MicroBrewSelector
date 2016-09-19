package dao;

import java.util.List;

import entities.Beer;
import entities.Style;
import entities.Taste;
import entities.Type;
import entities.User;

public interface MicroBrewDao {
	public Beer updateRating (int id, int rating);
	public User addUser(String firstName, String lastName, String username,
			String password, String city, String state);
	public User login(String username, String password);
	public List<Beer> getBeers();
	public List<Beer> getUserFavorites(int id);
	public void removeUser(int id);
	public void updateUser(String firstName, String lastName,
			 String city, String state);
	public Beer getBeer(int id);
	public Style getStyle(int id);
	public Type getType(int id);
	public Taste getTaste(int id);

	
}
