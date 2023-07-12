package net.mobilia.dao;

import java.util.List;

import net.mobilia.vo.BoardVO;
import net.mobilia.vo.ReviewVO;

public interface BoardDAO {

	int getListCount(BoardVO findbvo);
	
	int getReviewCount(ReviewVO findrvo);
	
	List<ReviewVO> getReviewList(ReviewVO findrvo);
	
	void cntUpdate();
	
	List<BoardVO> getBoardList(BoardVO findbvo);
	
	String getPwd(String id);

	void insertBoard(BoardVO bvo);

	void updateHit(String board_no);

	BoardVO getBoardCont(String board_no);
	
	BoardVO getQnaCheck(String board_no);

	void editBoard(BoardVO editbvo);

	void delBoard(String board_no);

}
