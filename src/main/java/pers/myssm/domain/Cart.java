package pers.myssm.domain;

public class Cart {
	
	private Integer id;
	private Integer num;
	private Double buymoney;
	private Integer user_id;
	private Integer product_id;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getBuymoney() {
		return buymoney;
	}
	public void setBuymoney(Double buymoney) {
		this.buymoney = buymoney;
	}
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", num=" + num + ", buymoney=" + buymoney + ", user_id=" + user_id + ", product_id="
				+ product_id + "]";
	}

	
}
