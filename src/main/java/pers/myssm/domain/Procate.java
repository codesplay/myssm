package pers.myssm.domain;

/**
 * 商品类型
 * 
 * @author IMFINE
 *
 */
public class Procate {
	
	private Integer id;
	private String catename;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	@Override
	public String toString() {
		return "Procate [id=" + id + ", catename=" + catename + "]";
	}

}
