package common.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "*.do" }, initParams = {
		@WebInitParam(name = "config", value = "Command.properties") })
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private Map<String, Object> cmdMap = new HashMap<>();

	public void init(ServletConfig conf) throws ServletException {
		
		String props = conf.getInitParameter("config");
	     String realFolder="/WEB-INF";
	     ServletContext context= conf.getServletContext();
	     String realPath = context.getRealPath(realFolder)+"/"+props;

		Properties p = new Properties();
		try {
			FileInputStream fis = new FileInputStream(realPath);
			p.load(fis);
			if (fis != null)
				fis.close();
			Set<Object> set = p.keySet();

			for (Object key : set) {
				String cmd = key.toString();
				String className = p.getProperty(cmd);
				if (className != null) {
					className = className.trim();
					Class cmdClass = Class.forName(className);
					Object cmdInstance = cmdClass.newInstance();
					cmdMap.put(cmd, cmdInstance);
				} // if()

			} // for()

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new ServletException(ex);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		requestProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		requestProcess(request, response);
	}

	private void requestProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException {

		String uri = req.getRequestURI();

		String myctx = req.getContextPath();

		int len = myctx.length(); // 6
		String cmd = uri.substring(len);
		Object instance = cmdMap.get(cmd);
		if (instance == null) {
			throw new ServletException(cmd + " action is null.");
		}

		AbstractAction action = (AbstractAction) instance;
		try {
			action.execute(req, res);
			String viewPage = action.getViewPage();
			if (viewPage == null) {
				viewPage = "main.jsp";
			}
			if (action.isRedirect()) {
				res.sendRedirect(viewPage);
			} else {
				RequestDispatcher dispatch = req.getRequestDispatcher(viewPage);
				dispatch.forward(req, res);

			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}// ---------------------------------------

}//////////////////////////////////////////////
