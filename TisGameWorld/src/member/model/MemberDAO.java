package member.model;

import java.sql.SQLException;

import common.util.DAOBase;
import common.util.DBUtil;
import member.model.MemberVO;

public class MemberDAO extends DAOBase {

	public MemberDAO() {}

	/** 회원가입 처리 */
	public int createMember(MemberVO member) throws SQLException {
		try {
			con = DBUtil.getCon();

			String sql = "INSERT INTO tisgame_MEMBER VALUES(?, ?, ?, '0', '0', '0')";

			ps = con.prepareStatement(sql);
			ps.setString(1, member.getMember_id());
			ps.setString(2, member.getMember_pwd());
			ps.setString(3, member.getMember_name());

			int resultNum = ps.executeUpdate();

			return resultNum;
			
		} finally {
			close();
		}
	}
	
	/** 아이디 존재 여부 */
	public boolean isExistMemberID(String member_id) throws SQLException {
		try {
			con = DBUtil.getCon();

			String sql = "SELECT MEMBER_ID FROM tisgame_MEMBER WHERE MEMBER_ID=?";

			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			
			boolean isExists = rs.next();
			return isExists;
			
		} finally {
			close();
		}
	}
	
	/** 멤버 객체 가져오기 */
	public MemberVO selectMemberID(String member_id) throws SQLException {
		try {
			con = DBUtil.getCon();
			
			String sql = "SELECT * FROM tisgame_MEMBER WHERE MEMBER_ID=?";

			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				MemberVO member = new MemberVO(
						rs.getString("MEMBER_ID"),
						rs.getString("MEMBER_PWD"),
						rs.getString("MEMBER_NAME"), "0", "0", "0");
				return member;
			} else
				return null;
		} finally {
			close();
		}
	}
}
