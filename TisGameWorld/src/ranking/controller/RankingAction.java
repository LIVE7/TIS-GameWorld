package ranking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import ranking.model.RankingDAOMyBatis;
import ranking.model.RankingVO;

public class RankingAction extends AbstractAction{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		System.out.println("랭킹등록");
		String GAME2_RANK_SCORE=req.getParameter("GAME2_RANK_SCORE");
		String MEMBER_ID=req.getParameter("MEMBER_ID");
		
		RankingVO ranking = new RankingVO(GAME2_RANK_SCORE,MEMBER_ID);
		RankingDAOMyBatis dao = new RankingDAOMyBatis();
		
		int n=0;
		n =dao.insertRanking(ranking);
				
		String str=(n>0)? "랭킹을 등록했습니다.":"랭킹 등록을 실패했습니다.";
		String loc=(n>0)? "jellyfish.do":"javascript:history.back()";
		
		req.setAttribute("msg", str);
		req.setAttribute("loc", loc);
		this.setViewPage("memo/message.jsp");
		this.setRedirect(false);;
		
		//this.setViewPage("./flapjellyfish/jellyfish.jsp");
		//this.setRedirect(false);

	}

}
