package videoSearch.domain;

import java.io.Serializable;
import java.util.List;

public class Video implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3678169934128646734L;
	private String name;
	private String url;
	private String thumbnailUrl;
	private Long id;
	private int duration;
	private List<String> hits;
	private List<ShotPair> shots;

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}
	
	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**
	 * @return the thumbnailUrl
	 */
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	
	/**
	 * @param thumbnailUrl the thumbnailUrl to set
	 */
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the duration
	 */
	public int getDuration() {
		return duration;
	}

	/**
	 * @param duration the duration to set
	 */
	public void setDuration(int duration) {
		this.duration = duration;
	}

	/**
	 * @return the hits
	 */
	public List<String> getHits() {
		return hits;
	}

	/**
	 * @param hits the hits to set
	 */
	public void setHits(List<String> hits) {
		this.hits = hits;
	}

	/**
	 * @return the shots
	 */
	public List<ShotPair> getShots() {
		return shots;
	}

	/**
	 * @param shotPairs the shots to set
	 */
	public void setShots(List<ShotPair> shotPairs) {
		this.shots = shotPairs;
	}
	
	
	
}
