package com.springbootproject.bbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootproject.bbs.domain.Board;
import com.springbootproject.bbs.domain.Post;
import com.springbootproject.bbs.domain.Reply;
import com.springbootproject.bbs.mapper.PostMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PostService {
	
	@Autowired
	private PostMapper postMapper;
	
	public Integer getPrePostNo(int currentPostNo, int boardNo) {		
		return postMapper.prePost(currentPostNo,boardNo);
	}
	
	public Integer getNextPostNo(int currentPostNo, int boardNo) {		
		return postMapper.nextPost(currentPostNo, boardNo);
	}
	
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	public Map<String, Object> postList(int pageNum, @Param("boardNo") int boardNo, String type, String keyword) {
		log.info("postList(int pageNum, int boardNo, String type, String keyword");
				
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		List<Post> pList = postMapper.postList(startRow, PAGE_SIZE, boardNo, type, keyword);
			
		int listCount = postMapper.getPostCount(type, keyword, boardNo);

		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);

		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);

		int endPage = startPage + PAGE_GROUP - 1;
		

		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
					
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("pList", pList);
		resultMap.put("pageCount", pageCount);
		resultMap.put("startPage", startPage);
		resultMap.put("endPage", endPage);
		resultMap.put("currentPage", currentPage);
		resultMap.put("listCount", listCount);
		resultMap.put("pageGroup", PAGE_GROUP);
		resultMap.put("searchOption", searchOption);
		if(searchOption) {
			resultMap.put("type", type);
			resultMap.put("keyword", keyword);
		}
	
		return resultMap;
	}
		
	public Post getPost(int postNo, boolean isCount) {
		log.info("PostService: getPost(int postNo, boolean isCount)");
		
		if(isCount) {
			postMapper.incrementReadCount(postNo);
		}
		return postMapper.getPost(postNo);		
	}
	

	
	public List<Post> notification(int boardNo) {
        return postMapper.notification(boardNo);
    }
	
    public List<Post> getTopPosts() {
        return postMapper.getTopPosts();
    }
	
	public void insertPost(Post post) {
		log.info("PostService: insertBoard(Board board)");
		postMapper.insertPost(post);
	}
	
	public void updatePost(Post post) {
		log.info("PostService: updateBoard(Board board)");
		postMapper.updatePost(post);
	}
	
	public void deletePost(int postNo) {
		log.info("PostService: deleteBoard(int post_no)");
		postMapper.deletePost(postNo);
	}
		
	public Map<String, Integer> recommend(int postNo, String like) {
		postMapper.updateRecommend(postNo, like);

		Post post = postMapper.getRecommend(postNo);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("good", post.getGood());
		map.put("bad", post.getBad());
		return map;
	}
		
	public List<Reply> replyList(int postNo) {
		return postMapper.replyList(postNo);
	}
	
	public void addReply(Reply reply) {
		postMapper.addReply(reply);
	}
	
	public void updateReply(Reply reply) {
		postMapper.updateReply(reply);

	}
	
	public void deleteReply(int replyNo) {
		postMapper.deleteReply(replyNo);
	}
	
	public void deleteAllReply(int postNo) {
		log.info("PostService: deleteAllReply(int post_no)");
		postMapper.deleteAllReply(postNo);
	}
	
	
}
