package com.company.spring.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberVO;
import com.company.spring.product.ProductVO;
import com.company.spring.reply.ReplyVO;
import com.company.spring.utils.CriteriaAdmin;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO dao;
	
	@Override
	public void upload(ProductVO vo) throws Exception {
		dao.upload(vo);
	}
	@Override
	public ProductVO modify(int pidx) throws Exception {
		return dao.modify(pidx);
	}
	@Override
	public void productModify(ProductVO vo) throws Exception {
		dao.productModify(vo);
	}
	@Override
	public void productDelete(int pidx) throws Exception {
		dao.productDelete(pidx);
	}
	@Override
	public List<MemberVO> memberList(CriteriaAdmin cria) throws Exception {
		return dao.memberList(cria);
	}
	@Override
	public List<BoardVO> boardList(CriteriaAdmin cria) throws Exception {
		return dao.boardList(cria);
	}
	@Override
	public List<ReplyVO> replyList(CriteriaAdmin cria) throws Exception {
		return dao.replyList(cria);
	}
	@Override
	public void replyDelete(int ridx) throws Exception {
		dao.replyDelete(ridx);
	}
	@Override
	public void memberDrop(String mid) throws Exception {
		dao.memberDrop(mid);
	}
	@Override
	public int countMember() throws Exception {
		return dao.countMember();
	}
	@Override
	public int countBoard() throws Exception {
		return dao.countBoard();
	}
	@Override
	public int countReply() throws Exception {
		return dao.countReply();
	}

}
