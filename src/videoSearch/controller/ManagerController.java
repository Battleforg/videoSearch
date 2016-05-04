package videoSearch.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	private final static Log logger = 
			LogFactory.getLog(ManagerController.class);
	
	@RequestMapping(value = "/managerLogin")
	public String managerLogin(Model model, HttpServletRequest servletRequest) {
		logger.info("manager login called");
		return "managerLogin";
	}
	
	@RequestMapping(value = "/overview")
	public String overview(Model model, HttpServletRequest servletRequest) {
		logger.info("manager overview called");
		return "overview";
	}
	
	@RequestMapping(value = "/uploadVideo")
	public String uploadVideo(Model model, HttpServletRequest servletRequest) {
		logger.info("manager upload video called");
		return "uploadVideo";
	}
	
	@RequestMapping(value = "/manageVideo")
	public String manageVideo(Model model, HttpServletRequest servletRequest) {
		logger.info("manager manage video called");
		return "manageVideo";
	}
}
