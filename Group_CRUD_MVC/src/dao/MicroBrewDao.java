package dao;

import java.util.List;

import entities.Beer;
import entities.Brand;
import entities.Style;
import entities.Taste;
import entities.Type;
import entities.User;

public interface MicroBrewDao {
	public void updateRating(int id);

	public User addUser(String firstName, String lastName, String username, String password, String city, String state);

	public User login(String username, String password);

	public List<Beer> getBeers();

	public List<Beer> getUserFavorites(int id);
	
	public void addToFavorites(int beerId, User user);
	
	public void removeFromFavorites(int beerId, User user);

	public void removeUser(int id);

	public void updateUser(int id, String firstName, String lastName, String city, String state);

	public Beer getBeer(int id);

	public List<Beer> getType(int id);

	public List<Beer> getTaste(int id);

	public List<Beer> getStyle(int id);
	
	public List<Beer> getBrand(int id);

	List<Type> getTypeList();

	List<Brand> getBrandList();

	List<Style> getStyleList();

	List<Taste> getTasteList();
	
	public void addSuggestions(String name, int rating, int styleId, int typeId, int tasteId, String brandId);

	public List<User> getUserList();
	
	public void editBeerAdmin(int beerId, int type, int style, int taste, String name, String brand);
	
	public void deleteBeerAdmin(int id);

}
