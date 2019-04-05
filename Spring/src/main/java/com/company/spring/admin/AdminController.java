package com.company.spring.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.company.spring.product.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	// ��ǰ ���ε�������
	@RequestMapping(value="/admin/upload.do", method=RequestMethod.GET)
	public String upload() throws Exception{
		return "admin/upload";
	}
	// ��ǰ ���ε��ϱ�
	@RequestMapping(value="/admin/productUpload.do", method=RequestMethod.POST)
	public String productUpload(ProductVO vo) throws Exception{
		service.upload(vo);
		return "redirect:/product/list.do";
	}
	// ��ǰ ����������
	@RequestMapping(value="/admin/modify.do/{pidx}", method=RequestMethod.GET)
	public ModelAndView modify(@PathVariable("pidx") int pidx, ModelAndView mv) throws Exception{
		mv.setViewName("admin/modify");
		mv.addObject("vo", service.modify(pidx));
		return mv;
	}
	// ��ǰ �����ϱ�
	@RequestMapping(value="/admin/productModify.do", method=RequestMethod.POST)
	public String productModify(ProductVO vo) throws Exception{
		service.productModify(vo);
		return "redirect:/product/list.do";
	}
	// ��ǰ ����
	@RequestMapping(value="/admin/productDelete.do", method=RequestMethod.POST)
	public String productDelete(int pidx) throws Exception{
		service.productDelete(pidx);
		return "redirect:/product/list.do";
	}
}
