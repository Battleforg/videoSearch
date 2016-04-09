package videoSearch.controller;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import videoSearch.domain.Picture;
import videoSearch.domain.Video;
import videoSearch.service.PictureService;
import videoSearch.service.VideoService;

@Controller
public class ResultController {
	private static final Log logger = 
			LogFactory.getLog(PictureController.class);
	
	@Autowired
	private PictureService pictureService;
	@Autowired
	private VideoService videoService;
	
	/**
	 * use imageUrl from other controller to search 
	 * videos.
	 * @param imageUrl
	 * @return
	 */
	private List<Video> doSearching(String imageUrl) {
		List<Video> resultsList = new ArrayList<Video>();
		if (imageUrl == null) {
			return null;
		}
		
		// call search
		List<Map<String, String>> testSearch = new ArrayList<Map<String, String>>();
		Map<String, String> video1 = new HashMap<String, String>();
		video1.put("name", "testVideo1");
		video1.put("url", "video/k.mp4");
		video1.put("thumbnail", "image/sample.jpg");
		testSearch.add(video1);
		
		for (Map<String, String> map : testSearch) {
			Video aVideo = new Video();
			aVideo.setName(map.get("name"));
			aVideo.setUrl(map.get("url"));
			aVideo.setThumbnailUrl(map.get("thumbnail"));
			// add result video to service and resultsList
			resultsList.add(videoService.add(aVideo));
		}
	
		return resultsList;
	}
	
	@RequestMapping(value = "/displayResults/{id}")
	public String displayResults(@PathVariable Long id, Model model) {
		Picture picture = pictureService.getSamplePicture(id);
		model.addAttribute("picture", picture);
		List<Video> videos = doSearching("imageUrl");
		model.addAttribute("videos", videos);
		return "displayResults";
	}
	
	
	@RequestMapping(value = "/videoPlayer/{name}")
	public String showVideo(@PathVariable String name, Model model) {
		logger.info("videoPlayer called");
		Video video = videoService.get(name);
		model.addAttribute("video", video);
		return "videoPlayer";
	}
}
