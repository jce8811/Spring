package com.company.spring.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.company.spring.board.BoardVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.Criteria;

public interface MemberService {
	public void insertMember(Register reg) throws Exception;
	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception;
	public void logout(HttpSession session) throws Exception;
	public String findId(String mname, String mmail) throws Exception;
	public boolean findPw(String mid, String mname, String mmail) throws Exception;
	public void updatePwResult(MemberVO vo) throws Exception;
	public MemberVO info(String mid) throws Exception;
	public void updateInfo(MemberVO vo) throws Exception;
	public boolean checkPw(String mid, String mpw) throws Exception;
	public void dropMember(String mid) throws Exception;
	public MemberVO checkId(String mid) throws Exception;
	public List<BoardVO> myBoardWrite(Criteria cri) throws Exception;
	public int countMyBoard() throws Exception;
	public List<ReplyVO> myReplyWrite(Criteria cri) throws Exception;
	public int countMyReply() throws Exception;
	
}
