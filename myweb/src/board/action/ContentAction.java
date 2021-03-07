package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;
// 글 내용 (가져와 보기) 처리
public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 해당 글 번호
		int num = Integer.parseInt(request.getParameter("num"));
		// 해당 페이지 번호
		String pageNum = request.getParameter("pageNum");
		BoardDAO dbPro = BoardDAO.getInstance(); // DB 처리
		// 해당 글 번호에 대한 레코드
		BoardVO article = dbPro.getArticle(num);
		// 해당 뷰에서 사용할 속성 : get/set Attribute는 객체를 주고 받기 때문에 객체로 싸서 설정해줘야 함
		request.setAttribute("num", new Integer(num)); // 해당 글 번호
		request.setAttribute("pageNum", new Integer(pageNum)); // 해당 페이지 번호
		request.setAttribute("article", article); // 해당 글
		return "/board/content.jsp"; // 해당 뷰
	}

}
