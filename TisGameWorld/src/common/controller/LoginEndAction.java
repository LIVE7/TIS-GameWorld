package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.CommonUtil;
import member.model.MemberDAO;
import member.model.MemberVO;

public class LoginEndAction extends AbstractAction {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String id = req.getParameter("member_id");
		String pwd = req.getParameter("member_pwd");
		if (id == null || id.trim().isEmpty() || pwd == null || pwd.trim().isEmpty()) {
			this.setViewPage(CommonUtil.addMsgBack(req, "Wrong Access"));
			this.setRedirect(false);
			return;
		}
		
		MemberDAO dao = new MemberDAO();
		boolean isExistID = dao.isExistMemberID(id);
		if(!isExistID) {
			this.setViewPage(CommonUtil.addMsgBack(req, "ID is not exist"));
			this.setRedirect(false);
			return;
		}
		
		MemberVO member = dao.selectMemberID(id);
		if(!member.getMember_pwd().equals(pwd)) {
			this.setViewPage(CommonUtil.addMsgBack(req, "Password is not match"));
			this.setRedirect(false);
			return;
		}
		
		req.setAttribute("member", member);
		req.setAttribute("loc", "main.do");
		
		this.setViewPage("/loginEnd.jsp");
		this.setRedirect(false);
	}
}
