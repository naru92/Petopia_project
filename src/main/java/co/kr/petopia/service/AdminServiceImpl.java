package co.kr.petopia.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.xml.bind.attachment.AttachmentMarshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.controller.BoardController;
import co.kr.petopia.mapper.AdminMapper;
import co.kr.petopia.mapper.ProductAattachMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.ContentVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.FileUploadVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	ProductAattachMapper productAattachMapper;
	
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
	public List<ContentVO> getQnAListWithPaging(Criteria cri) {
		
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
	public void insertProduct(ProductVO productVO) {
		
		int next_val = adminMapper.product_seq_next();
		
		log.info("insertProduct()..");
		log.info("productVO :" + productVO);
		
		productVO.setProduct_idx(next_val);
		
		
		adminMapper.insertProduct(productVO);
		
		
		
		productVO.getProductVOList().forEach(attach->{
		log.info("attach : " +attach);
		attach.setProduct_idx(next_val);
		attach.setBoard_id(1);
		
		
		productAattachMapper.insertProductImage(attach);
	});
		
		
		
	}

	
	@Override
	public List<FileUploadVO> findByProduct(int product_idx) {
		log.info("get Attach list by product_idx" +  product_idx);
		
		return productAattachMapper.findByProduct(product_idx);
	}

	@Override
	public boolean updateProduct(ProductVO productVO) {
		log.info("updateProduct " + productVO);
		
		productAattachMapper.deleteAllProductImage(productVO.getProduct_idx());
		
		//성공실패
		boolean updateResult = adminMapper.updateProduct(productVO) == 1;
		
		//성공 && 첨부파일이 있으면 , 다날림
		if(updateResult && productVO.getProductVOList().size() > 0) {
			
			productVO.getProductVOList().forEach(attach -> {
				
				attach.setProduct_idx(productVO.getProduct_idx());
				
				productAattachMapper.insertProductImage(attach);
			});
		}
		
		return updateResult;
	}

	@Override
	public boolean deleteProduct(int product_idx) {

		log.info("delete products");
		
		productAattachMapper.deleteAllProductImage(product_idx);
		//성공실패 보여줌
		return adminMapper.deleteProduct(product_idx) == 1;
	}

	@Override
	public ProductVO getProductOne(int product_idx) {
		
		return adminMapper.getProductOne(product_idx);
	}





	

	

}
