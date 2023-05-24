
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class AddNewItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddNewItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String url = "jdbc:mysql://localhost:3306/Grocery_Store";
	        String user = "root";
	        String password = "Deepika@12";
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection(url, user, password);
	            String itemInsertQuery = "insert into Items values(?,?,?,?,?)";
	            PreparedStatement Item = con.prepareStatement(itemInsertQuery);
	            String name = request.getParameter("item_name");
	            Item.setString(1, name);
	            String category = request.getParameter("item_category");
	            Item.setString(2, category);
	            int price = Integer.parseInt(request.getParameter("item_price"));
	            Item.setInt(3, price);
	            String img = request.getParameter("item_img");
	            Item.setString(4, img);
	            String stock = request.getParameter("stock");
	            Item.setString(5, stock);
	            Item.execute();
	            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
	            response.sendRedirect("home.jsp");
	        } catch (Exception ex) {
	            request.setAttribute("error", ex);
	            request.getRequestDispatcher("error.jsp").forward(request, response);
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
