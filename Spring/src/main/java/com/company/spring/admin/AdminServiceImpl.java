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
	@Override
	public ProductVO modify(int pidx) throws Exception {
		return dao.modify(pidx);
	}
	@Override
	public void productModify(ProductVO vo) throws Exception {
		dao.productModify(vo);
	}
	@Override
	public void productDelete(int pidx) throws Exception {
		dao.productDelete(pidx);
	}

}
