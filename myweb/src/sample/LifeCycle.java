package sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//������
    public LifeCycle() {
    	System.out.println("LifeServlet�� ������ ȣ���...");
    }

    @Override
    //LifeServlet�� �ʱ�ȭ �۾��� ���
    //Servlet ��ü ������ �� �ѹ��� �����
    public void init() throws ServletException {
    	System.out.println("init() ȣ���...");
    }
    
    @Override
    //LifeServlet ��ü�� WAS���� �Ҹ�� �� �����
    public void destroy() {
    	System.out.println("destory() ȣ���...");
    }
    
    @Override
    //Ŭ���̾�Ʈ�� ���� ��û�� ���� ������ ȣ���
    protected void service(HttpServletRequest request, HttpServletResponse response) 
    					throws ServletException, IOException {
    	System.out.println("service() ȣ���...");
    }
}
