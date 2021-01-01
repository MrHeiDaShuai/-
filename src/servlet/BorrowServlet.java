package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdminBean;
import dao.AdminDao;
import dao.BookDao;

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void BorrowServlet() {}
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html,charset=UTF-8");
		BookDao bookdao=new BookDao();
		//Ϊ�����ֽ����뻹�飬����tip,tipΪ1��ʾ����
		int tip=Integer.parseInt(request.getParameter("tip"));
		if(tip==1) {
			//��ȡͼ���id
			int bid=Integer.parseInt(request.getParameter("bid"));
			HttpSession session=request.getSession();
			AdminBean admin=new AdminBean();
			//��ȡ������session��aid����id
			String aid=(String)session.getAttribute("aid");
			AdminDao admindao=new AdminDao();
			//ͨ��aid��ȡ�����ߵ���Ϣ
			admin=admindao.get_AidInfo2(aid);
			//�����ļ�¼�������ݱ�
			bookdao.borrowBook(bid, admin);
			response.sendRedirect("select.jsp");
		}else {
			//���鹦�ܣ���ȡ���ļ�¼��hid
			int hid=Integer.parseInt(request.getParameter("hid"));
			//�����ڹ���Ա�Ͷ��߽��涼�У�Ϊ�����֣�������show�ֶΣ�showΪ1��ʾ���߽���
			int show=Integer.parseInt(request.getParameter("show"));
			//���û��麯�����ı�status�ֶ�
			bookdao.borrowBook2(hid);
			if(show==1) {
				response.sendRedirect("borrow.jsp");
			}else {
				response.sendRedirect("admin_borrow.jsp");
			}
		}
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{
		doGet(request,response);
	}
}
