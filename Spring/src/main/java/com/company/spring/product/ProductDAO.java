package com.company.spring.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.spring.utils.Criteria;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public List<ProductVO> list(Criteria cri) throws Exception{
		return sqlsession.selectList("product.list", cri);
	}

	public ProductVO info(int pidx) throws Exception{
		return sqlsession.selectOne("product.info", pidx);
	}

	public int listCount() throws Exception{
		return sqlsession.selectOne("product.listCount");
	}

}
