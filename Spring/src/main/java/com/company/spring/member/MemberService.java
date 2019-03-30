package com.company.spring.member;

import javax.servlet.http.HttpSession;

public interface MemberService {
	//public void insertMember(MemberVO vo) throws Exception;
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
	public void register(Register reg) throws Exception;
	
}
