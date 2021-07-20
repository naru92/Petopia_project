package co.kr.petopia.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.AdminMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> getMemberList() {
		
		return adminMapper.getMemberList();
	}

	@Override
	public List<MemberVO> getMemberListWithPaging(Criteria cri) {
		
		return adminMapper.getMemberListWithPaging(cri);
	}

	@Override
	public int getTotalMemberCount(Criteria cri) {
		
		return adminMapper.getTotalMemberCount(cri);
	}

	@Override
	public List<ProductVO> getProductListWithPaging(Criteria cri) {
		
		return adminMapper.getProductListWithPaging(cri);
	}

	@Override
	public int getTotalProductCount(Criteria cri) {
		
		return adminMapper.getTotalProductCount(cri);
	}

	@Override
	public List<ProductVO> getSelectOptionList(HashMap<String, Object> result) {
	
		return adminMapper.getSelectOptionList(result);
	}

	@Override
	public List<MemberVO> getTodayMemberList() {
		return adminMapper.getTodayMemberList();
	}

	@Override
	public int getOrderCount(Criteria cri) {
		return adminMapper.getOrderCount(cri);
	}

	@Override
	public List<OrderVO> getOrderListWithPaging(Criteria cri) {
		return adminMapper.getOrderListWithPaging(cri);
	}

	@Override
	public int getTotalOrderList(Criteria cri) {
		return adminMapper.getTotalOrderList(cri);
	}

	@Override
	public int getDeliveryCount(Criteria cri) {
		return adminMapper.getDeliveryCount(cri);
	}

	@Override
	public List<DeliveryVO> getDeliveryListWithPaging(Criteria cri) {
		return adminMapper.getDeliveryListWithPaging(cri);
	}

	@Override
	public List<DeliveryVO> getUnprocessedOrderList() {
		
		return adminMapper.getUnprocessedOrderList();
	}

	@Override
	public List<DeliveryVO> getRefundList() {
		return adminMapper.getRefundList();
	}

	@Override
	public int getDonationCount(Criteria cri) {
		return adminMapper.getDonationCount(cri);
	}

	@Override
	public List<DonationVO> getDonationWithPaging(Criteria cri) {
		return adminMapper.getDonationWithPaging(cri);
	}

	@Override
	public int getTodayDonation() {
		return adminMapper.getTodayDonation();
	}

	@Override
	public int getTodayIncome() {
		return adminMapper.getTodayIncome();
	}
	
	@Override
	public List<OrderVO> getCurrentOrderList() {
		return adminMapper.getCurrentOrderList();
	}

	@Override
	public int getQnACount(Criteria cri) {
		return adminMapper.getQnACount(cri);
	}

	@Override
	public List<BoardVO> getQnAListWithPaging(Criteria cri) {
		
		return adminMapper.getQnAListWithPaging(cri);
	}

	@Override
	public List<DeliveryVO> selectOptionDeliveryList(HashMap<String, Object> optionMap) {
		return adminMapper.selectOptionDeliveryList(optionMap);
	}

	@Override
	public List<DeliveryVO> getDeliveryList() {
		
		return adminMapper.getDeliveryList();
	}

	@Override
	public List<OrderVO> getOrderList() {
		return adminMapper.getOrderList();
	}

	@Override
	public List<OrderVO> selectOptionOrderList(HashMap<String, Object> optionMap) {
		return adminMapper.selectOptionOrderList(optionMap);
	}

	@Override
	public LinkedList<MemberVO> getStatisticsMemberCount() {
		
		return adminMapper.getStatisticsMemberCount();
	}

	@Override
	public void insertProduct(ProductVO insertProductVO) {
		// TODO Auto-generated method stub
		
	}





	

	

}
