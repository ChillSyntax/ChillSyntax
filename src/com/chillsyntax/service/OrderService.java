package com.chillsyntax.service;

import java.util.List;

import com.chillsyntax.beans.OrderBean;
import com.chillsyntax.beans.OrderDetails;
import com.chillsyntax.beans.TransactionBean;

public interface OrderService {

	public String paymentSuccess(String userName, double paidAmount);

	public boolean addOrder(OrderBean order);

	public boolean addTransaction(TransactionBean transaction);

	public int countSoldItem(String prodId);

	public List<OrderBean> getAllOrders();

	public List<OrderBean> getOrdersByUserId(String emailId);

	public List<OrderDetails> getAllOrderDetails(String userEmailId);

	public String shipNow(String orderId, String prodId);
}
