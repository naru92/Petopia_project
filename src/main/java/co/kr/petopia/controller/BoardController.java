package co.kr.petopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.petopia.service.BoardService;
import co.kr.petopia.vo.BoardVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class BoardController {

    @Autowired
    private final BoardService boardService;

    /****************** 공지사항 **********************/

    // 리스트 불러오기
    @GetMapping("/notice")
    public String noticeList(Model model) {

        log.info("noticeList...........");

        model.addAttribute("contentList", boardService.getContentList(1L));

        return "board/notice";

    }
    
    // 해당 게시물 불러오기 ( jsp 만든 후 string으로 바꿔서 return 해줘야함 )
    @GetMapping("/notice/get")
    public void noticeGet(@RequestParam("content_idx") Long content_idx, Model model) {
        
        model.addAttribute("board", boardService.getContent(content_idx));
        
    }
    
    // 글 작성
    @PostMapping("/notice/register")
    public String noticeRegister(BoardVO board, RedirectAttributes rttr) {

        log.info("board: " + board);

        boardService.contentRegister(board);

        rttr.addFlashAttribute("result", board.getContent_idx());

        return "redirect:/notice";
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

    // 리스트 불러오기
    @GetMapping("member/inquiry")
    public String inquiryList(Model model) {

        log.info("inquiryList...........");

        model.addAttribute("contentList", boardService.getContentList(2L));

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
    @GetMapping("/petstagram/get")
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
