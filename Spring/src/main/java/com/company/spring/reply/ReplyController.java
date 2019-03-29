package com.company.spring.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService replyservice;
	
	@RequestMapping(value = "/insert.do")
	public void insert(ReplyVO vo, HttpSession session) throws Exception{
		String rwriter = (String)session.getAttribute("mid");
		vo.setRwriter(rwriter);
		replyservice.insert(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/list.do")
	public List<ReplyVO> list(@RequestParam("bidx") int bidx) throws Exception{
		List<ReplyVO> list = replyservice.list(bidx);
		return list;
	}
}
