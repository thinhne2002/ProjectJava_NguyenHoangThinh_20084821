package entity;

public class Category {
	private int cateID;
	private String cateName;

	public int getCateID() {
		return cateID;
	}

	public void setCateID(int cateID) {
		this.cateID = cateID;
	}
	
	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public Category(int cateID, String cateName) {
		super();
		this.cateID = cateID;
		this.cateName = cateName;
	}
	
	public Category(int cateID) {
		super();
		this.cateID = cateID;
	}

	public Category() {
		super();
	}

	@Override
	public String toString() {
		return "Category [cateID=" + cateID + ", cateName=" + cateName + "]";
	}


}
