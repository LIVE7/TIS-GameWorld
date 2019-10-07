package ranking.model;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.MailcapCommandMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class RankingDAOMyBatis {

	private final String NS = "ranking.model.RankingMapper";
	// BoardMapper.xml에 기술되어 있는 namespace를 NS상수에 할당한다.(필수)

	private SqlSession ses;// -mybatis에서 JDBC관련 모든 일을 함 기존의 con, rs, ps 이런것 한번에 처리해줌

	public RankingDAOMyBatis() {

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

	public int insertRanking(RankingVO ranking) {
		try {
			ses = this.getSessionFactory().openSession();//디폴트가 auto commit이 아님
			int n=ses.insert(NS+".insertRanking", ranking);
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


	public List<RankingVO> listRanking() {
		try {
			ses=this.getSessionFactory().openSession();
			List<RankingVO> arr=ses.selectList(NS+".listRanking");
			return arr;
		} finally {
			close();
		}
	}//--------------------------------------------
	
	public List<RankingVO> totalRanking() {
		try {
			ses=this.getSessionFactory().openSession();
			List<RankingVO> arr=ses.selectList(NS+".totalRanking");
			return arr;
		} finally {
			close();
		}
	}//--------------------------------------------

	private void close() {
		if (ses != null)
			ses.close();
	}
	
	

	

}
