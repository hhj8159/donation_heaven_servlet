package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
public class Member {
	private int mno;
	private int grade;
	private String id;
	private String pw;
	private String name;
	private int gender;
	private String birthday;
	private String tel;
	private int total;
	private String email;
	private String roadAddr;
	private String detailAddr;
	private int zipcode;
	private Date regdate;
	private Date updatedate;
	private String kakao;
	private String gname;
	private boolean sns;
}
