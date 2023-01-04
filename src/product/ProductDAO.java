package product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import product.Product;
import product.DBConnectionMgr;

public class ProductDAO {
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    // 커넥션풀을 이용한 데이터베이스 연결

	private DBConnectionMgr pool;

	public ProductDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
    
    // 상품목록 리턴 메소드
    public Product getList(String productId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product bean = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from pers_product";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new Product();
				bean.setProductId(rs.getString(1));
				bean.setPname(rs.getString(2));
				bean.setPcost(rs.getInt(3));
				bean.setPdes(rs.getString(4));
				bean.setPcate(rs.getString(5));
				bean.setPstock(rs.getInt(6));
				bean.setPimg(rs.getString(7));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
}
    
	public boolean Product_Insert(Product bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert pers_product(productId,pname,pcost,pdes,pcate"
					+ ",pstock,pimg)values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getProductId());
			pstmt.setString(2, bean.getPname());
			pstmt.setInt(3, bean.getPcost());
			pstmt.setString(4, bean.getPdes());
			pstmt.setString(5, bean.getPcate());
			pstmt.setInt(6, bean.getPstock());
			pstmt.setString(7, bean.getPimg());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
    
}
