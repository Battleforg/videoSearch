package videoSearch.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import videoSearch.domain.Picture;
import videoSearch.domain.UploadPicture;
import videoSearch.service.PictureService;

@Controller
public class PictureController {
	private static final Log logger = 
			LogFactory.getLog(PictureController.class);
	
	@Autowired
	private PictureService pictureService;
	
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
			aPicture.setUrl("sampleImg/" + aPicture.getName() + PictureService.JPG_STRING);
			pictures.add(aPicture);
			i++;
		}
		
		model.addAttribute("pictures", pictures);
		model.addAttribute("uploadPicture", new UploadPicture());
		return "home";
	}
	
	@RequestMapping(value = "/pictureSave")
	public String savePicture(HttpServletRequest servletRequest,
			@ModelAttribute UploadPicture uploadPicture, BindingResult bindingResult,
			Model model) {
		
		MultipartFile imageFile = uploadPicture.getImageFile();
		
		if (imageFile != null) {
			String fileName = imageFile.getOriginalFilename();
			
			File imageToSave = new File(servletRequest.getServletContext()
					.getRealPath("/uploads"), fileName);
			try {
				imageFile.transferTo(imageToSave);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// save image in pictureService
			Picture picture = new Picture();
			// set name and url, id will be set when add method called
			picture.setName(fileName);
			picture.setUrl("uploads/" + fileName);
			// add picture
			Picture savedPicture = pictureService.add(picture);
			
			return "redirect:/uploadImgResults/" + savedPicture.getId();
		}
		
		
		// if imageFile is null
		return "home";
	}
	
}
