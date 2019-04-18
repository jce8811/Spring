package com.company.spring.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.spring.board.BoardVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.Criteria;

@Repository
public class MemberDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	public void insertMember(Register reg) throws Exception{
		sqlsession.insert("member.insertMember", reg);
	}

	public boolean loginCheck(MemberVO vo) throws Exception{
		String mid = sqlsession.selectOne("member.checkLogin", vo);
		return (mid == null)? false : true;
	}

	public void logout(HttpSession session) throws Exception{
		
	}

	public String FindId(String mname, String mmail) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("mname", mname);
		map.put("mmail", mmail);
		return sqlsession.selectOne("member.findId", map);
	}

	public boolean findPw(String mid, String mname, String mmail) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("mid", mid);
		map.put("mname", mname);
		map.put("mmail", mmail);
		map = sqlsession.selectOne("member.findPw", map);
		return (map == null)? false : true;
	}

	public void updatePwResult(MemberVO vo) throws Exception{
		sqlsession.update("member.updatePw",vo);
	}

	public MemberVO info(String mid) throws Exception{
		return sqlsession.selectOne("member.info", mid);
	}

	public void updateInfo(MemberVO vo) throws Exception{
		sqlsession.update("member.updateInfo",vo);
		
	}

	public boolean checkPw(String mid, String mpw) throws Exception{
		boolean result = false;
		Map<String, String> map = new HashMap<String,String>();
		map.put("mid", mid);
		map.put("mpw", mpw);
		int count = sqlsession.selectOne("member.checkPw", map);
		if(count == 1) {
			result= true;
		}
		return result;
	}

	public void dropMember(String mid) throws Exception{
		sqlsession.delete("member.dropMember", mid);
	}

	public MemberVO checkId(String mid) throws Exception {
		return sqlsession.selectOne("member.checkId", mid);
	}

	public MemberVO selectByEmail(String mmail) {
		return (MemberVO)sqlsession.selectOne("member.selectByEmail", mmail);
	}

	public List<BoardVO> myBoardWrite(Criteria cri) {
		return sqlsession.selectList("member.myBoardWrite", cri);
	}

	public int countMyBoard() {
		return sqlsession.selectOne("member.countMyBoard");
	}

	public List<ReplyVO> myReplyWrite(Criteria cri) {
		return sqlsession.selectList("member.myReplyWrite", cri);
	}

	public int countMyReply() {
		return sqlsession.selectOne("member.countMyReply");
	}

}
