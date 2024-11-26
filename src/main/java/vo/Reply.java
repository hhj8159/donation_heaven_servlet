package vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

	private Long rno;
	private String id;
	private String content;
	private int likes;
	private Long pno;
	private Long parentIdx;
	private int deptno;
	private int order;
	private Date regdate;
	private Date updatedate;
	
}