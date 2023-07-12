package net.mobilia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.mobilia.dao.ReplyDAO;
import net.mobilia.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO rDao;

	@Override
	public void replyInsert(ReplyVO rvo) {
		
		rDao.replyInsert(rvo);
	}

	@Override
	public List<ReplyVO> replyList(int board_no) {
		
		return rDao.replyList(board_no);
	}

}
