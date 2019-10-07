package ranking.model;
import java.io.*;
import java.sql.Date;

public class RankingVO implements Serializable{
	private int rn;//글의 행번호
	private String GAME2_RANK_SCORE;//해파리 점수
	private String MEMBER_ID;//아이디
	
	public RankingVO() {//-기본생성자 필수
		this(0,null,null);
	}

	public RankingVO(String GAME2_RANK_SCORE, String MEMBER_ID) {
		super();
		this.GAME2_RANK_SCORE = GAME2_RANK_SCORE;
		this.MEMBER_ID = MEMBER_ID;
	}

	public RankingVO(int rn, String GAME2_RANK_SCORE, String MEMBER_ID) {
		super();
		this.rn = rn;
		this.GAME2_RANK_SCORE = GAME2_RANK_SCORE;
		this.MEMBER_ID = MEMBER_ID;
	}


	public String getMEMBER_ID() {
		return MEMBER_ID;
	}




	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}




	public String getGAME2_RANK_SCORE() {
		return GAME2_RANK_SCORE;
	}




	public void setGAME2_RANK_SCORE(String gAME2_RANK_SCORE) {
		GAME2_RANK_SCORE = gAME2_RANK_SCORE;
	}




	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	
	
}///////////////////////////////////////////
