
public class orders {
    String UserName;
    String ItemName;
    int ItemPrice;
    int ItemQuantity;
    int TotalPrice;
    String Category;
    String Image;
    String ordered_date;
    public String getordered_date()
    {
    	return ordered_date;
    }
    public void setordered_date(String ordered_date)
    {
    	this.ordered_date = ordered_date;
    }
	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getItemName() {
		return ItemName;
	}

	public void setItemName(String itemName) {
		ItemName = itemName;
	}

	public int getItemPrice() {
		return ItemPrice;
	}

	public void setItemPrice(int itemPrice) {
		ItemPrice = itemPrice;
	}

	public int getItemQuantity() {
		return ItemQuantity;
	}

	public void setItemQuantity(int itemQuantity) {
		ItemQuantity = itemQuantity;
	}

	public int getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		TotalPrice = totalPrice;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

}
