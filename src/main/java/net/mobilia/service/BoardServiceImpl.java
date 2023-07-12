package net.mobilia.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import net.mobilia.dao.BoardDAO;
import net.mobilia.vo.BoardVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.ReviewVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDao;

	@Override
	public int getListCount(BoardVO findbvo) {
		
		return bDao.getListCount(findbvo);
	}

	@Override
	public int getReviewCount(ReviewVO findrvo) {
		
		return bDao.getReviewCount(findrvo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO findrvo) {
		
		return bDao.getReviewList(findrvo);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public List<BoardVO> getBoardList(BoardVO findbvo) {
		bDao.cntUpdate();
		return bDao.getBoardList(findbvo);
	}

	@Override
	public String getPwd(String id) {
		
		return bDao.getPwd(id);
	}
	
	@Override
	public void insertBoard(BoardVO bvo) {
		
		bDao.insertBoard(bvo);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO getBoardCont(String board_no) {
		
		bDao.updateHit(board_no);
		return bDao.getBoardCont(board_no);
	}

	@Override
	public BoardVO getEditCont(String board_no) {
		
		return bDao.getBoardCont(board_no);
	}

	@Override
	public BoardVO getQnaCheck(String board_no) {
		
		return bDao.getQnaCheck(board_no);
	}
	
	
	@Override
	public void editBoard(BoardVO editbvo) {
		
		bDao.editBoard(editbvo);
	}

	@Override
	public void delBoard(String board_no) {
		
		bDao.delBoard(board_no);
	}





}
	
	

	
	
	
