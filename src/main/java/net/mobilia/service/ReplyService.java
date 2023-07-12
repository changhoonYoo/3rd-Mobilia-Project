package net.mobilia.service;

import java.util.List;

import net.mobilia.vo.ReplyVO;

public interface ReplyService {

	void replyInsert(ReplyVO rvo);

	List<ReplyVO> replyList(int board_no);

    
}
