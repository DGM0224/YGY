package com.springbootproject.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springbootproject.bbs.domain.Post;
import com.springbootproject.bbs.domain.Reply;

@Mapper
public interface PostMapper {
	
		
	public List<Post> postList(@Param("startRow") int startRow, @Param("num") int num, @Param("boardNo")int boardNo,
							@Param("type") String type, @Param("keyword") String keyword);
	
	public int getPostCount(@Param("type") String type, @Param("keyword") String keyword, @Param("boardNo")int boardNo);
	
	public Post getPost(int postNo);
	
	Integer prePost(@Param("currentPostNo") int currentPostNo, @Param("boardNo")int baordNo);
	
	Integer nextPost(@Param("currentPostNo")int currentPostNo, @Param("boardNo")int boardNo);
	
	List<Post> notification(int boardNo);
	
	List<Post> getTopPosts();
	
	public void insertPost(Post post);
	
	public void updatePost(Post post);
	
	public void deletePost(int postNo);
	
	public void incrementReadCount(int postNo);
	
	public List<Reply> replyList(int postNo);
	
	public void updateRecommend(@Param("postNo") int postNo, @Param("like") String like);

	public Post getRecommend(int postNo);
			
	public void addReply(Reply reply);
	
	public void updateReply(Reply reply);
	
	public void deleteReply(int relpyNo);
	
	public void deleteAllReply(int postNo);

}
