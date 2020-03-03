package pers.myssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PatchMapping;

import pers.myssm.domain.Comment;

@Repository
public interface CommentDao {

	@Select("select * from tbl_comment where product_id=#{product_id} limit #{begin},#{nums}")
	public List<Comment> findBypage(@Param("product_id")Integer product_id,@Param("begin")Integer begin,@Param("nums")Integer nums);
	
	//获取评论数
	@Select("select count(id) from tbl_comment where product_id = #{product_id}")
	public Long getNums(Integer product_id);
	
	@Select("select * from tbl_comment where product_id = #{id}")
	public List<Comment> findAllById(Integer id);
	
	@Select("select * from tbl_comment where product_id = #{id}")
	public List<Comment> findAllByPro(Integer id);
	
	@Select("select * from tbl_comment where user_id = #{id}")
	public List<Comment> findAllByUser(Integer id);
	
	@Insert("insert into tbl_comment (username,product_id,user_id,comments) values(#{username},#{product_id},#{user_id},#{comments})")
	public void add(Comment comment);
	
	@Update("update tbl_comment set comments=#{comments}")
	public void editcomments(String comments);
	
	@Delete("delete from tbl_comment where id = #{id}")
	public void delete(Integer id);

}
