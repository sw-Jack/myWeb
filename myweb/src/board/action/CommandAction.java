package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�������� Ȱ���� ��ɾ ó���ϴ� ���� �������̽�
//��û �Ķ���ͷ� ��ɾ �����ϴ� ����� ���� �������̽�
//�ش� �������̽����� �� ����� Action Ŭ������ ���� ����
public interface CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
