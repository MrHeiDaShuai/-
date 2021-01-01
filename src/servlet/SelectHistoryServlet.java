package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BookBean;
import bean.HistoryBean;
import dao.BookDao;

//管理员图书归还信息页面servlet
@WebServlet("/SelectHistoryServlet")
public class SelectHistoryServlet extends HttpServlet {

	public SelectHistoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("bookname");
		BookDao bookdao = new BookDao();
		ArrayList<HistoryBean> data = bookdao.get_HistoryLikeList(name);
		String url=response.encodeURL("admin_history.jsp");
		//将获取的结果存入请求中
		request.setAttribute("data", data);
		//将请求转发
	    request.getRequestDispatcher(url).forward(request, response);
	}

}
