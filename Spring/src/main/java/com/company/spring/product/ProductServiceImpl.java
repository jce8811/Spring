package com.company.spring.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public List<ProductVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public ProductVO info(int pidx) throws Exception {
		return dao.info(pidx);
	}

}
