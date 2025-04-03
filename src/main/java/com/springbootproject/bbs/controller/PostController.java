package com.springbootproject.bbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.springbootproject.bbs.domain.Board;
import com.springbootproject.bbs.domain.Member;
import com.springbootproject.bbs.domain.Post;
import com.springbootproject.bbs.domain.Reply;
import com.springbootproject.bbs.service.BoardService;
import com.springbootproject.bbs.service.PostService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PostController {
	
	@Autowired
	private PostService postService;
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/")
	public String home(Model model) {
		int boardNo = 7000;
	    List<Post> notifications = postService.notification(boardNo);
	    List<Post> topPosts = postService.getTopPosts();

	    model.addAttribute("topPosts", topPosts);
	    model.addAttribute("notifications", notifications);

	    return "views/board";
	}
		
	@GetMapping("/postList")
	public String searchPostList(Model model, @RequestParam("boardNo") int boardNo, 
								@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
								@RequestParam(value="type", required=false, defaultValue="null") String type,
								@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		
		String imageUrl = switch (boardNo) {
			case 1000 -> "/images/asia.jpg";
			case 2000 -> "/images/europe.jpg";
			case 3000 -> "/images/oceania.jpg";
			case 4000 -> "/images/NAmerica.jpg";
			case 5000 -> "/images/SAmerica.jpg";
			case 6000 -> "/images/africa.jpg";
			case 7000 -> "/images/notice.png";
			default -> "none";
		};
		model.addAttribute("backgroundImage", imageUrl);
		
		model.addAttribute("board", boardService.getBoard(boardNo));	
		
		Map<String, Object> resultMap = postService.postList(pageNum, boardNo, type, keyword);
		model.addAllAttributes(resultMap);
			
		return "views/postList";
	}
		
	@GetMapping("/postDetail")
	public String getPost(Model model, @RequestParam("postNo") int postNo,
						@RequestParam("boardNo") int boardNo,
						@RequestParam(value="pageNum", defaultValue="1") int pageNum,
						@RequestParam(value="type", defaultValue="null") String type,
						@RequestParam(value="keyword", defaultValue="null") String keyword,
						HttpSession session) {		
					
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		model.addAttribute("board", boardService.getBoard(boardNo));
		model.addAttribute("post", postService.getPost(postNo, true));	
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		Integer previousPostNo = postService.getPrePostNo(postNo, boardNo);
	    Integer nextPostNo = postService.getNextPostNo(postNo, boardNo);

	    model.addAttribute("previousPostNo", previousPostNo);
	    model.addAttribute("nextPostNo", nextPostNo);
	    Member member = (Member) session.getAttribute("member");
	    if (member != null) {
	        model.addAttribute("memberId", member.getMemberId());
	    }
		
		List<Reply> replyList = postService.replyList(postNo);
		model.addAttribute("replyList", replyList);
		
		return "views/postDetail";
	}
				
	@RequestMapping("/write")
	public String writePost() {
		return "views/postWrite";
	}
	
	private static final String DEFAULT_PATH = "src/main/resources/static/files/";
	
	@PostMapping("/addPost")
	public String insertPost(Post post, @RequestParam("boardNo") int boardNo,
							@RequestParam(value="addFile", required=false) MultipartFile multipartFile,
							RedirectAttributes reAttrs) 
									throws IOException	{
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		if (multipartFile != null && !multipartFile.isEmpty()) {
		
			File parent = new File(DEFAULT_PATH);
			if (!parent.isDirectory() && !parent.exists()) {
				parent.mkdirs();
			}
			
			UUID uid = UUID.randomUUID();
			String extension = StringUtils.getFilenameExtension(multipartFile.getOriginalFilename());
			String saveName = uid.toString() + "." + extension;
			File file = new File(parent.getAbsolutePath(), saveName);
	
			log.info("file abs path : " + file.getAbsolutePath());
			log.info("file path : " + file.getPath());

			multipartFile.transferTo(file);

			post.setFile1(saveName);

			} else {
				log.info("No file uploaded - 파일이 업로드 되지 않음");
			}
		
		Board board = boardService.getBoard(boardNo);
		post.setBoardNo(board.getBoardNo());
				
		postService.insertPost(post);
		
		reAttrs.addFlashAttribute("addPostMessage", "게시글 작성이 완료되었습니당~");
				
		return "redirect:postList?boardNo=" + boardNo;
	}
	
	@PostMapping("/update")
	public String update(Model model, @RequestParam("postNo") int postNo,
						@RequestParam(value="pageNum", defaultValue="1") int pageNum,
						@RequestParam(value="type", defaultValue="null") String type,
						@RequestParam(value="keyword", defaultValue="null") String keyword) {
		Post post = postService.getPost(postNo, false);
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		model.addAttribute("post", post);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		return "views/postUpdate";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(Post post, RedirectAttributes reAttrs,
							@RequestParam("boardNo") int boardNo, @RequestParam("postNo") int postNo,
							@RequestParam(value="pageNum", defaultValue="1") int pageNum,
							@RequestParam(value="type", defaultValue="null") String type,
							@RequestParam(value="keyword", defaultValue="null") String keyword) {
		Board board = boardService.getBoard(boardNo);
		post.setBoardNo(board.getBoardNo());	
			
		postService.updatePost(post);
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		

		reAttrs.addAttribute("boardNo", boardNo);
		reAttrs.addAttribute("searchOption", searchOption);
		reAttrs.addAttribute("pageNum", pageNum);
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);
		}
		
		reAttrs.addFlashAttribute("updatePostMessage", "게시글 수정이 완료되었습니당~");
		
		return "redirect:/postList";
	}
	
	@PostMapping("/delete")
	public String deletePost(RedirectAttributes reAttrs, HttpServletResponse response, PrintWriter out,
							@RequestParam("boardNo") int boardNo, 
							@RequestParam("postNo") int postNo, 
							@RequestParam(value="pageNum", defaultValue="1") int pageNum,
							@RequestParam(value="type", defaultValue="null") String type,
							@RequestParam(value="keyword", defaultValue="null") String keyword) {	
				
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println(" alert('게시글이 삭제되었습니다.');");
		out.println("</script>");

		postService.deleteAllReply(postNo);
		postService.deletePost(postNo);
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
			
		reAttrs.addAttribute("boardNo", boardNo);
		reAttrs.addAttribute("pageNum", pageNum);
		reAttrs.addAttribute("searchOption", searchOption);
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);
		}
		
		reAttrs.addFlashAttribute("deletePostMessage", "게시글 삭제가 완료되었습니당~");
		
		return "redirect:postList";
	}		
	
	@GetMapping("/fileDownload")
	public void download(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		String fileName = request.getParameter("fileName");
		log.info("fileName : " + fileName);
		File parent = new File(DEFAULT_PATH);
		File file = new File(parent.getAbsolutePath(), fileName);
		log.info("file.getName() : " + file.getName());
	
		response.setContentType("application/download; charset=UTF-8");
		response.setContentLength((int) file.length());
	
		fileName = URLEncoder.encode(file.getName(), "UTF-8");
		log.info("다운로드 fileName : " + fileName);
	
		response.setHeader("Content-Disposition",
		"attachment; filename=\"" + fileName + "\";");
	
		response.setHeader("Content-Transfer-Encoding", "binary");
	
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
	
		fis = new FileInputStream(file);
	
		FileCopyUtils.copy(fis, out);
		if(fis != null) {
			fis.close();
		}
	
		out.flush();
	}
	
	

	

	
	
	
	
}
