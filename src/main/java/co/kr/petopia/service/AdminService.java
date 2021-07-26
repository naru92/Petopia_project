package co.kr.petopia.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.FileUploadVO;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;

public interface AdminService {
	
	/*맴버*/
	public List<MemberVO> getMemberList();
	public List<MemberVO> getMemberListWithPaging(Criteria cri);
	public int getTotalMemberCount(Criteria cri);
	public List<MemberVO> getTodayMemberList();
	public int deleteMember(MemberVO vo);
	
	/*상품*/	
	public List<ProductVO> getProductListWithPaging(Criteria cri);
	public int getTotalProductCount(Criteria cri);
	public List<ProductVO> getSelectOptionList(HashMap<String, Object> result);
	
	/*주문*/
	public int getOrderCount(Criteria cri);
	public List<OrderVO> getOrderListWithPaging(Criteria cri);
	
	/*배송*/
	public int getDeliveryCount(Criteria cri);
	public List<DeliveryVO> getDeliveryListWithPaging(Criteria cri);
	public List<DeliveryVO> getUnprocessedOrderList();//미처리 배송
	public int getRefundCount(); //교환,환불처리
	public List<DeliveryVO> getDeliveryList();//딜리버리 목록
	public void updateDeliveryState(DeliveryVO deliveryVO);//배송상태변경
	
	/*기부*/
	public int getDonationCount(Criteria cri);
	public List<DonationVO> getDonationWithPaging(Criteria cri);
	public int getTodayDonation();//금일 도네
	public List<DonationVO> selectOptionDonationList(HashMap<String, Object> optionMap); //필터옵션 도네
	
	/*문의게시판*/
	public int getTotalQnACount(Criteria cri);
	public List<BoardVO> getQnAListWithPaging(Criteria cri);
	public List<BoardVO> selectOptionQnAList(HashMap<String, Object> optionMap);	
	/*통계(DB수정필요)*/
	public LinkedList<MemberVO> get5DaysStatisticsMemberCount(); //메인페이지 가입수 통계
	public int getStatisticsOrderCount(); //총주문수 메인
	public int getTotalMemberCount(); //총맴버 메인
	
	/*기타*/
	public Integer getTodayIncome(); //금일 수입
	
	
	//현재주문 리스트
	public int currentOrderCount();
	
	//주문 리스트(페이징)
	int getTotalOrderList(Criteria cri);
	//주문 리스트(노페이징)
	public List<OrderVO> getOrderList();
	
	//주문 검색 필터
	public List<DeliveryVO> selectOptionDeliveryList(HashMap<String, Object> optionMap);
	//주문 필터 리스트
	public List<OrderVO> selectOptionOrderList(HashMap<String, Object> optionMap);
	
	
	/*상품 CRUD*/
	//다음상품
	
	/*상품*/
	//상세조회
	public ProductVO getProductOne(int product_idx);
	//등록
	public void insertProduct(ProductVO insertProductVO);
	//상품 수정
	public boolean updateProduct(ProductVO productVO);
	//상품 삭제
	public boolean deleteProduct(int product_idx);
	
	
	/*file*/
	public List<FileUploadVO> findByProduct(int product_idx);
	
	/* 통계 */
	public List<MemberVO> donation_statistics_3month();
	public List<MemberVO> member_statistics_3month();
	public List<ProductVO> order_statistics_3month();
	
	
	
	
	
	
	
}
