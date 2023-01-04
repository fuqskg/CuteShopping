package product;

public class Product {
	private String productId;
	private String pname;
	private int pcost;
	private String pdes;//상품설명
	private String pcate; //상품카테고리
	private int pstock;//상품재고수
	private String pimg;//사진주소
	private int quantity; //장바구니에 담은 수
		
	public Product() {
		
	}
	
	//생성자 오버로드
	public Product(String productId, String pname, int pcost) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.pcost = pcost;
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPcost() {
		return pcost;
	}

	public void setPcost(int pcost) {
		this.pcost = pcost;
	}

	public String getPdes() {
		return pdes;
	}

	public void setPdes(String pdes) {
		this.pdes = pdes;
	}

	public String getPcate() {
		return pcate;
	}

	public void setPcate(String pcate) {
		this.pcate = pcate;
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
