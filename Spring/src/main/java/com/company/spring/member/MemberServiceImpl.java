package com.company.spring.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.spring.board.BoardVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.Criteria;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public void insertMember(Register reg) throws Exception {
		MemberVO mmail = dao.selectByEmail(reg.getMmail());
		if(mmail != null) {
			throw new ExistingEmailException(reg.getMmail()+" is duplicate email. ");
		}
		dao.insertMember(reg);
	}


	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception{
		boolean result = dao.loginCheck(vo);
		if (result) {
			session.setAttribute("mid", vo.getMid());
			session.setAttribute("mvalue", vo.getMvalue());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) throws Exception{
		session.invalidate();
	}

	@Override
	public String findId(String mname, String mmail) throws Exception {
		return dao.FindId(mname, mmail);
	}

	@Override
	public boolean findPw(String mid, String mname, String mmail) throws Exception{
		boolean result =  dao.findPw(mid, mname, mmail);
		return result;
	}

	@Override
	public void updatePwResult(MemberVO vo) throws Exception{
		dao.updatePwResult(vo);
		
	}

	@Override
	public MemberVO info(String mid) throws Exception {
		return dao.info(mid);
	}

	@Override
	public void updateInfo(MemberVO vo) throws Exception {
		dao.updateInfo(vo);
		
	}

	@Override
	public boolean checkPw(String mid, String mpw) throws Exception {
		return dao.checkPw(mid, mpw);
	}

	@Override
	public void dropMember(String mid) throws Exception {
		dao.dropMember(mid);
		
	}

	@Override
	public MemberVO checkId(String mid) throws Exception {
		return dao.checkId(mid);
	}


	@Override
	public List<BoardVO> myBoardWrite(Criteria cri) throws Exception {
		return dao.myBoardWrite(cri);
	}


	@Override
	public int countMyBoard() throws Exception {
		return dao.countMyBoard();
	}


	@Override
	public List<ReplyVO> myReplyWrite(Criteria cri) throws Exception {
		return dao.myReplyWrite(cri);
	}


	@Override
	public int countMyReply() throws Exception {
		return dao.countMyReply();
	}



	
}
