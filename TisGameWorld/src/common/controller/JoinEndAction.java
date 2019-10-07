package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.CommonUtil;
import member.model.MemberDAO;
import member.model.MemberVO;

public class JoinEndAction extends AbstractAction {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String member_id = req.getParameter("member_id");
		String member_pwd = req.getParameter("member_pwd");
		String member_name = req.getParameter("member_name");
		if (member_id == null || member_id.trim().isEmpty() || member_pwd == null || member_pwd.trim().isEmpty()
				|| member_name == null || member_name.trim().isEmpty()) {
			req.setAttribute("msg", "Wrong Access");
			req.setAttribute("loc", "join.do");
			
			this.setViewPage("/message.jsp");
			this.setRedirect(false);
			return;
		}
		
		MemberVO member = new MemberVO();
		member.setMember_id(member_id.trim().toLowerCase());
		member.setMember_pwd(member_pwd.trim());
		member.setMember_name(member_name.trim());

		MemberDAO dao = new MemberDAO();
		boolean isDisableID = dao.isExistMemberID(member_id);
		
		if(isDisableID) {
			this.setViewPage(CommonUtil.addMsgBack(req, "ID already exists. Use another ID"));
			this.setRedirect(false);
			return;
			
		} else {
			int resultNum = dao.createMember(member);
			
			String msg = (resultNum > 0)? "Successed register" : "Failed sign up";
			String loc = (resultNum > 0)? "login.do" : "javascript:history.back()";
			
			req.setAttribute("id", member.getMember_id());
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			this.setViewPage("/joinEnd.jsp");
			this.setRedirect(false);
		}
	}

}
