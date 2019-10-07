package member.model;

import java.io.Serializable;

public class MemberVO implements Serializable {
	
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_game1_rank;
	private String member_game2_rank;
	private String member_game3_rank;
	
	public MemberVO() {}
	
	public MemberVO(String member_id, String member_pwd, String member_name, String member_game1_rank,
			String member_game2_rank, String member_game3_rank) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_game1_rank = member_game1_rank;
		this.member_game2_rank = member_game2_rank;
		this.member_game3_rank = member_game3_rank;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_game1_rank() {
		return member_game1_rank;
	}

	public void setMember_game1_rank(String member_game1_rank) {
		this.member_game1_rank = member_game1_rank;
	}

	public String getMember_game2_rank() {
		return member_game2_rank;
	}

	public void setMember_game2_rank(String member_game2_rank) {
		this.member_game2_rank = member_game2_rank;
	}

	public String getMember_game3_rank() {
		return member_game3_rank;
	}

	public void setMember_game3_rank(String member_game3_rank) {
		this.member_game3_rank = member_game3_rank;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", member_game1_rank=" + member_game1_rank + ", member_game2_rank=" + member_game2_rank
				+ ", member_game3_rank=" + member_game3_rank + "]";
	}
	
}
