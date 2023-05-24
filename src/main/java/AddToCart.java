

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }
    String url = "jdbc:mysql://localhost:3306/Grocery_Store";
    String user = "root";
    String password = "Deepika@12";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
           try {
        	  Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			String name = request.getParameter("name");
	        int qty = Integer.parseInt(request.getParameter("qty"));
	        int price = Integer.parseInt(request.getParameter("price"));
	        String img = request.getParameter("image");
	        String Category = request.getParameter("Category");
	        int TotalCost=qty*price;
	        Cookie[] cks = null;
	        Cookie ck = null;
	        String username=null;
	        String userType=null;
	        cks = request.getCookies();
	        if (cks != null) {
	            for (int i = 0; i < cks.length; i++) {
	                ck = cks[i];
	                if (ck.getName().equals("username")) {
	                    username = ck.getValue();
	                }else if(ck.getName().equals("userType")) {
	                    userType=ck.getValue();
	                }
	            }
	        }
	        if(username==null || userType==null || userType.equals("shopkeeper")) {
	            request.setAttribute("error", "Login as a buyer in order to add items to the cart"); 
	            RequestDispatcher view = request.getRequestDispatcher("error.jsp");
	             view.forward(request, response);
	         }else {
	             methodsofcart dao = new methodsofcart(); 
	             if(dao.checkItemInCart(username, name)) {
	               dao.updateQty(username, name, qty);
	             }else {
	            	 String CartInsertQuery = "insert into cart values(?,?,?,?,?,?,?)";
	                 PreparedStatement Item = con.prepareStatement(CartInsertQuery);
	                 Item.setString(1,username);
	                 Item.setString(2,name);
	                 Item.setInt(3,price);
	                 Item.setInt(4, qty);
	                 Item.setInt(5, TotalCost);
	                 Item.setString(6, Category);
	                 Item.setString(7,img);
	                 Item.execute();
	             }
	             String path = request.getHeader("referer");
	             response.sendRedirect(path);
	         }
	
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
	 