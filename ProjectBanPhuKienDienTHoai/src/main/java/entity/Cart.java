package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<CartItem> items;
	
	public List<CartItem> getItems() {
		return items;
	}
	public void setItems(List<CartItem> items) {
		this.items = items;
	}
	public Cart(List<CartItem> items) {
		super();
		this.items = items;
	}
	public Cart() {
		this.items = new ArrayList<>();
	}
	public void add(CartItem item) {
		for(CartItem ci : items) {
			if(ci.getProduct().getId() == item.getProduct().getId()) {
				ci.addquanlity(1);
				return;
			}
		}
		this.items.add(item);
	}
	public void remove(int id) {
		for(CartItem ci : items) {
			if(ci.getProduct().getId() == id) {
				items.remove(ci);
				return;
			}
		}
	}
	public void update(int id, int quanlity) {
		for(CartItem ci : items) {
			if(ci.getProduct().getId() == id) {
				ci.setQuanlity(quanlity);
				return;
			}
		}
	}
	public int getSize() {
		int size = 0;
		for(CartItem c : items) {
			size +=c.getQuanlity();
		}
		return size;
	}
	public double getTotalPrice() {
		double total = 0;
		for(CartItem ci : items) {
			total+= ci.getTotalPrice();		
		}
		return total;
	}
	public List<CartItem> getcartitemlist(){
		return this.items;
	}
	@Override
	public String toString() {
		return "Cart [items=" + items + "]";
	}
	
	
}
