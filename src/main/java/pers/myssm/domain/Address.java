package pers.myssm.domain;

public class Address {
	
	private Integer id;
	private Integer product_id;
	private Integer user_id;
	private String  phone;
	private String name;
	private String email;
	private String site;
	
	public Address(){
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String toString() {
		return "address [product_id=" + product_id + ", user_id=" + user_id + ", phone=" + phone + ", name=" + name
				+ ", email=" + email + ", site=" + site + "]";
	}
	
}
