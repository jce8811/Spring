package com.company.spring.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberService;
import com.company.spring.member.MemberVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.Criteria;
import com.company.spring.utils.PageMaker;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	
	@RequestMapping(value="/step.do")
	public String step() throws Exception{
		return "member/step";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public ModelAndView join(@RequestParam(value="agree", defaultValue="false") Boolean agree) throws Exception {
		if(!agree) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/step");
			mv.addObject("msg","noCheck");
			return mv;
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		mv.addObject("register", new Register());
		return mv;
	}
	
	@RequestMapping(value="/joinResult.do", method=RequestMethod.POST)
	public ModelAndView joinResult(Register reg, Errors errors, MultipartFile file) throws Exception{
		new RegisterValidator().validate(reg, errors);
		if(errors.hasErrors()) {
			ModelAndView mv = new ModelAndView("member/join");
			return mv;
		} try {
			service.insertMember(reg);
		} catch (ExistingEmailException e) {
			errors.rejectValue("mmail", "duplicate", "이미 가입된 이메일입니다.");
			ModelAndView mv = new ModelAndView("member/join");
			return mv;
		}
		ModelAndView mv = new ModelAndView("member/joinResult");
		return mv;
	}
	
	@RequestMapping(value="/login.do")
	public String login() throws Exception{
		return "member/login";
	}
	
	@RequestMapping(value="/loginCheck.do")
	public ModelAndView loginCheck(MemberVO vo, HttpSession session) throws Exception{
		boolean result = service.loginCheck(vo,session);
		ModelAndView mv = new ModelAndView();
		if(result == true) {
			mv.setViewName("home");
			mv.addObject("msg", "success");
		}else {
			mv.setViewName("member/login");
			mv.addObject("msg", "fail");
		}
		return mv;
	}
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session) throws Exception{
		service.logout(session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value="/findId.do")
	public String findId() throws Exception{
		return "member/findId";
	}
	
	@RequestMapping(value="/findIdResult.do", method=RequestMethod.POST)
	public String findIdResult(@RequestParam("mname") String mname, @RequestParam("mmail") String mmail, Model model) throws Exception{
		model.addAttribute("mid", service.findId(mname, mmail));
		return "member/findIdResult";
	}
	
	@RequestMapping(value="/findPw.do")
	public String findPw() throws Exception{
		return "member/findPw";
	}
	
	@RequestMapping(value="/findPwResult.do", method=RequestMethod.POST)
	public ModelAndView findPwResult(@RequestParam("mid") String mid, @RequestParam("mname") String mname, 
									@RequestParam("mmail") String mmail, HttpServletRequest request) throws Exception{
		boolean result = service.findPw(mid,mname,mmail);
		ModelAndView mv = new ModelAndView();
		if(result == true) {
			request.setAttribute("mid", mid);
			mv.setViewName("member/updatePw");
			
		}else {
			mv.setViewName("member/findPw");
			mv.addObject("msg","fail");
		}
		return mv;
	}
	
	@RequestMapping(value="/updatePwResult.do", method=RequestMethod.POST)
	public String updatePwResult(@RequestParam("mid") String mid, @RequestParam("mpw") String mpw, MemberVO vo) throws Exception{
		service.updatePwResult(vo);
		vo.setMid(mid);
		vo.setMpw(mpw);
		return "redirect:login.do";
	}
	
	@RequestMapping(value="/info.do", method=RequestMethod.GET)
	public String info(String mid, Model model) throws Exception{
		model.addAttribute("vo", service.info(mid));
		return "member/info";
	}
	
	@RequestMapping(value="/infoUpdate.do", method=RequestMethod.POST)
	public String updateInfo(MemberVO vo, MultipartFile file, HttpServletRequest request) throws Exception{
		service.updateInfo(vo);
		return "redirect:info.do?mid="+vo.getMid();
	}
	
	@RequestMapping(value="/drop.do", method=RequestMethod.GET)
	public String drop() throws Exception{
		return "member/drop";
	}
	@RequestMapping(value="/dropMember.do", method=RequestMethod.POST)
	public String dropMember(@RequestParam("mpw") String mpw, Model model, HttpSession session) throws Exception{
		String mid = (String) session.getAttribute("mid");
		boolean result = service.checkPw(mid, mpw);
		if(result) {
			service.dropMember(mid);
			session.invalidate();
			return "home";
		} else {
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			return "member/drop";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public int checkId(@RequestParam("mid") String mid) throws Exception{
		MemberVO checkId = service.checkId(mid);
		int result = 0;
		if(checkId != null) {
			result = 1;
		}
		return result;
	}
	
	// 내 글 목록
	@RequestMapping(value="/myBoardWrite.do", method=RequestMethod.GET)
	public String myBoardWrite(Model model, Criteria cri, PageMaker pagemaker) throws Exception{
		List<BoardVO> list = service.myBoardWrite(cri);
		model.addAttribute("list", list);
		
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.countMyBoard());
		model.addAttribute("pagemaker", pagemaker);
		return "member/myBoardWrite";
	}
	// 내 댓글 목록
		@RequestMapping(value="/myReplyWrite.do", method=RequestMethod.GET)
		public String myReplyWrite(Model model, Criteria cri, PageMaker pagemaker) throws Exception{
			List<ReplyVO> list = service.myReplyWrite(cri);
			model.addAttribute("list", list);
			
			pagemaker.setCri(cri);
			pagemaker.setTotalCount(service.countMyReply());
			model.addAttribute("pagemaker", pagemaker);
			return "member/myReplyWrite";
		}
}
