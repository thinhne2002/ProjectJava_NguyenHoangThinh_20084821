package entity;

public class CartItem {
	private Product product;
	private int quanlity;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public CartItem(Product product, int quanlity) {
		super();
		this.product = product;
		this.quanlity = quanlity;
	}

	public CartItem() {
	}

	public boolean addquanlity(int quanlity) {
		this.quanlity+=quanlity;
		return true;
	}
	public double getTotalPrice() {
		return this.quanlity*this.product.getPrice();
	}
	@Override
	public String toString() {
		return "CartItem [product=" + product + ", quanlity=" + quanlity + "]";
	}

	
}
