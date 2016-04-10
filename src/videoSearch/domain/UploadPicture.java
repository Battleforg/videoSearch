package videoSearch.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class UploadPicture implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2569104812271724442L;

	
	
	private MultipartFile imageFile;
	
	public MultipartFile getImageFile() {
		return imageFile;
	}
	
	public void setImageFile(MultipartFile multipartImageFile) {
		this.imageFile = multipartImageFile;
	}
}
