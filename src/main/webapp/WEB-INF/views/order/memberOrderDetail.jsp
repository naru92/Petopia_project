<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송조회 | Petopia</title>
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/orderdetail_style.css">

</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>
	<main>
		<section>
			<!-- Latest Products Start -->
			<div class="article">
				<div class="heading heading3">
					<h3 class="text">주문 상세정보</h3>
				</div>
				<!-- 결제 대기중 -->
				<!-- 결제 실패 -->
				<div class="bx bx_padding vsb">
					<ul class="fl order_info2">
						<li class="first">
							<dl>
								<dt>주문일자</dt>
								<dd>
									<strong>${m.order_date_str}</strong>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주문번호</dt>
								<dd class="ordnum">
									<strong class="pointcol">${m.order_idx}</strong> 
								</dd>
							</dl>
						</li>
					</ul>
				</div>



				<table cellspacing="0" border="1" class="tb_list mgt">
					<col width="110">
					<col width="">
					<col width="97">
					<col width="99">
					<col width="90">
					<col width="108">
					<thead>
						<tr>
							<th scope="col"><strong>상품주문번호</strong></th>
							<th scope="col">상품정보</th>
							<th scope="col">상품금액<br>(수량)</th>
							<th scope="col" class="bg_point">배송비</th>
							<th scope="col" colspan="2" class="bg_point">진행상태</th>
						</tr>
					</thead>
					<tbody>
						<tr class="group">
							<td><span class="thm ordernum2">${m.order_idx}</span></td>
							<td class="product">
								<div>
									<div class="thmb">
										<div class="img_center">
											<a href="https://inflow.pay.naver.com/rd?no=510425330&tr=ppc&pType=P&retUrl=https%3A%2F%2Fsmartstore.naver.com%2Fmain%2Fproducts%2F5072418195&vcode=DfRoYBanSIkBtBUCF6L7IumF0g3tI732njFSPgWUWcSpFxsxHa1RcRwHVJhfAV0ov7ilUSoYDzaPwlp%2Fa%2BrUNghSkWU9am%2FJ4dXT%2FLmXOyq6pbJn22nY9CA8H%2FtbNt9V"
												target="_blank">
											<img src="https://order.pay.naver.com/proxy/phinf/shop1/20210620_13/1624176497501Bzmsl_PNG/25312331315102778_519104205.png?type=m80"></a>
										</div>
									</div>
									<dl>
										<dt>
											<strong class="name_seller">${m.product_detail_info}</strong> 
											<a href="#"	target="_blank">${m.product_name}</a>
										</dt>
									</dl>
								</div>
							</td>
							<td class="money"><em class="thm">${m.product_price * m.order_quantity}</em>원<br> <span>(${m.order_quantity}개)</span></td>
							<td class="bg_point state">무료배송<br />
							<td class="bg_point state">${m.delivery_state}<br />
							<td class="bg_point state">구매미확정<br />
							</td>

						</tr>
					</tbody>
				</table>


				<form>
					<div class="heading heading2 mgt6">
						<h4>주문/결제 금액 정보</h4>
						<div class="fr_section"></div>
					</div>

					<table cellspacing="0" border="1" class="tb_list2">
						<colgroup>
							<col>
							<col width="297">
						</colgroup>
						<tbody>

							<tr class="first">
								<td class="money">
									<div class="l_none">
										<dl class="first">
											<dt>주문금액</dt>
											<dd>
												<!-- 주문금액 -->
												<ul class="price_list">
													<li><strong>상품금액</strong>
														<p>
															<em class="thm">${m.product_price * m.order_quantity}</em>원
														</p>
													</li>
												</ul>
											</dd>
										</dl>
										<dl class="end">
											<dt>결제상세</dt>
											<dd>
												<!-- 주결제수단 정보 -->
												<ul class="price_list">
													<li>
														<c:set var="pay" value="${u.payment_method}"/>
														<c:if test="${pay eq '1'}">
															<strong>무통장입금</strong>
														</c:if>
														<c:if test="${pay eq '2'}">
															<strong>카드결제</strong>
														</c:if>
														<p>
															<em class="thm">${m.product_price * m.order_quantity}</em>원
														</p>
													</li>
												</ul>
											</dd>
										</dl>
									</div>
								</td>
								<!-- [D] 나중에 결제가 있는 경우 rowspan="4"으로 변경 부탁드립니다. -->
								<td rowspan="4" class="amount bg_point">
									<dl class="">
										<dt class="blind">결제정보</dt>
										<dd>
											<ul>
												<li class="final_payment_price"><strong>주문금액</strong>
													<p>
														<em class="thm">${m.product_price * m.order_quantity}</em>원
													</p></li>
												<li>
													<c:set var="pay" value="${u.payment_method}"/>
													<c:if test="${pay eq '1'}">
														<strong>무통장입금</strong>
													</c:if>
													<c:if test="${pay eq '2'}">
														<strong>카드결제</strong>
													</c:if>
													<p>
														<em class="thm">${m.product_price * m.order_quantity}</em>원
													</p>
												</li>
											</ul>
										</dd>
									</dl>
								</td>
							</tr>
								<tr>
									<td>
							            <dl class="spot_benefit_pay benefit_fold_panel _toggleBenefit on">
							                <dt class="fold_heading">
												<strong>포인트 혜택</strong>
												<span class="p_color_green">최대 100원 적립</span>
											</dt>
							            </dl>
									</td>
								</tr>
						</tbody>
					</table>
				</form>


				<form class="_deliveryForm">
					<div class="heading heading2 mgt6">
						<h4 id="DELIVERY">배송지 정보</h4>
						<div class="fr_section"></div>
					</div>
					<div class="input_section2 _input_section">
						<div class="inp_area _deliveryPlace">
							<table cellspacing="0" border="1" class="tb_input2">
								<col width="91">
								<col>
								<thead class="blind">
									<th scope="col">배송지 정보</th>
									<th scope="col">배송지 정보입력</th>
								</thead>
								<tbody>
									<tr class="gap">
										<th scope="row">수령인</th>
										<td>${m.order_receiver_name}</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td><span class="tel">${m.order_receiver_phonenumber}</span></td>
									</tr>
									<tr>
										<th scope="row">배송지</th>
										<td class="address">${m.order_receiver_address}<br>
										</td>
									</tr>
								</tbody>

							</table>
						</div>
						<div class="view_area pdb3">
							<dl>
								<dt>
									<strong class="fl">주문자 정보</strong>
									<!--N=a:odd.changeinfo-->
								</dt>
								<dd class="pdb">
									<strong>${m.order_name}</strong>
									<p>
										${m.user_phonenumber}<br>
									</p>
								</dd>
							</dl>
						</div>
					</div>
				</form>
				<br>
				<p class="notice_txt">* 판매자 상황에 따라 배송 일정이 변경될 수 있으며, 정확한 일정은 고객센터에 문의해주시기 바랍니다.</p>
				<div>
					<input type="button" id="historyBtn" value="이전페이지" onClick="history.go(-1)"> 
				</div>			
			</div>
		</section>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>