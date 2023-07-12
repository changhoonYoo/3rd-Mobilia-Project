package net.mobilia.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.mobilia.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void replyInsert(ReplyVO rvo) {
		
		sqlSession.insert("reply_insert", rvo);
	}

	@Override
	public List<ReplyVO> replyList(int board_no) {
		
		return sqlSession.selectList("reply_list", board_no);
	}

	
}
