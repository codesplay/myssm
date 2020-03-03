package pers.myssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.myssm.dao.CommentDao;
import pers.myssm.domain.Comment;
import pers.myssm.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;

	//添加
	public void add(Comment comment){
		commentDao.add(comment);
	}
	//通过id获取
	public List<Comment> getAllById(Integer id) {
		return commentDao.findAllById(id);
	}

	//通过user获取
	public List<Comment> getAllByUser(Integer id) {
		return commentDao.findAllByUser(id);
	}

	//删除
	public void delComment(Integer id) {
		commentDao.delete(id);
	}

	public void editComment(String comments) {
		commentDao.editcomments(comments);
	}
	
	//获取商品评论
	public List<Comment> getAllByPro(Integer id){
		return commentDao.findAllByPro(id);
	}

	//获取一页评论
	public List<Comment> getCommentsPage(Integer product_id, Integer begin, Integer nums) {
	
		return commentDao.findBypage(product_id, begin, nums);
	}
	
	public Long getNums(Integer product_id) {
		return commentDao.getNums(product_id);
	}
	
	
}
