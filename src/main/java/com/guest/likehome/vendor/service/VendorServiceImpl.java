package com.guest.likehome.vendor.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.vendor.mapper.VendorSQLMapper;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductCategory1Vo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductDetailImageVo;
import com.guest.likehome.vo.ProductScrapVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

@Service
public class VendorServiceImpl {

	@Autowired
	VendorSQLMapper vendorSQLMapper;
	
	//서비스 vendorRegister >> registerVendor
	public void registerVendor(VendorVo vendorVo) {
		vendorSQLMapper.insertVendor(vendorVo);
	}
	
	public VendorVo customerLogin(VendorVo vendorVo) {
	 VendorVo result = vendorSQLMapper.selectByBusinessAndPw(vendorVo);
	 
	 	return result;
	}
	
	public void updateVendor(VendorVo vendorVo) {
		vendorSQLMapper.updateVendor(vendorVo);
	}
	
	//판매자 상품 등록
	public void writeProduct (ProductVo productVo) {

		vendorSQLMapper.insertProduct(productVo);
	}
	
	//상품 타이틀 이미지 저장
	public void writeTitleImage(ProductTitleImageVo productTitleImageVo) {

		vendorSQLMapper.insertTitleImage(productTitleImageVo);
	}
	
	//상품 상세 이미지 저장
	public void writeDetailImage (ProductDetailImageVo productDetailImageVo) {

	vendorSQLMapper.insertDetailImage(productDetailImageVo);
	}
	
	//변수명 수정 No >> vendorNo
	//서비스 getProductList >> getProductListByVendorNo
	//mapper selectVendorProduct >> selectVendorProductByVendorNo
	//mapper selectByNo >> selectVendorByVendorNo
	//제품리스트(판매자 번호로)
	public ArrayList<HashMap<String, Object>>  getProductListByVendorNo 
		(int vendor_no, String searchType, String searchWord, int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProductVo> productList = 
		vendorSQLMapper.selectVendorProductByVendorNo(vendor_no,searchType,searchWord,pageNum);
		
		for(ProductVo productVo : productList) {
			int vendorNo = productVo.getVendor_no();
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(vendorNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("vendorVo",vendorVo);
			map.put("productVo",productVo);	
			
			dataList.add(map);
		}
		
		return dataList;
	}
	
	//서비스 getProductList2 >> getProductListByProductNo
	//mapper selectByProduct(2개가 있어서 1개는 삭제) >> selectByProductNo (productNo통일)
	//제품 상세페이지 품목 내용
	public HashMap<String, Object> getProductListByProductNo (int productNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ProductVo productVo = vendorSQLMapper.selectByProductNo(productNo);
		map.put("productVo", productVo);
		
		return map;
	}
	
	//mapper selectCount >> selectProductCountByVendorNo
	//페이징, 검색 
	public int getProductCount (int vendor_no, String searchType, String searchWord) {
		return vendorSQLMapper.selectProductCountByVendorNo(vendor_no, searchType, searchWord);
	}
	
	public int getOrderCount (String searchType, String searchWord) {
		return vendorSQLMapper.selectOrderCount(searchType, searchWord);
	}

	//타이틀 이미지 불러오기
	public ArrayList<HashMap<String, Object>> getTitleImageList (int product_no) {
	
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProductTitleImageVo> map = vendorSQLMapper.selectByTitleImage(product_no);
		
		for(ProductTitleImageVo productTitleImageVo : map) {
			
			HashMap<String, Object> titleImage = new HashMap<String, Object>();
			titleImage.put("productTitleImageVo",productTitleImageVo);	
			dataList.add(titleImage);
		}

		return dataList;
	} 
	
	//상품 상세 이미지 불러오기
	public ArrayList<HashMap<String, Object>> getDetaileImageList (int product_no) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProductDetailImageVo> map = vendorSQLMapper.selectByDetailImage(product_no);
		
		for(ProductDetailImageVo productDetailImageVo : map) {
			
			HashMap<String, Object> detailImage = new HashMap<String, Object>();
			detailImage.put("productDetailImageVo",productDetailImageVo);	
			dataList.add(detailImage);
		}

		return dataList;
	} 
	
	//카테고리1 불러오기
	public ArrayList<HashMap<String, Object>> getCategoryList1 (){
		
		ArrayList<HashMap<String, Object>> categoryDataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProductCategory1Vo> categoryList = vendorSQLMapper.selectProductCategory();
		
		for(ProductCategory1Vo productCategory1Vo : categoryList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productCategory1Vo",productCategory1Vo);	
			categoryDataList.add(map);
		}

		return categoryDataList;
	}
	
	//카테고리2 불러오기
	public ArrayList<HashMap<String, Object>> getCategoryList2 (){
		
		ArrayList<HashMap<String, Object>> categoryDataList2 = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProductCategory2Vo> categoryList2 = vendorSQLMapper.selectProductCategory2();
		
		for(ProductCategory2Vo productCategory2Vo : categoryList2) {
			
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("productCategory2Vo",productCategory2Vo);	
			categoryDataList2.add(map2);
		}

		return categoryDataList2;
	}
	
	//서비스 getCategoryList12 >> getCategoryList1ByCategoryList2
	//mapper selectProductCategory12 >> selectProductCategoryNo1ByProductCategoryNo2
	//카테고리1을 선택 했을시, 카테고리2가 나오도록
	public ArrayList<HashMap<String, Object>> getCategoryList1ByCategoryList2 (int product_category1_no){
		
		ArrayList<HashMap<String, Object>> categoryDataList2 = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProductCategory2Vo> categoryList2 = vendorSQLMapper.selectProductCategoryNo1ByProductCategoryNo2(product_category1_no);
		
		for(ProductCategory2Vo productCategory2Vo : categoryList2) {
						
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("productCategory2Vo",productCategory2Vo);	
			categoryDataList2.add(map2);
		}

		return categoryDataList2;
	}
	
	//서비스명 deleteProductByProductNo
	//mapper deleteProduct >> deleteProductByProductNo
	//상품 삭제
	public void deleteProductByProductNo(int product_no) {
		vendorSQLMapper.deleteProductByProductNo(product_no);
	}
	
	//상품 수정
	public void updateProduct(ProductVo productVo) {
		vendorSQLMapper.updateProduct(productVo);
	}
	
	//mapper selectByProduct(2개가 있어서 1개는 삭제) >> selectByProductNo (productNo 통일)
	//판매자 디테일리스트+프로덕트
	public ArrayList<HashMap<String, Object>> getOrderDetailList(int orderNo, int vendorNo){

		ArrayList<HashMap<String, Object>> OrderDetailList = new ArrayList<HashMap<String,Object>>();
		
		
		ArrayList<OrderDetailVo> orderDetailVoList = vendorSQLMapper.selectOrderDetailAll(orderNo);
		
		//System.out.println(orderNo);

		
		for(OrderDetailVo orderDetailVo : orderDetailVoList) {
			//System.out.println(orderDetailVo.getOrder_detail_no());
			int productNo = orderDetailVo.getProduct_no();
			//System.out.println(productNo);
			ProductVo productVo = vendorSQLMapper.selectByProductNo(productNo);
			//System.out.println(orderDetailVo.getOrder_detail_no());
			
			if(productVo.getVendor_no() == vendorNo) { //1
				//System.out.println(productVo.getVendor_no());
				//System.out.println(productVo.getProduct_no());
				//System.out.println(orderDetailVo.getOrder_detail_no());
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("orderDetailVo", orderDetailVo);
					//System.out.println(orderDetailVoSet.getOrder_detail_no());
				map.put("productVo", productVo);
					//System.out.println(productVoSet);
				OrderDetailList.add(map);
			}
			
			//System.out.println(OrderDetailList);
		}
		
		return OrderDetailList;
	}
	
	//mapper selectOrderByorderNo >> selectOrder
	public ArrayList<OrderVo> getVenderOrderList(String searchType, String searchWord, int pageNum) {
		
		 return vendorSQLMapper.selectOrder(searchType,searchWord,pageNum);
		 
	}
	
	//서비스 getVenderOrderList2 >> getVenderOrderListByOrderNo
	//mapper selectOrderByorderNo2 >> selectOrderByorderNo
	public ArrayList<OrderVo> getVenderOrderListByOrderNo(int orderNo) {
		
		 return vendorSQLMapper.selectOrderByorderNo(orderNo);
		 
	}
	
	//mapper selectOrderDetailByorderNo >> selectOrderDetailByOrderNo
	public ArrayList<OrderVo> getVenderOrderDetailList(int order_no) {
		
		 return vendorSQLMapper.selectOrderDetailByOrderNo(order_no);
		 
	}
	
	//mapper getCustomer >> getCustomerByCustomerNo
	public CustomerVo getCustomerList(int customerNo){
		return vendorSQLMapper.getCustomerByCustomerNo(customerNo);
	}
	
	public boolean isExistName(String product_name) {
		
		if(vendorSQLMapper.selectProductCountByName(product_name) > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public void updateDelivery (int delivery_statusageNum, int ORDER_DETAIL_NO) {
		
		vendorSQLMapper.updateDelivery(delivery_statusageNum, ORDER_DETAIL_NO);
	}
	
	public OrderDetailVo getDeliveryStatusNo (int detailNo) {
		return vendorSQLMapper.getDeliveryStatusNo(detailNo);
	}
	
	public HashMap<Integer, Integer> allOrderDetail(HttpSession session) {
		
		ProductVo productVo = new ProductVo();
		
		VendorVo vendorVo = (VendorVo)session.getAttribute("vendorInfo");
		ArrayList<OrderDetailVo> orderDetailVoList = vendorSQLMapper.allOrderDetail();
		
		HashMap<Integer, Integer> map =  new HashMap();
		
		for(OrderDetailVo orderDetailVo : orderDetailVoList) {
			
			int productNo = orderDetailVo.getProduct_no();
			productVo = vendorSQLMapper.selectByProductNo(productNo);
			
			if(vendorVo.getVendor_no() == productVo.getVendor_no()) {
				productNo = productVo.getProduct_no();
				productVo = vendorSQLMapper.selectByProductNo(productNo);
				int countProductNo = vendorSQLMapper.countProduct(productNo);
				map.put(productNo, countProductNo);
			}
			
		}

		return map;
	}
	
	public HashMap<Integer, Integer> allProductScrap(HttpSession session) {
		
		ProductVo productVo = new ProductVo();
		
		VendorVo vendorVo = (VendorVo)session.getAttribute("vendorInfo");
		ArrayList<ProductScrapVo> productScrapVoList = vendorSQLMapper.allProductScrap();
		
		HashMap<Integer, Integer> map =  new HashMap();
		
		for(ProductScrapVo productScrapVo : productScrapVoList) {
			
			int productNo = productScrapVo.getProduct_no();
			productVo = vendorSQLMapper.selectByProductNo(productNo);
			
			if(vendorVo.getVendor_no() == productVo.getVendor_no()) {
				productNo = productVo.getProduct_no();
				productVo = vendorSQLMapper.selectByProductNo(productNo);
				int countScrapNo = vendorSQLMapper.countScrapProduct(productNo);
				map.put(productNo, countScrapNo);
			}
			
		}

		return map;
	}
	
	public boolean countSelectVendorId(String vendor_business_number) {
		
		if(vendorSQLMapper.countSelectVendorId(vendor_business_number) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean countSelectVendorPw(String vendor_business_number,String vendor_pw) {
		
		if (vendorSQLMapper.countSelectVendorPw(vendor_business_number,vendor_pw) > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public String SelectVendorState(String vendor_business_number , String vendor_pw) {
		
		return vendorSQLMapper.SelectVendorState(vendor_business_number, vendor_pw);
	}
}
