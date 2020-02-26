package pers.myssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import pers.myssm.domain.Procate;

@Repository
public interface CateDao {
	
	@Select("select * from tbl_cate")
	public List<Procate> getAll();
	
	@Insert("insert into tbl_cate (catename) values(#{catename})")
	public void addCate(Procate cate);
	
	@Update("update tbl_cate set catename=#{catename} where id=#{id}")
	public void updateCate(Procate cate);
	
	@Delete("delete tbl_cate where id=#{id}")
	public void delCate(Integer id);
	
}
