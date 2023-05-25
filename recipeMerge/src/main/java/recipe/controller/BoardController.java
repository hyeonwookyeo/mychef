package recipe.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recipe.model.Board;
import recipe.model.BoardBean;
import recipe.model.MemberBean;
import recipe.service.BoardServiceImpl;

@Controller
public class BoardController {

	@Autowired
//	@Inject
	private BoardServiceImpl boardService;

	@RequestMapping("test.do")
	public String test() {
		System.out.println("컨트롤러 들어옴");

		return "test";
	}

	/* 게시판 글쓰기 폼 */
	@RequestMapping(value = "/board_write")
	public String board_write() {

		return "board_write";
	}

	/* 게시판 저장 */
	@RequestMapping(value = "/board_write_ok", method = RequestMethod.POST)
	public String board_write_ok() {
	


		return "board_list";
	}
	
	
	

	/* 게시판 내용보기,삭제폼,수정폼,답변글폼 */
	@RequestMapping(value = "/board_cont")
	public String board_cont(@RequestParam("board_num") int board_num, @RequestParam("page") String page,
			@RequestParam("state") String state, Model model) throws Exception {

		if (state.equals("cont")) { // 내용보기
			boardService.hit(board_num); // 조회수 증가
		}

		BoardBean board = boardService.board_cont(board_num);

		model.addAttribute("bcont", board);
		model.addAttribute("page", page);

		if (state.equals("cont")) { // 내용보기
			// String board_cont = board.getBoard_content().replace("\n","<br>");
			// 글내용중 엔터키 친부분을 웹상에 보이게 할때 다음줄로 개행
			// model.addAttribute("board_cont", board_cont);

			return "board_cont";
		} else if (state.equals("edit")) { // 수정폼
			return "board_edit";
		} else if (state.equals("del")) { // 삭제폼
			return "board_del";
		} else if (state.equals("reply")) { // 답변달기 폼
			return "board_reply";
		}
		return null;
	}

	/* 게시판 수정 */
	@RequestMapping(value = "/board_edit_ok", method = RequestMethod.POST)
	public String board_edit_ok(@ModelAttribute BoardBean b, @RequestParam("page") String page, Model model)
			throws Exception {

		// 수정 메서드 호출
		BoardBean board = boardService.board_cont(b.getBoard_num());
		int result = 0;

		if (!board.getBoard_pass().equals(b.getBoard_pass())) { // 비번이 같다면
			result = 1;
			model.addAttribute("result", result);

			return "updateResult";

		} else {

			boardService.edit(b); // 수정 메서드 호출
		}

		return "redirect:/board_cont.do?board_num=" + b.getBoard_num() + "&page=" + page + "&state=cont";
	}

	/* 게시판 삭제 */
	@RequestMapping(value = "/board_del_ok", method = RequestMethod.POST)
	public String board_del_ok(@RequestParam("board_num") int board_num, @RequestParam("page") int page,
			@RequestParam("pwd") String board_pass, Model model) throws Exception {

		BoardBean board = boardService.board_cont(board_num);
		int result = 0;

		if (!board.getBoard_pass().equals(board_pass)) {
			result = 1;
			model.addAttribute("result", result);

			return "deleteResult";

		} else {
			boardService.del_ok(board_num);
		}

		return "redirect:/board_list.do?page=" + page;
	}

	/* 게시판 답변달기 저장 */
	@RequestMapping(value = "/board_reply_ok", method = RequestMethod.POST)
	public String board_reply_ok(@ModelAttribute BoardBean b, @RequestParam("page") String page) throws Exception {

		boardService.reply_ok(b);

		return "redirect:/board_list.do?page=" + page;
	}

}
