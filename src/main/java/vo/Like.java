package vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Like {	
		private String id;
		private String pno;
		private Date regdate;
}
