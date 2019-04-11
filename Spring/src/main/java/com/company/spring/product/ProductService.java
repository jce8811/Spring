package com.company.spring.product;

import java.util.List;

import com.company.spring.utils.Criteria;

public interface ProductService {
	public List<ProductVO> list(Criteria cri) throws Exception;
	public ProductVO info(int pidx) throws Exception;
	public int listCount() throws Exception;
}
