package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
public class Donation {
	private int dno;
	private int mno;
	private int dcno;
	private int dtno;
	private Long price;
	private String roadAddr;
	private String detailAddr;
	private String paytype;
	private Date regdate;

}
