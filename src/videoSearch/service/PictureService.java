package videoSearch.service;

import videoSearch.domain.Picture;

public interface PictureService {
	Picture add(Picture picture);
	Picture get(long id);
	Picture getSamplePicture(long id);
}
