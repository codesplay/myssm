package pers.myssm.domain;

public class Order {
	
	private String orderuser;
	private String orderemail;
	private String orderphone;
	private Integer id;
	private Integer product_id;
	private Integer buynum;
	private double buymoney;
	private Integer status;
	private String ordersite;
	private Integer user_id;
	private String ordertime;
	//订单号
	private Long ordernum;
	
	
	public String getOrderemail() {
		return orderemail;
	}
	public void setOrderemail(String orderemail) {
		this.orderemail = orderemail;
	}
	public String getOrderphone() {
		return orderphone;
	}
	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
	}
	public String getOrderuser() {
		return orderuser;
	}
	public void setOrderuser(String orderuser) {
		this.orderuser = orderuser;
	}
	public String getEmail() {
		return orderemail;
	}
	public void setEmail(String email) {
		this.orderemail = email;
	}
	public String getPhone() {
		return orderphone;
	}
	public void setPhone(String phone) {
		this.orderphone = phone;
	}
	public Order() {
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

	public Integer getBuynum() {
		return buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}

	public double getBuymoney() {
		return buymoney;
	}

	public void setBuymoney(double buymoney) {
		this.buymoney = buymoney;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getOrdersite() {
		return ordersite;
	}

	public void setOrdersite(String ordersite) {
		this.ordersite = ordersite;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}

	public Long getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(Long ordernum) {
		this.ordernum = ordernum;
	}
	@Override
	public String toString() {
		return "Order [orderuser=" + orderuser + ", orderemail=" + orderemail + ", orderphone=" + orderphone + ", id="
				+ id + ", product_id=" + product_id + ", buynum=" + buynum + ", buymoney=" + buymoney + ", status="
				+ status + ", ordersite=" + ordersite + ", user_id=" + user_id + ", ordertime=" + ordertime
				+ ", ordernum=" + ordernum + "]";
	}
	
	
	
}
