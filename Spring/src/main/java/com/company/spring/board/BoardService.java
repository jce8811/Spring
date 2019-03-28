package com.company.spring.board;

import java.util.List;


public interface BoardService {
	public List<BoardVO> listSearch(SearchCriteria scri) throws Exception;
	public void insert(BoardVO vo) throws Exception;
	public BoardVO read(int bidx) throws Exception;
	public BoardVO updateCnt(int bidx) throws Exception;
	public BoardVO updateRead(int bidx) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(int bidx) throws Exception;
	public int countSearch(SearchCriteria scri) throws Exception;
}
