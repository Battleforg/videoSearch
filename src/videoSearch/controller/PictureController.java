package videoSearch.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import videoSearch.domain.Picture;
import videoSearch.service.PictureServiceImpl;

@Controller
public class PictureController {
	private static final Log logger = 
			LogFactory.getLog(PictureController.class);
	
	
	@RequestMapping(value = "/home")
	public String searchHome(Model model, HttpServletRequest servletRequest) {
		logger.info("searchHome called");
		String realPath = servletRequest.getServletContext().getRealPath("/sampleImg");
		int i = 1;
		List<Picture> pictures = new ArrayList<>();
		while (new File(realPath, i + ".jpg").exists()) {
			Picture aPicture = new Picture();
			aPicture.setId(i);
			aPicture.setName(Long.toString(i));
			aPicture.setUrl(aPicture.getName() + PictureServiceImpl.JPG_STRING);
			pictures.add(aPicture);
			i++;
		}
		
		model.addAttribute("pictures", pictures);
		return "home";
	}
	
}
