package com.company.spring.admin;

import java.util.List;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberVO;
import com.company.spring.product.ProductVO;
import com.company.spring.reply.ReplyVO;

public interface AdminService {
	public void upload(ProductVO vo) throws Exception;
	public ProductVO modify(int pidx) throws Exception;
	public void productModify(ProductVO vo) throws Exception;
	public void productDelete(int pidx) throws Exception;
	public List<MemberVO> memberList() throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<ReplyVO> replyList() throws Exception;
}
