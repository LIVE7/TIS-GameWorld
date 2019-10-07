package ranking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import ranking.model.RankingDAOMyBatis;
import ranking.model.RankingVO;

public class TotalRankingAction extends AbstractAction{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		RankingDAOMyBatis dao2 = new RankingDAOMyBatis();
		List<RankingVO>arr2 = dao2.totalRanking();
		
		req.setAttribute("rankingArr", arr2);
		this.setViewPage("./ranking/totalRanking.jsp");
		this.setRedirect(false);

	}

}
