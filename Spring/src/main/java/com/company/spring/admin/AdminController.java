package com.company.spring.admin;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberVO;
import com.company.spring.product.ProductVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.UploadFileUtils;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// ��ü ȸ�� ����Ʈ
	@RequestMapping(value="/admin/memberList.do", method=RequestMethod.GET)
	public String memberList(Model model) throws Exception{
		List<MemberVO> list = service.memberList();
		model.addAttribute("list", list);
		return "admin/memberList";
	}
	// ��ü �Խù� ����Ʈ
	@RequestMapping(value="/admin/boardList.do", method=RequestMethod.GET)
	public String boardList(Model model) throws Exception{
		List<BoardVO> list = service.boardList();
		model.addAttribute("list", list);
		return "admin/boardList";
	}
	// ��ü ��� ����Ʈ
	@RequestMapping(value="/admin/replyList.do", method=RequestMethod.GET)
	public String replyList(Model model) throws Exception{
		List<ReplyVO> list = service.replyList();
		model.addAttribute("list", list);
		return "admin/replyList";
	}
	// ��ǰ ���ε�������
	@RequestMapping(value="/admin/upload.do", method=RequestMethod.GET)
	public String upload() throws Exception{
		return "admin/upload";
	}
	// ��ǰ ���ε��ϱ�
	@RequestMapping(value="/admin/productUpload.do", method=RequestMethod.POST)
	public String productUpload(ProductVO vo, MultipartFile file) throws Exception{
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 vo.setPimage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		 vo.setPthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
		 fileName = File.separator + "images" + File.separator + "none.png";
		 vo.setPimage(fileName);
		 vo.setPthumbimg(fileName);
		}

		service.upload(vo);
		return "redirect:/product/list.do";
	}
	// ��ǰ ����������
	@RequestMapping(value="/admin/modify.do/{pidx}", method=RequestMethod.GET)
	public ModelAndView modify(@PathVariable("pidx") int pidx, ModelAndView mv) throws Exception{
		mv.setViewName("admin/modify");
		mv.addObject("vo", service.modify(pidx));
		return mv;
	}
	// ��ǰ �����ϱ�
	@RequestMapping(value="/admin/productModify.do", method=RequestMethod.POST)
	public String productModify(ProductVO vo, MultipartFile file, HttpServletRequest request) throws Exception{
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			new File(uploadPath + request.getParameter("pimage")).delete();
			new File(uploadPath + request.getParameter("pthumbimg")).delete();
			
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			
			vo.setPimage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setPthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}else {
			vo.setPimage(request.getParameter("pimage"));
			vo.setPthumbimg(request.getParameter("pthumbimg"));
		}
		service.productModify(vo);
		return "redirect:/product/list.do";
	}
	// ��ǰ ����
	@RequestMapping(value="/admin/productDelete.do", method=RequestMethod.POST)
	public String productDelete(int pidx) throws Exception{
		service.productDelete(pidx);
		return "redirect:/product/list.do";
	}
}
