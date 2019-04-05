package com.company.spring.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	ProductService productservice;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv) throws Exception{
		mv.setViewName("product/list");
		mv.addObject("list", productservice.list());
		return mv;
	}
	@RequestMapping(value="/info.do/{pidx}")
	public ModelAndView info(@PathVariable("pidx") int pidx, ModelAndView mv) throws Exception{
		mv.setViewName("product/info");
		mv.addObject("vo", productservice.info(pidx));
		return mv;
	}
}
