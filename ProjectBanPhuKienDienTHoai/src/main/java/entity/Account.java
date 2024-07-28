package entity;

public class Account {
	private int id;
	private String user;
	private String pass;
	private String phone;
	private String email;
	private int isSell;
	private int isAdmin;
	private String fullname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getIsSell() {
		return isSell;
	}
	public void setIsSell(int isSell) {
		this.isSell = isSell;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	
	public Account(int id) {
		super();
		this.id = id;
	}
	public Account(int id, String user, String pass, String phone, String email, int isSell, int isAdmin,
			String fullname) {
		super();
		this.id = id;
		this.user = user;
		this.pass = pass;
		this.phone = phone;
		this.email = email;
		this.isSell = isSell;
		this.isAdmin = isAdmin;
		this.fullname = fullname;
	}
	public Account() {
		super();
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", user=" + user + ", pass=" + pass + ", phone=" + phone + ", email=" + email
				+ ", isSell=" + isSell + ", isAdmin=" + isAdmin + ", fullname=" + fullname + "]";
	}
	
}
