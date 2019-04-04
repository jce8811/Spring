package com.company.spring.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService boardservice;

	// �۸�� + ����¡ + �˻�
	@RequestMapping(value = "/listSearch.do", method=RequestMethod.GET)
	public void listSearch(SearchCriteria scri, Model model, PageMaker pagemaker) throws Exception{
		List<BoardVO> list = boardservice.listSearch(scri);
		model.addAttribute("list", list);
		pagemaker.setCri(scri);
		pagemaker.setTotalCount(boardservice.countSearch(scri));
		model.addAttribute("pagemaker", pagemaker);
		
	}
	// �ۼ� ������
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/write";
	}
	// ���ۼ� ������
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String boardWrite(BoardVO vo, HttpSession session) throws Exception {
		String bwriter = (String)session.getAttribute("mid");
		vo.setBwriter(bwriter);
		
		boardservice.insert(vo);
		return "redirect:listSearch.do";
	}
	// �۳��� ������
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public ModelAndView view(int bidx) throws Exception{
		boardservice.updateCnt(bidx);
		ModelAndView mv = new ModelAndView("board/content");
		mv.addObject("vo", boardservice.read(bidx));
		return mv;
	}
	// �� ���� ������
	@RequestMapping(value="/updateRead.do", method=RequestMethod.GET)
	public ModelAndView updateRead(int bidx) throws Exception{
		ModelAndView mv = new ModelAndView("board/updateContent");
		mv.addObject("vo", boardservice.updateRead(bidx));
		return mv;
	}
	// �� ���� �ϱ�
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(BoardVO vo) throws Exception{
		boardservice.update(vo);
		return "redirect:content.do?bidx=" + vo.getBidx();
	}
	// �� ���� �ϱ�
	@RequestMapping(value="/delete.do")
	public String delete(int bidx) throws Exception{
		boardservice.delete(bidx);
		return "redirect:listSearch.do";
	}
}
