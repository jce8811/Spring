package com.company.spring.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.spring.utils.SearchCriteria;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	// 게시글 목록
	public List<BoardVO> list(SearchCriteria scri) {
		return sqlsession.selectList("board.list", scri);
	}
	public void insert(BoardVO vo) throws Exception {
		sqlsession.insert("board.insert", vo);
	}
	public BoardVO read(int bidx) throws Exception {
		return sqlsession.selectOne("board.view", bidx);
	}
	public BoardVO updateRead(int bidx) throws Exception{
		return sqlsession.selectOne("board.updateview", bidx);
	}
	public void updateCnt(int bidx) throws Exception{
		sqlsession.update("board.updateCnt", bidx);
	}
	public void update(BoardVO vo) throws Exception{
		sqlsession.update("board.update", vo);
	}
	public void delete(int bidx) throws Exception{
		sqlsession.update("board.delete", bidx);
	}
	// 검색 결과 목록
	public int countSearch(SearchCriteria scri) throws Exception{
		return sqlsession.selectOne("board.countSearch", scri);
	}
	// 총 목록
	public int listCount() throws Exception{
		return sqlsession.selectOne("board.listCount");
	}
	
}
