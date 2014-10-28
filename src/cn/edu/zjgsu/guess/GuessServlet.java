package cn.edu.zjgsu.guess;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuessServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private GuessBean guessBean = new GuessBean();

	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		HttpSession session = req.getSession();
		guessBean = (GuessBean)session.getAttribute("guess");
		if (guessBean != null) {
			/* 猜测的数组加1 */
			guessBean.setN(guessBean.getN() + 1);
			/* 记录时间 */
			guessBean.countTime();
			int iRandom = guessBean.getResult();
			int iNumber = Integer.parseInt(req.getParameter("number").trim());
			if (iRandom > iNumber) {	//猜测的数字小了
				guessBean.setMinNum(iNumber);
			} else if (iRandom < iNumber) {		//猜测的数字大了
				guessBean.setMaxNum(iNumber);
			} else {	//猜测的数字对了
				guessBean.setIsRight(true);
			}
			session.setAttribute("guess", guessBean);
			resp.sendRedirect("index.jsp");
			return;
		} else {
			resp.sendRedirect("index.jsp");
			return;
		}
	}
}
