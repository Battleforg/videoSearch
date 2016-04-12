package videoSearch.domain;

import java.io.Serializable;

public class ShotPair implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4119113407964768089L;
	private int start;
	private int end;
	/**
	 * @return the start
	 */
	public int getStart() {
		return start;
	}
	/**
	 * @param start the start to set
	 */
	public void setStart(int start) {
		this.start = start;
	}
	/**
	 * @return the end
	 */
	public int getEnd() {
		return end;
	}
	/**
	 * @param end the end to set
	 */
	public void setEnd(int end) {
		this.end = end;
	}
}
