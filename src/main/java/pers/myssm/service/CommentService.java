package pers.myssm.service;

import java.util.List;

import pers.myssm.domain.Comment;

public interface CommentService {
	
	public void add(Comment comment);
	
	public List<Comment> getCommentsPage(Integer product_id,Integer begin,Integer end);
	
	public List<Comment> getAllById(Integer id);
	
	public List<Comment> getAllByUser(Integer id);
	
	public void delComment(Integer id);
	
	public void editComment(String comment);
	
	public List<Comment> getAllByPro(Integer id);
	//获取评论数
	public Long getNums(Integer product_id);
}
