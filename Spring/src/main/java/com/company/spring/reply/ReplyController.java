package com.company.spring.reply;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService service;
	

	// ´ñ±Û ÀÔ·Â
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody ReplyVO vo, HttpSession session) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			String mid = (String)session.getAttribute("mid");
			vo.setRwriter(mid);
			service.insert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//	@RequestMapping(value="/insert.do")
//	public void insert(ReplyVO vo, HttpSession session) throws Exception{
//		String mid = (String)session.getAttribute("mid");
//		vo.setRwriter(mid);
//		service.insert(vo);
//	}
	// ´ñ±Û ¸ñ·Ï
	@RequestMapping(value="/list.do/{bidx}", method=RequestMethod.GET)
	public ModelAndView list(@PathVariable("bidx") int bidx, ModelAndView mv) throws Exception{
		List<ReplyVO> list = service.list(bidx);
		mv.setViewName("reply/list");
		mv.addObject("List", list);
		return mv;
	}
//	@RequestMapping(value="/list.do")
//	public ModelAndView list(int bidx, ModelAndView mv) throws Exception{
//		List<ReplyVO> list = service.list(bidx);
//		mv.setViewName("reply/list");
//		mv.addObject("rList", list);
//		return mv;
//	}
	// ´ñ±Û »ó¼¼ º¸±â
	@RequestMapping(value="/detail.do/{ridx}", method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("ridx") int ridx, ModelAndView mv) throws Exception{
		ReplyVO vo = service.detail(ridx);
		mv.setViewName("reply/detail");
		mv.addObject("vo", vo);
		return mv;
	}
	// ´ñ±Û ¼öÁ¤
	@RequestMapping(value="/update.do/{ridx}", method= RequestMethod.POST)
	public ResponseEntity<String> update(@PathVariable("ridx") int ridx, @RequestBody ReplyVO vo) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			vo.setRidx(ridx);
			service.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// ´ñ±Û »èÁ¦
	@RequestMapping(value="/delete.do/{ridx}", method=RequestMethod.POST)
	public ResponseEntity<String> delete(@PathVariable("ridx") int ridx) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.delete(ridx);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
