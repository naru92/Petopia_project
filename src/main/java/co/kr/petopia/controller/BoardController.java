package co.kr.petopia.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.petopia.service.BoardService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.BoardVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class BoardController {

	@Autowired
	private final BoardService boardService;

//****************** 공지사항 **********************

	// 리스트 불러오기(페이징 처리)
	
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

	// 해당 게시물 불러오기 ( jsp 만든 후 string으로 바꿔서 return 해줘야함 )
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

	// 글 수정
	@PostMapping("/notice/modify")
	public String noticeModify(BoardVO board, RedirectAttributes rttr) {

		int count = boardService.contentModify(board);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/notice";
	}

	// 글 삭제
	@PostMapping("/notice/remove")
	public String noticeRemove(@RequestParam("content_idx") Long content_idx, RedirectAttributes rttr) {

		int count = boardService.contentRemove(content_idx);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/notice";
	}

	/****************** 문의하기 **********************/

	// 리스트 불러오기(페이징)
	@GetMapping("member/inquiry")
	public String inquiryList(Criteria cri, Model model) {

		log.info("--------------------------");
		log.info(cri);
		log.info("inquiryList...........");

		model.addAttribute("contentList", boardService.getContentListPaging(cri, 2L));

		int total = boardService.getTotal(cri, 2L);

		model.addAttribute("pageMaker", new PageVO(cri, total));

		return "member/inquiry";

	}

	// 해당 게시물 불러오기 ( jsp 만든 후 string으로 바꿔서 return 해줘야함 )
	@GetMapping("member/inquiry/get")
	public String inquiryGet(@RequestParam("content_idx") Long content_idx, Model model) {

		model.addAttribute("board", boardService.getContent(content_idx));

		return "member/inquiry";
	}

	// 글 작성
	@PostMapping("member/inquiry/register")
	public String inquiryRegister(BoardVO board, RedirectAttributes rttr) {

		log.info("board: " + board);

		boardService.contentRegister(board);

		rttr.addFlashAttribute("result", board.getContent_idx());

		return "redirect:/member/inquiry";
	}

	// 글 수정
	@PostMapping("/member/inquiry/modify")
	public String inquiryModify(BoardVO board, RedirectAttributes rttr) {

		int count = boardService.contentModify(board);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/member/inquiry";
	}

	// 글 삭제
	@PostMapping("/member/inquiry/remove")
	public String inquiryRemove(@RequestParam("content_idx") Long content_idx, RedirectAttributes rttr) {

		int count = boardService.contentRemove(content_idx);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/member/inquiry";
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
	public String petstagramList(Model model) {

		log.info("petstagramList...........");

		model.addAttribute("contentList", boardService.getContentList(4L));

		return "board/petstagram";
	}

	// 해당 게시물 불러오기
	@GetMapping({ "/petstagram/get", "/petstagram/modify" })
	public void petstagramGet(@RequestParam("content_idx") Long content_idx, Model model) {

		model.addAttribute("board", boardService.getContent(content_idx));
	}

	// 글 작성
	@PostMapping("/petstagram/register")
	public String petstagramRegister(BoardVO board, RedirectAttributes rttr) {

		log.info("board: " + board);

		boardService.contentRegister(board);

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

}
