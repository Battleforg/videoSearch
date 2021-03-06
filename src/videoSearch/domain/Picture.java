package videoSearch.domain;

import java.io.Serializable;

public class Picture implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5906296954301585788L;
	private String name;
	private String url;
	private long id;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

}
