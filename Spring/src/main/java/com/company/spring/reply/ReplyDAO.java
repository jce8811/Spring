package com.company.spring.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public void insert(ReplyVO vo) {
		sqlsession.insert("reply.insert", vo);
	}

	public List<ReplyVO> list(int bidx) {
		return sqlsession.selectList("reply.list", bidx);
	}
	
	public ReplyVO detail(int ridx) {
		return sqlsession.selectOne("reply.detail", ridx);
	}
	
	public void modify(ReplyVO vo) {
		sqlsession.update("reply.modify", vo);
	}
	
	public void delete(int ridx) {
		sqlsession.delete("reply.delete", ridx);
	}

}
