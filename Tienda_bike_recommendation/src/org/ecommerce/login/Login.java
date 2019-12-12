package org.ecommerce.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);		
		String username = request.getParameter("username");		
		String password = request.getParameter("password");
		long user_id = 0;
		
		UserDAO userDao = new UserDAO();
		
		try {
			User user = userDao.checkLogin(username, password);
			String destPage = "login.jsp";
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				user_id = user.getId();
                session.setAttribute("user_id", user_id);                
                System.out.println(user_id + "," + user.getUsername());
                destPage = "index.jsp";               
	        }else{
	        	String message = "Invalid email/password";
                request.setAttribute("message", message);
	        }
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
		} 
		catch (Exception e) {
			System.out.println("Error: " + e.toString());
		}
	
		
	}

}
