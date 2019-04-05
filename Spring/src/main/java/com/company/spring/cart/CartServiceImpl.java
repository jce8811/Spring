package com.company.spring.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO dao;

	@Override
	public void insert(CartVO vo) throws Exception {
		dao.insert(vo);		
	}

	@Override
	public List<CartVO> list(String mid) throws Exception {
		return dao.list(mid);
	}

	@Override
	public int sumPrice(String mid) throws Exception {
		return dao.sumPrice(mid);
	}

	@Override
	public int countCart(int pidx, String mid) throws Exception {
		return dao.countCart(pidx, mid);
	}

	@Override
	public void updateCart(CartVO vo) throws Exception {
		dao.updateCart(vo);
	}

	@Override
	public void modify(CartVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void delete(int cidx) throws Exception {
		dao.delete(cidx);
	}
	
}
