package com.company.spring.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberVO;
import com.company.spring.product.ProductVO;
import com.company.spring.reply.ReplyVO;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public void upload(ProductVO vo) throws Exception{
		sqlsession.selectOne("admin.upload", vo);
	}

	public ProductVO modify(int pidx) throws Exception{
		return sqlsession.selectOne("admin.modify", pidx);
	}

	public void productModify(ProductVO vo) throws Exception{
		sqlsession.update("admin.productModify", vo);
	}

	public void productDelete(int pidx) throws Exception{
		sqlsession.delete("admin.productDelete", pidx);
	}

	public List<MemberVO> memberList() throws Exception{
		return sqlsession.selectList("admin.memberList");
	}

	public List<BoardVO> boardList() {
		return sqlsession.selectList("admin.boardList");
	}

	public List<ReplyVO> replyList() {
		return sqlsession.selectList("admin.replyList");
	}
}
