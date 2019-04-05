package com.company.spring.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public void insert(CartVO vo) {
		sqlsession.insert("cart.insert", vo);
	}

	public List<CartVO> list(String mid) {
		return sqlsession.selectList("cart.list", mid);
	}

	public int sumPrice(String mid) {
		return sqlsession.selectOne("cart.sumPrice", mid);
	}

	public int countCart(int pidx, String mid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pidx", pidx);
		map.put("mid", mid);
		return sqlsession.selectOne("cart.countCart", map);
	}

	public void updateCart(CartVO vo) {
		sqlsession.update("cart.updateCart", vo);
	}

	public void modify(CartVO vo) {
		sqlsession.update("cart.modify", vo);
	}

	public void delete(int cidx) {
		sqlsession.delete("cart.delete", cidx);
	}

}
