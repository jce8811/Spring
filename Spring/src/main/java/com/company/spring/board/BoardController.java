package com.company.spring.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.company.spring.utils.PageMaker;
import com.company.spring.utils.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService service;

	// �۸�� + ����¡ + �˻�
	@RequestMapping(value = "/list.do", method=RequestMethod.GET)
	public void list(Model model, SearchCriteria scri, PageMaker pagemaker) throws Exception{
		List<BoardVO> list = service.list(scri);
		model.addAttribute("list", list);
		
		pagemaker.setCri(scri);
		pagemaker.setTotalCount(service.countSearch(scri));
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
		service.insert(vo);
		return "redirect:list.do";
	}
	// �۳��� ������
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public ModelAndView view(int bidx, SearchCriteria scri) throws Exception{
		service.updateCnt(bidx);
		ModelAndView mv = new ModelAndView("board/content");
		mv.addObject("vo", service.read(bidx));
		mv.addObject("scri", scri);
		return mv;
	}
	// �� ���� ������
	@RequestMapping(value="/updateRead.do", method=RequestMethod.GET)
	public ModelAndView updateRead(int bidx, SearchCriteria scri) throws Exception{
		ModelAndView mv = new ModelAndView("board/updateContent");
		mv.addObject("vo", service.updateRead(bidx));
		mv.addObject("scri", scri);
		return mv;
	}
	// �� ���� �ϱ�
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(BoardVO vo, SearchCriteria scri) throws Exception{
		service.update(vo);
		return "redirect:content.do?bidx=" + vo.getBidx() + scri.getPage() + scri.getPerPageNum() + scri.getSearchType() + scri.getKeyword();
	}
	// �� ���� �ϱ�
	@RequestMapping(value="/delete.do")
	public String delete(int bidx, SearchCriteria scri) throws Exception{
		service.delete(bidx);
		return "redirect:list.do"+ scri.getPage() + scri.getPerPageNum() + scri.getSearchType() + scri.getKeyword();
	}
}
