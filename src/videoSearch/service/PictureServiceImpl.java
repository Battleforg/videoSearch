package videoSearch.service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;

import videoSearch.domain.Picture;
@Service
public class PictureServiceImpl implements PictureService {

	private Map<Long, Picture> pictures = new HashMap<Long, Picture>();
	private AtomicLong generator = new AtomicLong();
	
	public PictureServiceImpl() {
		Picture picture = new Picture();
		picture.setName("sample");
		picture.setUrl("uploads/" + picture.getName() + JPG_STRING);
	}
	
	@Override
	public Picture add(Picture picture) {
		long newId = generator.incrementAndGet();
		picture.setId(newId);
		pictures.put(newId, picture);
		return picture;
	}

	@Override
	public Picture get(long id) {
		return pictures.get(id);
	}

	@Override
	public Picture getSamplePicture(long id) {
		Picture resultPicture = new Picture();
		resultPicture.setId(id);
		resultPicture.setName(Long.toString(id));
		resultPicture.setUrl("sampleImg/" + resultPicture.getName() + JPG_STRING);
		return resultPicture;
	}

}
