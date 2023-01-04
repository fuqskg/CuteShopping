package user;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;



//�����ͺ��̽� ���� ��ü

public class UserDAO { 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; 
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/jsp_db?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false\";";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	

	// �α���
	public int login(String userID, String userPw) {
		String SQL = "SELECT userPw FROM pers_admin WHERE userID = ?";

		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // ���� ����

			if (rs.next()) {
				if (rs.getString(1).equals(userPw)) // select �� ù Į��
					return 1; // �α��� ����
				else
					return 0; // ��й�ȣ ����
			} // if�� ��
			return -1; // ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db����
	}

	// ���̵� �ߺ�üũ
	public int checkId(String userID) {
		String SQL = "select userID from pers_admin where userID = ?";

		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			// �����ϴ� ���̵���
			if (rs.next()) {
				return 1;
			} else { // �ߺ��� �ƴ϶��
				return 0;
			} // if��
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ����

	}
	
	//ȸ������
	public int join(User user) {
		String SQL = "INSERT INTO pers_admin (userID, userPw, userEmail, userPhone, userPost, userAddress, userDaddress, userName) VALUES (?,?,?,?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserPhone());
			pstmt.setString(5, user.getUserPost());
			pstmt.setString(6, user.getUserAddress());
			pstmt.setString(7, user.getUserDaddress());
			pstmt.setString(8, user.getUserName());

			return pstmt.executeUpdate();
				
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return -1; //db����
	}
	
	public User getMember(String userID) {
		User user = null;
		String SQL = "SELECT * FROM pers_admin WHERE userID =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserID(rs.getString("userID"));
				user.setUserPw(rs.getString("userPw"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserPhone(rs.getString("userPhone"));
				user.setUserPost(rs.getString("userPost"));
				user.setUserAddress(rs.getString("userAddress"));
				user.setUserDaddress(rs.getString("userDaddress"));
				user.setUserName(rs.getString("userName"));
				System.out.println("ȸ������ ����Ϸ�");
			}
			System.out.println("sql ���� �Ϸ�");
		}catch(Exception e) {
			e.printStackTrace();
		}return user;
	}
	
	//ȸ������ ����
	public int updateMember(User user) {
		int update = 0;
		
		try {
			String SQL = "UPDATE pers_admin SET userPw=?,userEmail=?, userPhone=?, userPost=?, userAddress=?, userDaddress=? WHERE userID=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPw());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPhone());
			pstmt.setString(4, user.getUserPost());
			pstmt.setString(5, user.getUserAddress());
			pstmt.setString(6, user.getUserDaddress());
			pstmt.setString(7, user.getUserID());

			update = pstmt.executeUpdate();
			System.out.println("��������");
			
		}catch (Exception e) {
			System.out.println("sql����");
			e.printStackTrace();
	
}
		return update;
	}
	
	//ȸ�� ��ü ����Ʈ
	public  ArrayList getMemberList(){
		//�������� �迭 ����
		ArrayList memberList = new ArrayList();
		
		try {
			String SQL = "SELECT * FROM pers_admin";
			pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				User user = new User();//1.MemberBean��ü����
				user.setUserID(rs.getString("UserID"));
				user.setUserName(rs.getString("UserName"));
				user.setUserPost(rs.getString("UserPost"));
				user.setUserAddress(rs.getString("UserAddress"));
				user.setUserDaddress(rs.getString("UserDaddress"));
				user.setUserEmail(rs.getString("UserEmail"));
				//��������� �� ���� �����͸� ����mb�� ������ ����. while�� ��� ���� �ݺ��ؼ� ����mb�� ����

				//�����迭(ArrayList)�� ���� ������mb�� ����
				//�� �迭 �� ĭ�� ȸ�� 1���� ������ ������.
				memberList.add(user); //��ĳ���� (MemberBean -> Object)
				//System.out.println(memberList); �迭�� ĭ�� �� ������ �ַܼ� Ȯ��
			}		System.out.println("ȸ������Ʈ �˻� ��");

		} catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
	public int memDel(String userID) {
		int result = 0;
		try {
			String SQL ="DELETE FROM pers_admin WHERE userID=?";
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID.trim());
			result = pstmt.executeUpdate(); // ���� ���� �� ������ ���ڵ� �� 
		} catch (Exception e) {
			System.out.println("sql����");
			e.printStackTrace();
		}
		return result;
	}
}
