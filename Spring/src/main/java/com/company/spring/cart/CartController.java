package com.company.spring.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	CartService service;
	
	// 장바구니 추가
	@RequestMapping(value="/insert.do")
	public String insert(CartVO vo, HttpSession session) throws Exception{
		String mid = (String)session.getAttribute("mid");
		vo.setMid(mid);
		
		int count = service.countCart(vo.getPidx(), mid);
		if(count == 0) {
			service.insert(vo);
		}else {
			service.updateCart(vo);
		}
		return "redirect:list.do";
	}
	// 장바구니 목록
	@RequestMapping(value="/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mv) throws Exception{
		String mid = (String)session.getAttribute("mid");
		Map<String,Object> map = new HashMap<String,Object>();
		List<CartVO> list = service.list(mid);
		int sumPrice = service.sumPrice(mid);
		int fee = sumPrice >= 60000 ? 0 : 4000;
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumPrice", sumPrice);
		map.put("fee", fee);
		map.put("totalPrice", sumPrice+fee);
		mv.setViewName("cart/list");
		mv.addObject("map", map);
		return mv;
	}
	
	// 장바구니 수정
	@RequestMapping(value="/update.do")
	public String update(int[] camount, int[] pidx, HttpSession session) throws Exception{
		String mid = (String)session.getAttribute("mid");
		for(int i=0; i < pidx.length; i++) {
			CartVO vo = new CartVO();
			vo.setMid(mid);
			vo.setCamount(camount[i]);
			vo.setPidx(pidx[i]);
			service.modify(vo);
		}
		return "redirect:list.do";
	}
	// 장바구니 삭제
	@RequestMapping(value="/delete.do")
	public String delete(int cidx) throws Exception{
		service.delete(cidx);
		return "redirect:list.do";
	}
}
