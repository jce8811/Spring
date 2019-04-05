package com.company.spring.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.spring.product.ProductVO;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public void upload(ProductVO vo) throws Exception{
		sqlsession.selectOne("admin.upload", vo);
	}

	public ProductVO modify(int pidx) throws Exception{
		return sqlsession.selectOne("admin.modify", pidx);
	}

	public void productModify(ProductVO vo) throws Exception{
		sqlsession.update("admin.productModify", vo);
	}

	public void productDelete(int pidx) throws Exception{
		sqlsession.delete("admin.productDelete", pidx);
	}
}
