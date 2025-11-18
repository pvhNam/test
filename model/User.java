package model;

public class User {
	private String username;
    private String password;
    private String companyName;
    private String phone;
    private String email;
    private String address;
	public User(String username, String password, String companyName, String phone, String email, String address) {
		super();
		this.username = username;
		this.password = password;
		this.companyName = companyName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
    
}
