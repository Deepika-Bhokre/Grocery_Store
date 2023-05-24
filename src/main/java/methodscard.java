import java.sql.*;
import java.util.ArrayList;
import java.util.List;
  
public class methodscard {
  
    Connection connection;
    Statement stmt;
    int noOfRecords;
    
    private static Connection getConnection() throws SQLException, ClassNotFoundException
    {
        Connection con = ConnectionFactory.getInstance().getConnection();
        return con;
    }
  
    public List<Card> viewAllCards(int offset, int noOfRecords)
    {
        String query = "select SQL_CALC_FOUND_ROWS * from Items limit " + offset + ", " + noOfRecords;
        List<Card> list = new ArrayList<Card>();
        Card card = null;
        try {
            connection = getConnection();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                card = new Card();
                card.setName(rs.getString(1));
                card.setCategory(rs.getString(2));
                card.setPrice(rs.getInt(3));
                card.setImg(rs.getString(4));
                card.setStock(rs.getInt(5));
                list.add(card);
            }
  
            rs.close();
            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
  
            if (rs.next())
            	 setNoOfRecords1(rs.getInt(1));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void setNoOfRecords1(int a) {
        noOfRecords=a;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }
    public Card getCard(String Name)
    { 
    	Card card = new Card();
    	String query = "select Name,Stock from Items where Name=\"" + Name + "\";";
    	try {
            connection = getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                card.setName(rs.getString(1));
                card.setStock(rs.getInt(2));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    	return card;
    }
    public void UpdateStock(String Name, int Stock) {
        String query = "update Items set Stock=" + Stock + " where Name=\"" + Name + "\";";
        try {
            connection = getConnection();
            Statement stmt = connection.createStatement();
            stmt.execute(query);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void deleteAllitems(String Name)
    {
    	 String query = "delete from cart where ItemName=\"" + Name + "\";";
         try {
             connection = getConnection();
             Statement stmt = connection.createStatement();
             stmt.execute(query);
         } catch (Exception ex) {
             ex.printStackTrace();
         }
    }
    public void deleteItem(String Name) {
        deleteAllitems(Name);
        String query="delete from Items where Name=\""+Name+"\";";
        try {
            connection = getConnection();
            Statement stmt = connection.createStatement();
            stmt.execute(query);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

	public List<Card> searchItems(String Name) {
		// TODO Auto-generated method stub
		 String query = "select * from Items where Name=\""+Name+"\";";
		 List<Card> list = new ArrayList<Card>();
	     Card item = null;
	     try {
	            connection = getConnection();
	            stmt = connection.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	                item = new Card();
	                item.setName(rs.getString(1));
	                item.setCategory(rs.getString(2));
	                item.setStock(rs.getInt(5));
	                item.setImg(rs.getString(4));
	                item.setPrice(rs.getInt(3));
	                list.add(item);
	            }
	            rs.close();
	            connection.close();
	            stmt.close();

	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	        return list;
	     
	}
}