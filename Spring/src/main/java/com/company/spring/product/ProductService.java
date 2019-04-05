package com.company.spring.product;

import java.util.List;

public interface ProductService {
	public List<ProductVO> list() throws Exception;
	public ProductVO info(int pidx) throws Exception;
}
