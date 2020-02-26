package pers.myssm.service;

import pers.myssm.domain.Address;

public interface AddressService {
	
	public void add(Address address);
	
	public void delete(Integer id);
	
	public void update(Address address);
	
	public void updateById(Integer id);
	
	public void updateByUser(Integer id);
	
	public void updateByProduct(Integer id);

	public Address select(Integer user_id,Integer product_id);
}