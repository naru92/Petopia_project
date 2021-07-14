package co.kr.petopia.service;

import java.util.HashMap;
import java.util.List;

import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.ContentVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;

public interface AdminService {
	
	/*맴버*/
	public List<MemberVO> getMemberList();
	public List<MemberVO> getMemberListWithPaging(Criteria cri);
	public int getTotalMemberCount(Criteria cri);
	public List<MemberVO> getTodayMemberList();
	
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
	public List<DeliveryVO> getRefundList(); //교환,환불처리
	public List<DeliveryVO> getDeliveryList();
	
	/*기부*/
	public int getDonationCount(Criteria cri);
	public List<DonationVO> getDonationWithPaging(Criteria cri);
	public int getTodayDonation();//금일 도네
	
	/*문의게시판*/
	public int getQnACount(Criteria cri);
	public List<ContentVO> getQnAListWithPaging(Criteria cri);
		
	/*통계(DB수정필요)*/
	
	/*기타*/
	public int getTodayIncome(); //금일 수입
	
	
	//현재주문 리스트
	public List<OrderVO> getCurrentOrderList();
	
	//주문 리스트(페이징)
	int getTotalOrderList(Criteria cri);
	//주문 리스트(노페이징)
	public List<OrderVO> getOrderList();
	
	//주문 검색 필터
	public List<DeliveryVO> selectOptionDeliveryList(HashMap<String, Object> optionMap);
	//주문 필터 리스트
	public List<OrderVO> selectOptionOrderList(HashMap<String, Object> optionMap);
	
	
	
	
	
	
}
