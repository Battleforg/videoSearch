package videoSearch.domain;

import java.io.Serializable;

public class ShotPair implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4119113407964768089L;
	private String start;
	private String end;
	private String hit;
	/**
	 * @return the start
	 */
	public String getStart() {
		return start;
	}
	/**
	 * @param start the start to set
	 */
	public void setStart(String start) {
		this.start = start;
	}
	/**
	 * @return the end
	 */
	public String getEnd() {
		return end;
	}
	/**
	 * @param end the end to set
	 */
	public void setEnd(String end) {
		this.end = end;
	}
	/**
	 * @return the hit
	 */
	public String getHit() {
		return hit;
	}
	/**
	 * @param hit the hit to set
	 */
	public void setHit(String hit) {
		this.hit = hit;
	}
}
