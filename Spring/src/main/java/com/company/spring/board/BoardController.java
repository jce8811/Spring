package com.company.spring.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	//목록 페이지
	@RequestMapping(value="/list.do")
	public ModelAndView list(@RequestParam(defaultValue="all") String searchOption,
							@RequestParam(defaultValue="") String keyword) throws Exception{
		
		
		List<BoardVO> list = boardservice.list(searchOption, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("search", searchOption);
		map.put("keyword", keyword);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		mv.setViewName("board/list");
		return mv;
	}
	@RequestMapping(value = "/listPage.do", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model, PageMaker pagemaker) throws Exception{
		List<BoardVO> list = boardservice.listPage(cri);
		model.addAttribute("list", list);
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(boardservice.listCount());
		model.addAttribute("pagemaker", pagemaker);
	}
	// 작성 페이지
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/write";
	}
	// 글작성 페이지
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String boardWrite(BoardVO vo, HttpSession session) throws Exception {
		String bwriter = (String)session.getAttribute("mid");
		vo.setBwriter(bwriter);
		
		boardservice.insert(vo);
		return "redirect:list.do";
	}
	// 글내용 페이지
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public ModelAndView view(int bidx) throws Exception{
		boardservice.updateCnt(bidx);
		ModelAndView mv = new ModelAndView("board/content");
		mv.addObject("vo", boardservice.read(bidx));
		return mv;
	}
	// 글 수정 페이지
	@RequestMapping(value="/updateRead.do", method=RequestMethod.GET)
	public ModelAndView updateRead(int bidx) throws Exception{
		ModelAndView mv = new ModelAndView("board/updateContent");
		mv.addObject("vo", boardservice.updateRead(bidx));
		return mv;
	}
	// 글 수정 하기
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(BoardVO vo) throws Exception{
		boardservice.update(vo);
		return "redirect:content.do?bidx=" + vo.getBidx();
	}
	// 글 삭제 하기
	@RequestMapping(value="/delete.do")
	public String delete(int bidx) throws Exception{
		boardservice.delete(bidx);
		return "redirect:list.do";
	}
}
