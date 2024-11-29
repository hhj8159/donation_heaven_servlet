package vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Attach {
	private String uuid;
	private String origin;
	private String path;
	private boolean image;
	private int downloadCount;
	private Long pno;
	private Date regdate;
}
