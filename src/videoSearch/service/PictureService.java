package videoSearch.service;

import videoSearch.domain.Picture;

public interface PictureService {
	
	public static final String JPG_STRING = ".jpg";
	
	Picture add(Picture picture);
	Picture get(long id);
	Picture getSamplePicture(long id);
}
