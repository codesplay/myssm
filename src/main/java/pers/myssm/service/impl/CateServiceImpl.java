package pers.myssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.myssm.dao.CateDao;
import pers.myssm.domain.Procate;
import pers.myssm.service.CateService;

@Service("cateService")
public class CateServiceImpl implements CateService {

	@Autowired
	private CateDao cateDao;
	
	public List<Procate> findAll(){
		return cateDao.getAll();
	}

}
