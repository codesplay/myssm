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

	public void add(Comment comment){
		commentDao.add(comment);
	}
	
	public List<Comment> getAllById(Integer id) {
		return commentDao.findAllById(id);
	}

	@Override
	public List<Comment> getAllByUser(Integer id) {
		return commentDao.findAllByUser(id);
	}

	@Override
	public void delComment(Integer id) {
		commentDao.delete(id);
	}

	public void editComment(String comments) {
		commentDao.editcomments(comments);
	}
	
	public List<Comment> getAllByPro(Integer id){
		return commentDao.findAllByPro(id);
	}
	
	
}
