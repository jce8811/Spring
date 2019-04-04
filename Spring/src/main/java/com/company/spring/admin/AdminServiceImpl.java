package com.company.spring.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.spring.product.ProductVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO dao;
	
	@Override
	public void upload(ProductVO vo) throws Exception {
		dao.upload(vo);
		
	}

}
