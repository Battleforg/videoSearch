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
		video1.put("name", "CBS news 2012.10.8");
		video1.put("path", "data/videos/20121008_CBS_News_20121008_1200_cc_segment_12.700k.mp4");
		video1.put("thumbnail", "data/thumbnails/20121008_CBS_News_20121008_1200_cc_segment_12.700k.mp4/thumbnail.jpg");
		Integer duration = 66;
		video1.put("duration", duration);
		List<Integer> hitPostions = new ArrayList<Integer>();
		hitPostions.add(64);
		video1.put("hits", hitPostions);
		List<Integer> shots = new ArrayList<Integer>();
		shots.add(56);shots.add(66);
		video1.put("shots", shots);	
		testSearch.add(video1);
		
		Map<String, Object> video2 = new HashMap<String, Object>();
		video2.put("name", "CNN news 2012.10.8");
		video2.put("path", "data/videos/20121008_CNN_20121008_1200_cc_segment_20.700k.mp4");
		video2.put("thumbnail", "data/thumbnails/20121008_CNN_20121008_1200_cc_segment_20.700k.mp4/thumbnail.jpg");
		duration = 630;
		video2.put("duration", duration);
		hitPostions = new ArrayList<Integer>();
		hitPostions.add(220);
		video2.put("hits", hitPostions);
		shots = new ArrayList<Integer>();
		shots.add(211);shots.add(229);
		video2.put("shots", shots);	
		testSearch.add(video2);
		
		Map<String, Object> video3 = new HashMap<String, Object>();
		video3.put("name", "NBC news 2012.10.8");
		video3.put("path", "data/videos/20121008_NBC_Nightly_News_20121008_1730_cc_segment_07.700k.mp4");
		video3.put("thumbnail", "data/thumbnails/20121008_NBC_Nightly_News_20121008_1730_cc_segment_07.700k.mp4/thumbnail.jpg");
		duration = 89;
		video3.put("duration", duration);
		hitPostions = new ArrayList<Integer>();
		hitPostions.add(11);
		video3.put("hits", hitPostions);
		shots = new ArrayList<Integer>();
		shots.add(4);shots.add(13);
		video3.put("shots", shots);	
		testSearch.add(video3);
		
		Map<String, Object> video4 = new HashMap<String, Object>();
		video4.put("name", "CNET 2012.12.11");
		video4.put("path", "data/videos/20121211_CNET_20121211_1200_cc_segment_09.700k.mp4");
		video4.put("thumbnail", "data/thumbnails/20121211_CNET_20121211_1200_cc_segment_09.700k.mp4/thumbnail.jpg");
		duration = 260;
		video4.put("duration", duration);
		hitPostions = new ArrayList<Integer>();
		hitPostions.add(22);
		video4.put("hits", hitPostions);
		shots = new ArrayList<Integer>();
		shots.add(17);shots.add(22);
		video4.put("shots", shots);	
		testSearch.add(video4);
		
		Map<String, Object> video5 = new HashMap<String, Object>();
		video5.put("name", "Today Show 2013.1.12");
		video5.put("path", "data/videos/20130112_Today_Show_20130112_0500_cc_segment_08.700k.mp4");
		video5.put("thumbnail", "data/thumbnails/20130112_Today_Show_20130112_0500_cc_segment_08.700k.mp4/thumbnail.jpg");
		duration = 132;
		video5.put("duration", duration);
		hitPostions = new ArrayList<Integer>();
		hitPostions.add(112);
		video5.put("hits", hitPostions);
		shots = new ArrayList<Integer>();
		shots.add(109);shots.add(113);
		video5.put("shots", shots);	
		testSearch.add(video5);
		
		
		for (Map<String, Object> video : testSearch) {
			Video aVideo = new Video();
			aVideo.setName(video.get("name").toString());
			aVideo.setUrl(video.get("path").toString());
			aVideo.setThumbnailUrl(video.get("thumbnail").toString());
			
			int aDuration = Integer.parseInt(video.get("duration").toString());
			aVideo.setDuration(aDuration);
			
			List<Integer> hitLists = (List<Integer>) video.get("hits");
			List<String> hits = new ArrayList<String>();
			for (Integer integer : hitLists) {
				String hitString = formatTime(integer);
				hits.add(hitString);
			}
			
			List<Integer> shotLists = (List<Integer>) video.get("shots");
			List<ShotPair> shotPairs = new ArrayList<ShotPair>();
			for (int i = 0; i < shotLists.size() - 1; i += 2) {
				String start = formatTime(shotLists.get(i));
				String end = formatTime(shotLists.get(i + 1));
				ShotPair shotPair = new ShotPair();
				shotPair.setStart(start);
				shotPair.setEnd(end);
				shotPairs.add(shotPair);
			}
			
			for (int i = 0; i < shotPairs.size(); i++) {
				ShotPair shotPair = shotPairs.get(i);
				String aHit = hits.get(i);
				shotPair.setHit(aHit);
				shotPairs.set(i, shotPair);
			}
			
			aVideo.setShots(shotPairs);
			
			
			// add result video to service and resultsList
			resultsList.add(videoService.add(aVideo));
		}
	
		return resultsList;
	}

	/**
	 * @param integer(second)
	 * @return String(minute:second)
	 */
	private String formatTime(Integer integer) {
		int m = integer.intValue() / 60;
		int s = integer.intValue() % 60;
		String hitString;
		if (s < 10) {
			hitString = m + ":0" + s;
		} else {
			hitString = m + ":" + s;
		}
		return hitString;
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
