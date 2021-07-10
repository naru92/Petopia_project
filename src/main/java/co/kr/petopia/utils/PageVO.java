package co.kr.petopia.utils;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PageVO {
	
	private int startPage; //시작
	private int endPage; // 끝
	private boolean prev, next; 
	
	private int total; //총 데이터수
	private Criteria cri;
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil( (total * 1.0) / cri.getAmount()) );
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		//1보다 클경우
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
}
