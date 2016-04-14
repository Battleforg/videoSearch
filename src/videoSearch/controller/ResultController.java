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
import videoSearch.domain.ShotPair;
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
	@SuppressWarnings("unchecked")
	private List<Video> doSearching(String imageUrl) {
		List<Video> resultsList = new ArrayList<Video>();
		if (imageUrl == null) {
			return null;
		}
		
		// call search
		List<Map<String, Object>> testSearch = new ArrayList<Map<String, Object>>();
		Map<String, Object> video1 = new HashMap<String, Object>();
		video1.put("name", "testVideo1");
		video1.put("path", "video/test3.mp4");
		video1.put("thumbnail", "image/sample.jpg");
		Integer duration = 1320;
		video1.put("duration", duration);
		List<Integer> hitPostions = new ArrayList<Integer>();
		hitPostions.add(50);
		hitPostions.add(250);
		video1.put("hits", hitPostions);
		List<Integer> shots = new ArrayList<Integer>();
		shots.add(50);shots.add(100);
		shots.add(200);shots.add(300);
		video1.put("shots", shots);	
		testSearch.add(video1);
		
		for (Map<String, Object> video : testSearch) {
			Video aVideo = new Video();
			aVideo.setName(video.get("name").toString());
			aVideo.setUrl(video.get("path").toString());
			aVideo.setThumbnailUrl(video.get("thumbnail").toString());
			
			int aDuration = Integer.parseInt(video.get("duration").toString());
			aVideo.setDuration(aDuration);
			
			List<Integer> hitLists = (List<Integer>) video.get("hits");

			
			List<Integer> shotLists = (List<Integer>) video.get("shots");
			List<ShotPair> shotPairs = new ArrayList<ShotPair>();
			for (int i = 0; i < shotLists.size() - 1; i += 2) {
				int start = shotLists.get(i).intValue();
				int end = shotLists.get(i + 1).intValue();
				ShotPair shotPair = new ShotPair();
				shotPair.setStart(start);
				shotPair.setEnd(end);
				shotPairs.add(shotPair);
			}
			
			
			aVideo.setHits(hitLists);
			aVideo.setShots(shotPairs);
			
			
			// add result video to service and resultsList
			resultsList.add(videoService.add(aVideo));
		}
	
		return resultsList;
	}
	
	@RequestMapping(value = "/sampleImgResults/{id}")
	public String displaySampleImgResults(@PathVariable Long id, Model model) {
		// get sample image
		Picture picture = pictureService.getSamplePicture(id);
		model.addAttribute("picture", picture);
		
		// do searching
		List<Video> videos = doSearching(picture.getUrl());
		
		model.addAttribute("videos", videos);
		return "displayResults";
	}
	
	@RequestMapping(value = "/uploadImgResults/{id}")
	public String displayUploadImgResults(@PathVariable Long id, Model model) {
		// get upload image
		Picture picture = pictureService.get(id);
		model.addAttribute("picture", picture);
		
		// do searching
		List<Video> videos = doSearching(picture.getUrl());
		
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
