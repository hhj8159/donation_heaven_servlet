package dto;
// 페이지에 관한 규정, 표준
// 쿼리스트링

import java.lang.reflect.Field;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Criteria {	
	private int page = 1; 
	private int amount; 
	private int category;
	private String type;
	private String keyword;
	
	public int getOffset() { 
		return (page - 1) * amount;
	}
	
	
	//request 분석 후 필드초기화
	public Criteria (HttpServletRequest req) {

		if(req == null) return;

		String c = req.getParameter("category");
		
		String a = req.getParameter("amount");
		
		//category가 4일 경우 amount 9
		// 고칠거있음.....(잘모르겟음ㅠㅠ)
		
		if(c == null)
			return;
		
		if(a == null) {
			if(c != null && c.equals("4")) {
				this.amount = 9;		
			}
			else {
				this.amount = 10;			
			}			
		}
		
		
		
		
		Field[] fields = getClass().getDeclaredFields();
		
		for(Field field : fields) {
			String tmp = req.getParameter(field.getName());

			if(tmp != null && !tmp.equals("")) {
			
				try {
					Object obj = tmp;
					if(field.getType() == int.class) {
						obj = Integer.parseInt(tmp);
					}
					field.set(this, obj);
				} catch (IllegalArgumentException | IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}	
	}

	public String getQs2() {
		return "page="+page+"&"+getQs();
	}
	
	public String getQs() {
		Field[] fields = getClass().getDeclaredFields();	
		String[] strs = new String[4];
		Stream.of(fields).filter(f->!f.getName().equals("page")).map(f-> {
			String r = null;
			try {
				r = f.getName()+ "=" +(f.get(this) == null ? "" : f.get(this)); 
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
			return r;
			
		}).collect(Collectors.toList()).toArray(strs);
		return String.join("&", strs);
	}
	
	public String[] getTypeArr() {
		return type.split("");
	}
}
