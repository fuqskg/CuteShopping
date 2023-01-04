package product;
import java.util.ArrayList;
import product.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts =new ArrayList<>();
	
	//ProductRepository 인스턴스를 하나만 공유하도록 싱글톤 패턴 사용
	private static ProductRepository instance = new ProductRepository();
	
	//ProductRepository인스턴스를 리턴하는 getter 메서드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//db연동만 임시데이터로 사용
	public ProductRepository() {
		
		Product tin = new Product("1","틴틴팅클", 300000000); 
		tin.setPdes("앙큼한 몸집이 특징인 귀여운 고양이들");
		tin.setPcate("고양이");
		tin.setPcost(300000000);
		tin.setPimg("xxxz.jpg");
		tin.setPstock(4);
		
		Product ht = new Product("2","햄터", 20000000); 
		ht.setPdes("조막만한 몸으로 앙칼진 햄스터");
		ht.setPcate("햄스터");
		ht.setPcost(20000000);
		ht.setPimg("ham.jpg");
		ht.setPstock(2);

		
		Product kh = new Product("3","커햄", 2900000); 
		kh.setPdes("속을 알 수 없는 눈빛으로 제압하는 햄스터");
		kh.setPcate("고양이");
		kh.setPcost(2900000);
		kh.setPimg("zjzj.jpg");
		kh.setPstock(2);


		Product hg = new Product("4","햄깅", 400000000);
		hg.setPdes("초롱초롱한 눈빛으로 이상한 생각을 하는 햄스터");
		hg.setPcate("햄스터");
		hg.setPcost(400000000);
		hg.setPimg("rld.png");
		hg.setPstock(6);

		Product mr = new Product("5","마루", 200000000); 
		mr.setPdes("강쥐였다 사람이 된 행운만점 강쥐 몸집이 특징인 귀여운 고양이들");
		mr.setPcate("강아지");
		mr.setPcost(200000000);
		mr.setPimg("maru.jpg");
		mr.setPstock(1);

		Product mb = new Product("6","먹밥이", 70000000); 
		mb.setPdes("한입 베어먹으면 안되는 주먹밥");
		mb.setPcate("기타");
		mb.setPcost(70000000);
		mb.setPimg("bab.jpg");
		mb.setPstock(5);

		listOfProducts.add(tin);
		listOfProducts.add(ht);
		listOfProducts.add(kh);
		listOfProducts.add(hg);
		listOfProducts.add(mr);
		listOfProducts.add(mb);

		
	} 
	
	//항목 리턴 객체 추가
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//productId값 받아서 리턴해주는 메서드
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product =listOfProducts.get(i);
			
			if(productId !=null && product.getProductId() != null &&
					product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	//상품 추가 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}
