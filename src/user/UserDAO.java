package user;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;



//데이터베이스 접근 객체

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
	
	

	// 로그인
	public int login(String userID, String userPw) {
		String SQL = "SELECT userPw FROM pers_admin WHERE userID = ?";

		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // 쿼리 실행

			if (rs.next()) {
				if (rs.getString(1).equals(userPw)) // select 된 첫 칼럼
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 오류
			} // if문 끝
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}

	// 아이디 중복체크
	public int checkId(String userID) {
		String SQL = "select userID from pers_admin where userID = ?";

		try {

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			// 존재하는 아이디라면
			if (rs.next()) {
				return 1;
			} else { // 중복이 아니라면
				return 0;
			} // if끝
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 오류

	}
	
	//회원가입
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
		return -1; //db오류
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
				System.out.println("회원정보 저장완료");
			}
			System.out.println("sql 실행 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}return user;
	}
	
	//회원정보 수정
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
			System.out.println("수정성공");
			
		}catch (Exception e) {
			System.out.println("sql오류");
			e.printStackTrace();
	
}
		return update;
	}
	
	//회원 전체 리스트
	public  ArrayList getMemberList(){
		//가변길이 배열 생성
		ArrayList memberList = new ArrayList();
		
		try {
			String SQL = "SELECT * FROM pers_admin";
			pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				User user = new User();//1.MemberBean객체생성
				user.setUserID(rs.getString("UserID"));
				user.setUserName(rs.getString("UserName"));
				user.setUserPost(rs.getString("UserPost"));
				user.setUserAddress(rs.getString("UserAddress"));
				user.setUserDaddress(rs.getString("UserDaddress"));
				user.setUserEmail(rs.getString("UserEmail"));
				//여기까지가 한 행의 데이터를 변수mb에 저장한 것임. while로 모든 행을 반복해서 변수mb에 저장

				//가변배열(ArrayList)에 위의 데이터mb를 저장
				//즉 배열 한 칸에 회원 1명의 정보를 저장함.
				memberList.add(user); //업캐스팅 (MemberBean -> Object)
				//System.out.println(memberList); 배열한 칸에 잘 들어갔는지 콘솔로 확인
			}		System.out.println("회원리스트 검색 완");

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
			result = pstmt.executeUpdate(); // 쿼리 실행 후 삭제된 레코드 수 
		} catch (Exception e) {
			System.out.println("sql오류");
			e.printStackTrace();
		}
		return result;
	}
}
