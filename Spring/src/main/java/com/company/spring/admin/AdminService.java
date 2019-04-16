package com.company.spring.admin;

import java.util.List;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberVO;
import com.company.spring.product.ProductVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.CriteriaAdmin;

public interface AdminService {
	public void upload(ProductVO vo) throws Exception;
	public ProductVO modify(int pidx) throws Exception;
	public void productModify(ProductVO vo) throws Exception;
	public void productDelete(int pidx) throws Exception;
	public List<MemberVO> memberList(CriteriaAdmin cria) throws Exception;
	public List<BoardVO> boardList(CriteriaAdmin cria) throws Exception;
	public List<ReplyVO> replyList(CriteriaAdmin cria) throws Exception;
	public void replyDelete(int ridx) throws Exception;
	public void memberDrop(String mid) throws Exception;
	public int countMember() throws Exception;
	public int countBoard() throws Exception;
	public int countReply() throws Exception;
}
