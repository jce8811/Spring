package com.company.spring.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.spring.board.BoardVO;
import com.company.spring.member.MemberVO;
import com.company.spring.product.ProductVO;
import com.company.spring.reply.ReplyVO;

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
	public List<MemberVO> memberList() throws Exception {
		return dao.memberList();
	}
	@Override
	public List<BoardVO> boardList() throws Exception {
		return dao.boardList();
	}
	@Override
	public List<ReplyVO> replyList() throws Exception {
		return dao.replyList();
	}

}
