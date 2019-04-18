package com.company.spring.cart;

import java.util.List;

public interface CartService {
	public void insert(CartVO vo) throws Exception;
	public List<CartVO> list(String cid) throws Exception;
	public int sumPrice(String cid) throws Exception;
	public int countCart(int pidx, String cid) throws Exception;
	public void updateCart(CartVO vo) throws Exception;
	public void modify(CartVO vo) throws Exception;
	public void delete(int cidx) throws Exception;
}
