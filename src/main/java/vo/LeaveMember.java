package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class LeaveMember {
	private int mhno;
	private String id;
	private String email;
	private Date deletedate;
}
