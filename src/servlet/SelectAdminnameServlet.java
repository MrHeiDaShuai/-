package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.HistoryBean;
import dao.BookDao;

//����Աͼ�������Ϣҳ��servlet
@WebServlet("/SelectAdminnameServlet")
public class SelectAdminnameServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("adminname");
		BookDao bookdao = new BookDao();
		ArrayList<HistoryBean> data = bookdao.get_BorrowList(name);
		String url=response.encodeURL("admin_borrow.jsp");
		//����ȡ�Ľ������������
		request.setAttribute("data", data);
		//������ת��
	    request.getRequestDispatcher(url).forward(request, response);
	}

}
