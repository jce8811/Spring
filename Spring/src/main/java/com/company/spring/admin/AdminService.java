package com.company.spring.admin;

import com.company.spring.product.ProductVO;

public interface AdminService {
	public void upload(ProductVO vo) throws Exception;
	public ProductVO modify(int pidx) throws Exception;
	public void productModify(ProductVO vo) throws Exception;
	public void productDelete(int pidx) throws Exception;
}
