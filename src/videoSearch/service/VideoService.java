/**
 * 
 */
package videoSearch.service;

import videoSearch.domain.Video;

/**
 * @author ÒÝ´Ï
 *
 */
public interface VideoService {
	Video add(Video video);
	Video get(String name);
}
