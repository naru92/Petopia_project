package co.kr.petopia.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.ContentVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.MemberVO;

@Mapper
public interface AdminMapper{
	
	//맴버목록 가져오기
	public List<MemberVO> getMemberList();
	//맴버 목록 페이징
	public List<MemberVO> getMemberListWithPaging(Criteria cri);
	//총 회원수
	public int getTotalMemberCount(Criteria cri);
	//상품 목록 페이징
	public List<ProductVO> getProductListWithPaging(Criteria cri);
	//총 상품수
	public int getTotalProductCount(Criteria cri);
	//상품 정보
	public ProductVO getProductOne(int product_idx);	
	//상품 통계
	public String getProductStatistics();
	//상품 등록
	public ProductVO insertProduct(ProductVO productVO);
	//상품 수정
	public ProductVO updateProduct(ProductVO productVO);
	//상품 삭제
	public void deleteProduct(int product_idx);
	//금일 매출
	public int getTodayIncome();
	//신규 가입수
	public List<MemberVO> getTodayMemberList();
	//현재 주문 리스트
	public List<OrderVO> getCurrentOrderList();
	//총 주문량
	public int getTotalOrderList();
	//미처리배송
	public List<DeliveryVO> getUnprocessedOrderList();
	//문의 답변 등록
	public BoardVO insertQnA(BoardVO QnA);
	//필터검색
	public List<ProductVO> getSelectOptionList(HashMap<String, Object> result);
	//총주문수
	public int getOrderCount(Criteria cri);
	//주문 페이징
	public List<OrderVO> getOrderListWithPaging(Criteria cri);
	//총주문수
	public int getTotalOrderList(Criteria cri);
	//총 배송 수
	public int getDeliveryCount(Criteria cri);
	//배송리스트(페이징)
	public List<DeliveryVO> getDeliveryListWithPaging(Criteria cri);
	//환불,반품 요청리스트
	public List<DeliveryVO> getRefundList();
	//총 기부 수
	public int getDonationCount(Criteria cri);
	//기부 리스트(페이징)
	public List<DonationVO> getDonationWithPaging(Criteria cri);
	//오늘 기부금
	public int getTodayDonation();
	//문의리스트
	public List<ContentVO> getQnAListWithPaging(Criteria cri);
	//문의수
	public int getQnACount(Criteria cri); 
	//배송 검색필터
	List<DeliveryVO> selectOptionDeliveryList(HashMap<String, Object> optionMap);
	
	public List<DeliveryVO> getDeliveryList();
}
