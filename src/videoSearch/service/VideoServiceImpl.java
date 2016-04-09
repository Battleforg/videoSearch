/**
 * 
 */
package videoSearch.service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;

import videoSearch.domain.Video;

/**
 * @author ÒÝ´Ï
 *
 */
@Service
public class VideoServiceImpl implements VideoService {
	
	public static final String MP4_STRING = ".mp4";
	private Map<String, Video>videos = new HashMap<String, Video>();
	private AtomicLong generator = new AtomicLong();
	
	public VideoServiceImpl() {
		// TODO Auto-generated constructor stub
		Video video = new Video();
		video.setName("k");
		video.setUrl("video/" + video.getName() + MP4_STRING);
	}
	
	@Override
	public Video add(Video video) {
		long newId = generator.incrementAndGet();
		video.setId(newId);
		videos.put(video.getName(), video);
		return video;
	}

	@Override
	public Video get(String name) {
		return videos.get(name);
	}

}
