package com.company.spring.board;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.spring.utils.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
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

	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}





}
