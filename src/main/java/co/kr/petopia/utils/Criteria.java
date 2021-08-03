package co.kr.petopia.utils;


import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter @Setter @ToString
@AllArgsConstructor 
public class Criteria {
	
	private int board_id;
	
	private int pageNum; //페이지 번호	
	private int amount;  //페이지당 보여줄 데이터 갯수
	
	private String type; //타입
	private String keyword; //키워드
	
	public Criteria() {
		this(1,10); //1버튼 10page
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount());
				
		
		return builder.toUriString();
	}
}