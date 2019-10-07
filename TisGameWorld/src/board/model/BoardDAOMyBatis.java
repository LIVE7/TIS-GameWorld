package board.model;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.MailcapCommandMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAOMyBatis {

	private final String NS = "board.model.BoardMapper";
	// BoardMapper.xml에 기술되어 있는 namespace를 NS상수에 할당한다.(필수)

	private SqlSession ses;// -mybatis에서 JDBC관련 모든 일을 함 기존의 con, rs, ps 이런것 한번에 처리해줌

	public BoardDAOMyBatis() {

	}

	public SqlSessionFactory getSessionFactory() {
		String resource = "common/config/mybatis-config.xml";//-파일경로 지정 (path접근 방식 (/))
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream(resource);//-노드 연결후 스트림 반환
			SqlSessionFactoryBuilder sb = new SqlSessionFactoryBuilder();// -얘를 통해서 sql문을 파악한다. //-공장을 짓는 건축가
			SqlSessionFactory factory = sb.build(is);// -설계도를 넘겨받아 공장을 지음
			return factory;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}// --------------------------------------

	public int getCount() {
		try {
			ses = this.getSessionFactory().openSession();// -sql의 session을 얻어온다 (mybatis-config.xml(db연결정보가 들어있음)여기에 db의 상세정보(db.properties)
			int cnt = ses.selectOne(NS + ".tabCount");//-.tabCount는 NS의 BoardMapper.xml의 id(식별자)
			return cnt;
		} finally {
			close();
		}
	}// --------------------------------------

	public int insertBoard(BoardVO board) {
		try {
			ses = this.getSessionFactory().openSession();//디폴트가 auto commit이 아님
			int n=ses.insert(NS+".insertBoard", board);
			if(n>0) {
				ses.commit();//-auto commit이 아니기 때문에 sql문 처리할때마다 커밋해야함
			}else {
				ses.rollback();//- 롤백
			}
			return n;
		} finally {
			close();
		}
	}//------------------------------------------
	
	
	/*총 게시글 수 가져오기*/
	public int getToalCount(Map<String, String> map) {
		try {
			ses = this.getSessionFactory().openSession(true);
			int total=ses.selectOne(NS+".getTotalCount", map);//-map을 파라미터로 넘긴다
			return total;
		} finally {
			close();
		}
	}//-----------------------------------------

	public List<BoardVO> listBoard(Map<String, String> map) {
		try {
			ses=this.getSessionFactory().openSession();
//			Map<String,Integer> map = new HashMap<>();
//			map.put("start",start);
//			map.put("end",end);
			//전달할 값이 많을 때는
			//파라미터로 map또는 VO객체를 전달
			List<BoardVO> arr=ses.selectList(NS+".listBoard", map);
			//db테이블의 컬럼명과 VO의 프로퍼티명이 일치해야 알아서 가져와서 VO에 set해준다.

			return arr;
		} finally {
			close();
		}
	}//--------------------------------------------

	private void close() {
		if (ses != null)
			ses.close();
	}
	
	/**조회수 증가 - update문*/
	public boolean updateReadnum(String idx) {
		try {
			ses=this.getSessionFactory().openSession(true); 
			//openSession: commit이 수동임. commit 또는 rollback()
			//openSession(true); : auto commit
			int n=ses.update(NS+".updateReadnum",idx);
			return (n>0)? true: false; //-boolean형이기 때문
		} finally {
			close();
		}
	}

	public BoardVO getBoard(String idx) {
		try {
			ses=this.getSessionFactory().openSession(true); 
			//PK로 가져오기 때문에 결과는 레코드 1개
			BoardVO board=ses.selectOne(NS+".getBoard",idx);//-파라미터 idx를 넘긴다.
			return board;
		}finally {
			close();
		}
	}

	public int deleteBoard(String idx) {
		try {
			ses=this.getSessionFactory().openSession(true); 
			int n = ses.delete(NS+".deleteBoard",idx);
			return n;
		} finally {
			close();
		}
	}

	public int editBoard(BoardVO board) {
		try {
			ses=this.getSessionFactory().openSession(true); 
			int n=ses.update(NS+".updateBoard",board);
			return n;
		} finally {
			close();
		}
	}//-----------------------------------------------
	
	/**댓글 달기*/
	
	public int insertReply(ReplyVO reply) {
		try {
			ses=this.getSessionFactory().openSession(true);
			int n = ses.insert(NS+".insertReply",reply);
			return n;
		} finally {
			close();
		}
	}//--------------------------
	
	/**댓글 목록 가져오기*/
	public List<ReplyVO> listReply(String idx_fk){
		try {
			ses=this.getSessionFactory().openSession(true);
			return ses.selectList(NS+".listReply", idx_fk);//-idx_fk를 넣어줘야 해당글에 관련된 목록을 가져온다.
		} finally {
			close();
		}
	}//-----------------------------------

	public int replyCount(String idxStr) {
		try {
			ses=this.getSessionFactory().openSession(true);
			return ses.selectOne(NS+".replyCount", idxStr);
		} finally {
			close();
		}
	}

	

}
