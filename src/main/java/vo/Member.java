package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int mno;
	private int grade;
	private String id;
	private String pw;
	private String username;
	private int gender;
	private Date birthday;
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
