package net.mobilia.dao;

import java.util.List;

import net.mobilia.vo.ReplyVO;

public interface ReplyDAO {

	void replyInsert(ReplyVO rvo);

	List<ReplyVO> replyList(int board_no);

}
