package user;

import java.io.IOException;
import java.util.Random;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class CheckCode extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//将验证码放入session
		request.getSession().setAttribute("checkcode", getCheckCode());
		response.sendRedirect("../login.jsp");
	}
	
	//生成验证码
	private String getCheckCode(){
		String codeString ="";
		Random random = new Random();
		for(int i=0;i<3;i++){
			int n = random.nextInt(10);
			codeString += n;
		}
		for(int i=0;i<3;i++){
			char c = (char)(random.nextInt(26)+65);
			codeString += c;
		}
		return codeString;
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String txt_checkcode = request.getParameter("txt_checkcode");
		String checkcode = request.getSession().getAttribute("checkcode").toString();
		if(txt_checkcode.equalsIgnoreCase(checkcode )){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserDao ud = new UserDao();
			boolean yn = ud.checkPassword(username, password);
			if(yn){
				response.sendRedirect("../student.jsp");
			}else{
				request.setAttribute("message", "用户名或密码不正确");
				response.sendRedirect("../fail.jsp");			}
		}else {
			request.setAttribute("message", "验证码错误！");
			request.getRequestDispatcher("../fail.jsp").forward(request, response);
		}
		//response.sendRedirect("../login.jsp");
	}

}
