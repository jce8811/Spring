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
}
