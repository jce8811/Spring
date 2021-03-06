package com.company.spring.reply;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO dao;
	
	@Override
	public void insert(ReplyVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public List<ReplyVO> list(int bidx) throws Exception {
		return dao.list(bidx);
	}

	@Override
	public void delete(int ridx) throws Exception {
		dao.delete(ridx);
	}

	@Override
	public ReplyVO detail(int ridx) throws Exception {
		return dao.detail(ridx);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

}
