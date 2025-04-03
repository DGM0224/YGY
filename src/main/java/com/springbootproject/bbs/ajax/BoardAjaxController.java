package com.springbootproject.bbs.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springbootproject.bbs.domain.Member;
import com.springbootproject.bbs.domain.Reply;
import com.springbootproject.bbs.service.PostService;

import jakarta.servlet.http.HttpSession;

@RestController
public class BoardAjaxController {

@Autowired
private PostService postService;

@PostMapping("/like.ajax")
public Map<String, Integer> recommend(@RequestParam("postNo") int postNo, @RequestParam("like") String like) {

	return postService.recommend(postNo, like);
}

@PostMapping("/replyWrite.ajax")
public Map<String, Object> addReply(Reply reply, HttpSession session) {
	postService.addReply(reply);
	
	
	Map<String, Object> result = new HashMap<>();
	
	Member member = (Member) session.getAttribute("member");
	result.put("memberId", member.getMemberId());
	result.put("replyList", postService.replyList(reply.getPostNo()));
	
	return result;
}

@PatchMapping("/replyUpdate.ajax")
public Map<String, Object> updateReply(Reply reply, HttpSession session) {

	postService.updateReply(reply);
	
	Map<String, Object> result = new HashMap<>();
	
	Member member = (Member) session.getAttribute("member");
	result.put("memberId", member.getMemberId());
	result.put("replyList", postService.replyList(reply.getPostNo()));
	
	return result;
}

@DeleteMapping("/replyDelete.ajax")
public Map<String, Object>  deleteReply(Reply reply, HttpSession session, @RequestParam("replyNo") int replyNo, @RequestParam("postNo") int postNo) {

	postService.deleteReply(replyNo);
	
	Map<String, Object> result = new HashMap<>();
	
	Member member = (Member) session.getAttribute("member");
	result.put("memberId", member.getMemberId());
	result.put("replyList", postService.replyList(postNo));
	
	return result;
}


}
