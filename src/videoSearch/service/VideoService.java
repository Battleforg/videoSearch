/**
 * 
 */
package videoSearch.service;

import videoSearch.domain.Video;

/**
 * @author �ݴ�
 *
 */
public interface VideoService {
	Video add(Video video);
	Video get(String name);
}
