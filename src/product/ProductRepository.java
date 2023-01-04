package product;
import java.util.ArrayList;
import product.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts =new ArrayList<>();
	
	//ProductRepository �ν��Ͻ��� �ϳ��� �����ϵ��� �̱��� ���� ���
	private static ProductRepository instance = new ProductRepository();
	
	//ProductRepository�ν��Ͻ��� �����ϴ� getter �޼���
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//db������ �ӽõ����ͷ� ���
	public ProductRepository() {
		
		Product tin = new Product("1","ƾƾ��Ŭ", 300000000); 
		tin.setPdes("��ŭ�� ������ Ư¡�� �Ϳ��� ����̵�");
		tin.setPcate("�����");
		tin.setPcost(300000000);
		tin.setPimg("xxxz.jpg");
		tin.setPstock(4);
		
		Product ht = new Product("2","����", 20000000); 
		ht.setPdes("�������� ������ ��Į�� �ܽ���");
		ht.setPcate("�ܽ���");
		ht.setPcost(20000000);
		ht.setPimg("ham.jpg");
		ht.setPstock(2);

		
		Product kh = new Product("3","Ŀ��", 2900000); 
		kh.setPdes("���� �� �� ���� �������� �����ϴ� �ܽ���");
		kh.setPcate("�����");
		kh.setPcost(2900000);
		kh.setPimg("zjzj.jpg");
		kh.setPstock(2);


		Product hg = new Product("4","�ܱ�", 400000000);
		hg.setPdes("�ʷ��ʷ��� �������� �̻��� ������ �ϴ� �ܽ���");
		hg.setPcate("�ܽ���");
		hg.setPcost(400000000);
		hg.setPimg("rld.png");
		hg.setPstock(6);

		Product mr = new Product("5","����", 200000000); 
		mr.setPdes("���㿴�� ����� �� ���� ���� ������ Ư¡�� �Ϳ��� ����̵�");
		mr.setPcate("������");
		mr.setPcost(200000000);
		mr.setPimg("maru.jpg");
		mr.setPstock(1);

		Product mb = new Product("6","�Թ���", 70000000); 
		mb.setPdes("���� ��������� �ȵǴ� �ָԹ�");
		mb.setPcate("��Ÿ");
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
	
	//�׸� ���� ��ü �߰�
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//productId�� �޾Ƽ� �������ִ� �޼���
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
	
	//��ǰ �߰� �޼���
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}
