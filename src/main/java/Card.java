public class Card{
    String name;
    String Category;
    int price;
    int stock;
    String img;
	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getimg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}