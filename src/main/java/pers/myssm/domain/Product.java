package pers.myssm.domain;

public class Product {

	private Integer id;
	private String prodesc;
	private String proimg;
	private String probrand;
	private String proname;
	private Integer procate;
	private Integer pronums;
	private Double price;
	private Double sales;
	private String made;
//	private MultipartFile proimg;
	
//	public MultipartFile getMultipartFile() {
//		return proimg;
//	}
//	public void setMultipartFile(MultipartFile proimg) {
//		this.proimg = proimg;
//	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getProdesc() {
		return prodesc;
	}
	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}
//	public MultipartFile getProimg() {
//		return proimg;
//	}
//	public void setProimg(MultipartFile proimg) {
//		this.proimg = proimg;
//	}
	public String getProbrand() {
		return probrand;
	}
	public void setProbrand(String probrand) {
		this.probrand = probrand;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public Integer getProcate() {
		return procate;
	}
	public void setProcate(Integer procate) {
		this.procate = procate;
	}
	public Integer getPronums() {
		return pronums;
	}
	public void setPronums(Integer pronums) {
		this.pronums = pronums;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getSales() {
		return sales;
	}
	public void setSales(Double sales) {
		this.sales = sales;
	}
	public String getMade() {
		return made;
	}
	public void setMade(String made) {
		this.made = made;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", prodesc=" + prodesc + ", proimg=" + proimg + ", probrand=" + probrand
				+ ", proname=" + proname + ", procate=" + procate + ", pronums=" + pronums + ", price=" + price
				+ ", sales=" + sales + ", made=" + made + ", proimg=" + proimg + "]";
	}
	public String getProimg() {
		return proimg;
	}
	public void setProimg(String proimg) {
		this.proimg = proimg;
	}


	
}
