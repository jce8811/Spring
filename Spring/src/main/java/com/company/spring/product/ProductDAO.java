package com.company.spring.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public List<ProductVO> list() {
		return sqlsession.selectList("product.list");
	}

	public ProductVO info(int pidx) {
		return sqlsession.selectOne("product.info", pidx);
	}

}
