package com.company.spring.board;

import java.util.List;

import com.company.spring.utils.Criteria;
import com.company.spring.utils.SearchCriteria;


public interface BoardService {
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	public void insert(BoardVO vo) throws Exception;
	public BoardVO read(int bidx) throws Exception;
	public BoardVO updateCnt(int bidx) throws Exception;
	public BoardVO updateRead(int bidx) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(int bidx) throws Exception;
	// 게시물 총 목록
	public int listCount() throws Exception;
	// 검색 결과 목록
	public int countSearch(SearchCriteria scri) throws Exception;
}
