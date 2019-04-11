package com.company.spring.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.spring.utils.Criteria;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public List<ProductVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public ProductVO info(int pidx) throws Exception {
		return dao.info(pidx);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

}
