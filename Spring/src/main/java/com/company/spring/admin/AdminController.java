package com.company.spring.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.spring.product.ProductVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	@RequestMapping(value="/upload.do", method=RequestMethod.GET)
	public String admin() throws Exception{
		return "admin/upload";
	}
	
	@RequestMapping(value="/productUpload.do", method=RequestMethod.POST)
	public String upload(ProductVO vo) throws Exception{
		adminservice.upload(vo);
		return "redirect:product/list.do";
	}
}
