package pers.myssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.myssm.dao.AddressDao;
import pers.myssm.domain.Address;
import pers.myssm.service.AddressService;

@Service("addressService")
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressDao addressDao;
	
	@Override
	public void add(Address address) {
		addressDao.add(address);
	}

	@Override
	public void delete(Integer id) {
		addressDao.delete(id);
	}

	@Override
	public void update(Address address) {
		addressDao.update(address);
	}

	@Override
	public void updateById(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateByUser(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Address select(Integer user_id, Integer product_id) {
		return addressDao.findById(user_id, product_id);

	}

	@Override
	public void updateByProduct(Integer id) {
		// TODO Auto-generated method stub
		
	}

}
