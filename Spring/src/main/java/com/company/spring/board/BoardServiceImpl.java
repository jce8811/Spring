package com.company.spring.board;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;
	
	@Override
	public void insert(BoardVO vo) throws Exception {
		String btitle = vo.getBtitle();
		String bcontent = vo.getBcontent();
		String bwriter = vo.getBwriter();
		
		vo.setBtitle(btitle);
		vo.setBcontent(bcontent);
		vo.setBwriter(bwriter);
		dao.insert(vo);
		
	}

	@Override
	public BoardVO read(int bidx) throws Exception {
		return dao.read(bidx);
	}

	@Override
	public List<BoardVO> list(String searchOption, String keyword) throws Exception {
		return dao.list(searchOption, keyword);
	}

	@Override
	public BoardVO updateCnt(int bidx) throws Exception {
		dao.updateCnt(bidx);
		return dao.read(bidx);
		
	}

	@Override
	public BoardVO updateRead(int bidx) throws Exception {
		return dao.updateRead(bidx);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int bidx) throws Exception {
		dao.delete(bidx);
	}



}
