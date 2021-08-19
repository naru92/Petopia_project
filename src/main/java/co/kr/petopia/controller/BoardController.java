package co.kr.petopia.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.BoardService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.service.ReplyService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.FileUploadVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ReplyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class BoardController {

	@Autowired
	private final BoardService boardService;
	
	@Autowired
	private final MemberService memberService; 
	
	@Autowired
	private final ReplyService replyService; 
	
	@Autowired
	private AdminService adminService;
//****************** 공지사항 **********************

	// 리스트 불러오기(페이징 처리)
	
	//공지 CRUD -S-
	@GetMapping("/notice")
	public String noticeList(Criteria cri, Model model, @RequestParam(value = "board_id",  defaultValue ="1") int board_id, 
			 Principal principal) {
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		Map<String, Object> pagingMap2 = new HashMap<String, Object>();
		
		log.info("--------------------------");
		log.info("noticeList...........");

		pagingMap.put("cri", cri);
		pagingMap.put("board_id", 1);
		String boardName = boardService.getBoardInfo(1);
		log.info("pagimap : " + pagingMap);
		int total = boardService.getTotal(pagingMap);
		log.info(total);
		
		pagingMap2.put("cri", cri);
		pagingMap2.put("board_id", 1);
		log.info(pagingMap2);
		boardService.getContentListPaging(pagingMap2);
		model.addAttribute("board_id" , board_id);
		 model.addAttribute("pageMaker", new PageVO(cri, total));
		 model.addAttribute("board_name" , boardName);
		 model.addAttribute("contentList", boardService.getContentListPaging(pagingMap2));
				

		return "board/notice";

	}

	// 해당 게시물 불러오기 
	@GetMapping("/notice/get")
	public String noticeGet(@RequestParam("board_id") int board_id, @RequestParam("content_idx") Long content_idx, Model model) {

		model.addAttribute("board", boardService.getContent(content_idx));
		
		return "board/notice_read";
	}
	
	@GetMapping("/notice/register")
	public String noticeRegister(@ModelAttribute("noticeContentVO") BoardVO noticeContentVO,
			@RequestParam(value = "board_id", defaultValue = "1") int board_id) {
		log.info("notice = " + noticeContentVO);
		

		return "/board/insert_notice";
	}

	// 글 작성
	@PostMapping("/notice/register")
	public String noticeRegister_pro(@ModelAttribute("noticeContentVO") BoardVO noticeContentVO,
			@RequestParam(value = "board_id", defaultValue = "1") int board_id) {

		log.info("board: " + noticeContentVO);
		noticeContentVO.setMember_id("47");
		noticeContentVO.setBoard_id(board_id);
		boardService.contentRegister(noticeContentVO);


		return "board/register_success";
	}
	
	
	@GetMapping("notice/modify")
	public String modify(@RequestParam("board_id") int board_info_idx,
							@RequestParam("content_idx") int content_idx,
							@ModelAttribute("modifyContentVO") BoardVO modifyContentVO,
							Model model) {
		
		log.info("modify_get()...");
		
		model.addAttribute("board_info_idx" , board_info_idx);
		model.addAttribute("content_idx" , content_idx);
		
		BoardVO tempContentBean = boardService.getContent((long)content_idx);
		
		
		modifyContentVO.setContent_date(tempContentBean.getContent_date());
		modifyContentVO.setContent_title(tempContentBean.getContent_title());
		modifyContentVO.setContent_text(tempContentBean.getContent_text());
		modifyContentVO.setBoard_id(board_info_idx);
		modifyContentVO.setContent_idx(content_idx);
		
		return "board/notice_modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyContentVO") BoardVO modifyContentVO) {
		
		
		log.info("modify_post()...");
		boardService.modifyContentInfo(modifyContentVO);
		
		return "board/notice_modifySuccess";
	}
	


	// 글 삭제
	@GetMapping("/notice/remove")
	public String noticeRemove(@RequestParam("board_id") int board_info_idx,
			 @RequestParam("content_idx") int content_idx,
			 Model model) {

		boardService.deleteContentInfo(content_idx);
		
		model.addAttribute("board_info_idx", board_info_idx);
		
		return "board/notice_removeSuccess";
	}
	//공지 CRUD -END-
	
	/****************** 문의하기 **********************/
	
	@GetMapping("/board/qna")
	public String inquiryList(@RequestParam int board_id ,Criteria cri, Model model) {
		
		log.info("qna view()..");
		return "board/qna_main";

	}

	// 해당 게시물 불러오기 ( jsp 만든 후 string으로 바꿔서 return 해줘야함 )
	@GetMapping("/board/my_qna")
	public String inquiryGet(
							 @RequestParam int board_id, Model model, Principal principal, BoardVO boardVO, ReplyVO replyVO) {
		
		//id로 가져오기
		MemberVO member = memberService.getSelectMemberInfo(principal.getName());
		
		log.info("맴버정보: " + member);
		
		boardVO.setBoard_id(board_id);
		boardVO.setMember_id(member.getMember_id());
		boardVO.setAuthority(member.getAuthority());
		
		log.info("게시글정보 " + boardVO);
		
		List<BoardVO> myQnaList= boardService.getQnaList(boardVO);
		
		
		model.addAttribute("myQnaList" , myQnaList);
		

		return "board/qna_my_qna";
	}

	// 글 작성
	@GetMapping("/board/qna_register")
	public String inquiryRegister(@RequestParam int board_id, Model model,
								  @ModelAttribute("qnaContentVO") BoardVO qnaContentVO, Principal principal ) {
		log.info("board: " + qnaContentVO);
		qnaContentVO.setMember_id(principal.getName());
		
		return "/board/qna_register";
	}
	
	@PostMapping("/board/qna_register")
	public String inquiryRegister_pro(@RequestParam int board_id, Model model,
								  @ModelAttribute("qnaContentVO") BoardVO qnaContentVO, Principal principal ) {
		log.info("board: " + qnaContentVO);
	
		qnaContentVO.setMember_id(principal.getName());
		boardService.contentRegister(qnaContentVO);
		return "/board/qna_register_success";
	}
	
	
	@GetMapping("/board/my_qna/update")
	public String myQnamodify(@RequestParam("board_id") int board_info_id,
							@RequestParam("content_idx") int content_idx,
							@ModelAttribute("modifyQnaVO") BoardVO modifyQnaVO,
							Model model) {
		
		log.info("modify_get()...");
		
		model.addAttribute("board_info_idx" , board_info_id);
		model.addAttribute("content_idx" , content_idx);
		
		BoardVO tempQnaBean = boardService.getContent((long)content_idx);
		
		
		modifyQnaVO.setContent_date(tempQnaBean.getContent_date());
		modifyQnaVO.setContent_title(tempQnaBean.getContent_title());
		modifyQnaVO.setContent_text(tempQnaBean.getContent_text());
		modifyQnaVO.setBoard_id(board_info_id);
		modifyQnaVO.setContent_idx(content_idx);
		modifyQnaVO.setMember_id(tempQnaBean.getMember_id());
		
		return "board/qna_modify";
	}
	
	@PostMapping("/board/my_qna/update_pro")
	public String myQnamodify_pro(@ModelAttribute("modifyQnaVO") BoardVO modifyQnaVO , @RequestParam("board_id") int board_info_id) {
		
		
		log.info("modify_post()...");
		boardService.modifyContentInfo(modifyQnaVO);
		
		return "board/qna_modify_success";
	}
	
		//QNA 삭제
		@DeleteMapping(value = "/board/my_qna/deleteQna",	consumes = "application/json",  
					   produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE}) 
		@ResponseBody
		public ResponseEntity<String> deleteMyQna(BoardVO boardVO, @RequestBody String content_idx) { 
			
			log.info("deleteMyQna() : " + content_idx);
			
			int count = 0;
			int qna_idx = Integer.parseInt(content_idx);
			
			log.info("delete QnA(), 지워질 QNA 번호 : " +  qna_idx );
			count = boardService.deleteContent(qna_idx);
			
			log.info("삭제 성공시 1이 출력됩니다 : " +count);
			
			return count >= 1
					? new ResponseEntity<> ("Success", HttpStatus.OK)
					: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
	
	/****************** 이벤트 **********************/

	// 리스트 불러오기
	@GetMapping("/event")
	public String eventList(Model model) {

		log.info("eventList...........");

		model.addAttribute("contentList", boardService.getContentList(3L));

		return "board/event";

	}
	// 해당 게시물 불러오기
	@GetMapping("/event/detail")
	public String eventGet(@RequestParam("content_idx") Long content_idx, Model model) {

		model.addAttribute("board", boardService.getContent(content_idx));

		return "board/event_detail";
	}

	// 글 작성
	@PostMapping("/event/register")
	public String eventRegister(BoardVO board, RedirectAttributes rttr) {

		log.info("board: " + board);

		boardService.contentRegister(board);

		rttr.addFlashAttribute("result", board.getContent_idx());

		return "redirect:/event";
	}

	// 글 수정
	@PostMapping("/event/modify")
	public String eventModify(BoardVO board, RedirectAttributes rttr) {

		int count = boardService.contentModify(board);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/event";
	}

	// 글 삭제
	@PostMapping("/event/remove")
	public String eventRemove(@RequestParam("content_idx") Long content_idx, RedirectAttributes rttr) {

		int count = boardService.contentRemove(content_idx);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/event";
	}

	/****************** 펫스타그램 **********************/

	// 리스트 불러오기
	@GetMapping("/petstagram")
	public String petstagramList(Model model, Principal principal, HttpServletRequest request,
	                            @RequestParam(value = "board_id", defaultValue = "4") Long board_id) {

		log.info("petstagramList...........");
		
		List<BoardVO> contentList = boardService.getContentList(board_id);
		boolean idChk = true;
		
		for (BoardVO boardVO : contentList) {
		    
            List<FileUploadVO> imgList = boardService.getImgList(boardVO);
            boardVO.setAttachList(imgList);
            log.info("boardVO..........." + boardVO);
            
            if (principal != null) {
                if(! principal.getName().trim().equals(boardVO.getMember_id().trim())) {
                    idChk = false;
                }
            }
		}
		
		model.addAttribute("contentList", contentList);
		
		if (principal != null) {
    		String member_id = principal.getName();
    		model.addAttribute("member_id",member_id);
    		model.addAttribute("idChk",idChk);
    		log.info(member_id);
		}
		
		return "board/petstagram";
	}

//	// 해당 게시물 불러오기
//	@GetMapping({ "/petstagram/get", "/petstagram/modify" })
//	public void petstagramGet(@RequestParam("content_idx") Long content_idx, Model model) {
//
//		model.addAttribute("board", boardService.getContent(content_idx));
//	}

	// 글 작성
	@PostMapping("/petstagram/register")
	public String petstagramRegister(BoardVO board, RedirectAttributes rttr,
	        @RequestParam(value = "board_id", defaultValue = "4") int board_id) throws Exception {

		log.info("board: " + board);

		board.setBoard_id(board_id);

		boardService.petstagramRegister(board);

		rttr.addFlashAttribute("result", board.getContent_idx());
        
		return "redirect:/petstagram";
	}

	// 글 수정
	@PostMapping("/petstagram/modify")
	public String petstagramModify(BoardVO board, RedirectAttributes rttr) {

		int count = boardService.contentModify(board);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/petstagram";
	}

	// 글 삭제
	@PostMapping("/petstagram/remove")
	public String petstagramRemove(@RequestParam("content_idx") Long content_idx, RedirectAttributes rttr) {

		int count = boardService.contentRemove(content_idx);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/petstagram";
	}
	
	
	/****************** 기부 **********************/
	
 
    
    @GetMapping("member/gameplay")
    public String game() {
    	return "/board/gameEvent";
    }
	/*
	 * // 기부 메인
	 * 
	 * @GetMapping("/donation") public String donation() { return "board/donation";
	 * }
	 */
}
