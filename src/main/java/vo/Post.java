package vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Post {
	private final Long pno;
	private final String title;
	private final String id;
	private final String content;
	private final Long viewCount;
	private final Long likes;
	private final int cno;
	private final Date regdate;
	private final Date updatedate;
	private final boolean attachFlag;
	
	@Builder.Default
	private List<Attach> attachs = new ArrayList<>();

	public Post(Long pno, String title, String id, String content, Long viewCount, Long likes, int cno, Date regdate, Date updatedate, boolean attachFlag) {
		this.pno = pno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.viewCount = viewCount;
		this.likes = likes;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.cno = cno;
		this.attachFlag = attachFlag;
	}
	
	
}
