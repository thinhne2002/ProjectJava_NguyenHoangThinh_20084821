package entity;

public class Product {
	private int id;
	private String name;
	private String image;
	private double price;
	private String title;
	private String description;
	private String color;
	private Category cateID;
	private Account sellid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Category getCateID() {
		return cateID;
	}
	public void setCateID(Category cateID) {
		this.cateID = cateID;
	}
	
	public Account getSellid() {
		return sellid;
	}
	public void setSellid(Account sellid) {
		this.sellid = sellid;
	}
	public Product(int id, String name, String image, double price, String title, String description, String color,
			Category cateID, Account sellid) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
		this.color = color;
		this.cateID = cateID;
		this.sellid = sellid;
	}
	public Product(String name, String image, double price, String title, String description, Category cateID,
			Account sellid) {
		super();
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
		this.cateID = cateID;
		this.sellid = sellid;
	}
	public Product() {
		super();
	}
	public Product(int id) {
		super();
		this.id = id;
	}
	
	public Product(int id, String name, String image, double price, String title, String description, Category cateID) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
		this.cateID = cateID;
		this.id = id;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", title=" + title
				+ ", description=" + description + ", color=" + color + ", cateID=" + cateID + ", sellid=" + sellid
				+ "]";
	}
	
}
