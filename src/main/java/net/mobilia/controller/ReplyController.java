package net.mobilia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.mobilia.service.ReplyService;
import net.mobilia.vo.ReplyVO;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글 등록
	@RequestMapping(value="")
	public ResponseEntity<String> replyIn(@RequestBody ReplyVO rvo){
		ResponseEntity<String> entity = null;
		try {
			this.replyService.replyInsert(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//댓글 목록
	@RequestMapping(value="/all/{board_no}", produces="application/json")
	public ResponseEntity<List<ReplyVO>> reply_list(
			@PathVariable("board_no") int board_no){
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(
					this.replyService.replyList(board_no),
					HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
