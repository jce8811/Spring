package com.company.spring.board;

import java.util.List;


public interface BoardService {
	public void insert(BoardVO vo) throws Exception;
	public BoardVO read(int bidx) throws Exception;
	public List<BoardVO> list(String searchOption, String keyword) throws Exception;
	public BoardVO updateCnt(int bidx) throws Exception;
	public BoardVO updateRead(int bidx) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(int bidx) throws Exception;
}
