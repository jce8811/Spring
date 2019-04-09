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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@RequestMapping(value = "/insert.do", method=RequestMethod.POST)
	public ResponseEntity<String> replyinsert(@RequestBody ReplyVO vo, HttpSession session) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			String rwriter = (String)session.getAttribute("mid");
			vo.setRwriter(rwriter);
			service.insert(vo);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/list.do")
	public ModelAndView replylist(@RequestParam("bidx") int bidx, ModelAndView mv, HttpSession session) throws Exception{
		List<ReplyVO> list = service.list(bidx, session);
		mv.setViewName("reply/list");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/detail/{ridx}", method=RequestMethod.GET)
	public ModelAndView replyDetail(@PathVariable("ridx") int ridx, ModelAndView mv) throws Exception{
		ReplyVO vo = service.detail(ridx);
		mv.setViewName("reply/detail");
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/modify/{ridx}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> replyModify(@PathVariable("ridx") int ridx, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setRidx(ridx);
			service.modify(vo);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/delete/{ridx}")
	public ResponseEntity<String> replyDelete(@PathVariable("ridx") int ridx){
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
