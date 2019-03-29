package com.company.spring.reply;

import java.util.List;

public interface ReplyService {
	public void insert(ReplyVO vo) throws Exception;
	public List<ReplyVO> list(int bidx) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(ReplyVO vo) throws Exception;

}
