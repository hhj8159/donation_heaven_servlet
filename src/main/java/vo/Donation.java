package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Donation {
	private int dno;
	private int mno;
	private int dcno;
//	private int dtno;
	private Date regdate;	
	private String buyerAddr;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;
	private String cardName;
	private String cardNumber;
	private String impUid;
	private String merchantUid;
	private String name;
	private Long price;
	private String payType;
//	private String paidAmount;
//	private String payMethod;
	private String pgTid;

}
