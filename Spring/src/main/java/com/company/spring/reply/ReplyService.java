package com.company.spring.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface ReplyService {
	public void insert(ReplyVO vo) throws Exception;
	public List<ReplyVO> list(int bidx, HttpSession session) throws Exception;
	public ReplyVO detail(int ridx) throws Exception;
	public void modify(ReplyVO vo) throws Exception;
	public void delete(int ridx) throws Exception;

}
