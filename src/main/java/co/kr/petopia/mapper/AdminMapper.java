package co.kr.petopia.mapper;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.FileUploadVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;

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
	//상품 next.val
	public int product_seq_next();
	//상품 정보
	public ProductVO getProductOne(int product_idx);	
	//상품 통계
	public String getProductStatistics();
	//상품 등록
	public void insertProduct(ProductVO insertProductVO);
	//상품 수정
	public int updateProduct(ProductVO productVO);
	//상품 삭제
	public int deleteProduct(int product_idx);
	//금일 매출
	public int getTodayIncome();
	//신규 가입수
	public List<MemberVO> getTodayMemberList();
	//현재 주문 리스트
	public int currentOrderCount();
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
	public int getRefundCount();
	//총 기부 수
	public int getDonationCount(Criteria cri);
	//기부 리스트(페이징)
	public List<DonationVO> getDonationWithPaging(Criteria cri);
	//오늘 기부금
	public Integer getTodayDonation();
	//문의리스트
	public List<BoardVO> getQnAListWithPaging(Criteria cri);
	//문의수
	public int getTotalQnACount(Criteria cri); 
	//주문수(노페이징)
	public List<OrderVO> getOrderList();
	//배송수(노페이징)
	public List<DeliveryVO> getDeliveryList();
	//배송 검색필터
	public List<DeliveryVO> selectOptionDeliveryList(HashMap<String, Object> optionMap);
	//주문 검색필터
	public List<OrderVO> selectOptionOrderList(HashMap<String, Object> optionMap);
	//도네이션 검색필터
	public List<DonationVO> selectOptionDonationList(HashMap<String, Object> optionMap);
	//QnA 필터검색
	public List<BoardVO> selectOptionQnAList(HashMap<String, Object> optionMap);
	//가입수 메인 통계
	public LinkedList<MemberVO> get5DaysStatisticsMemberCount();
	//상품 이미지 등록
	public List<FileUploadVO> insertProductImage (FileUploadVO fileUploadVO);
	//파일첨부리스트
	public List<FileUploadVO> findByproduct(int product_idx);
	//회원삭제
	public void deleteMember (MemberVO memberVO);
	//총회원수(통계리스트용 맴버 총 수)
	public int getTotalCount(Criteria cri);
	//메인페이지 오더카운트
	public int getStatisticsOrderCount();
	//메인페이지 총회원수
	public int getTotalMemberCount();
	//딜리버리 상태변경
	public void updateDeliveryState(DeliveryVO deliveryVO);
	//3개월치 맴버
	public List<MemberVO> member_statistics_3month();
	//3개월치 기부
	public List<MemberVO> donation_statistics_3month();
	//3개월치 상품
	public List<ProductVO> order_statistics_3month();
	
}
