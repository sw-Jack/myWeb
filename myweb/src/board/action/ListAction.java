package board.action;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;

// *Action.java : ��ɾ� ó�� ��û�� ó�����ִ� Ŭ���� CommandAction �������̽��� ���� ������ ����
public class ListAction implements CommandAction {
	// �۸�� ó��
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String pageNum = request.getParameter("pageNum"); // ������ ��ȣ
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 5; // �� �������� ���� ����
		int currentPage = Integer.parseInt(pageNum);
		// �� �������� ���� �� ��ȣ
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = currentPage * pageSize; // �� �������� ������ �� ��ȣ
		int count = 0;
		int number = 0;
		List<BoardVO> articleList = null;
		BoardDAO dbPro = BoardDAO.getInstance(); // DB ����
		count = dbPro.getArticleCount(); // ��ü �� ����
		if(count > 0) { // ���� �������� �ش��ϴ� �� ���
			articleList = dbPro.getArticles(startRow, endRow);
		} else {
			articleList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize; // �� ��Ͽ� ǥ���� �� ��ȣ
		// �ش� �信�� ����� �Ӽ�
		request.setAttribute("currentPage", new Integer(currentPage)); // setAttribute(String, Object) -> getAttribute : Object ���Ϲ���
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		return "/board/list.jsp"; // �ش� ��
	}
}
