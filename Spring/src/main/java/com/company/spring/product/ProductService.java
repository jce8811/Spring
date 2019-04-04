package com.company.spring.product;

import java.util.List;
import org.springframework.stereotype.Service;

public interface ProductService {
	public List<ProductVO> list() throws Exception;
	public ProductVO info(int pidx) throws Exception;
}
