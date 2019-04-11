package com.company.spring.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.company.spring.utils.Criteria;
import com.company.spring.utils.PageMaker;
import com.company.spring.utils.SearchCriteria;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public void list(Model model, Criteria cri, PageMaker pagemaker) throws Exception{
		List<ProductVO> list = service.list(cri);
		model.addAttribute("list", list);
		
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.listCount());
		model.addAttribute("pagemaker", pagemaker);
	}
	@RequestMapping(value="/info.do/{pidx}")
	public ModelAndView info(@PathVariable("pidx") int pidx, ModelAndView mv) throws Exception{
		mv.setViewName("product/info");
		mv.addObject("vo", service.info(pidx));
		return mv;
	}
}
