/**
 * 
 */
package Model;

import java.time.LocalDate;

/**
 * 
 */
public class Orders extends Users{
	private int orderId;
	private double orderTotal;
	private String orderStatus;
	private LocalDate orderDate;
	
	public Orders()
	{
		
	}
	public Orders(int orderId, double orderTotal, String orderStatus, LocalDate orderDate)
	{
		this.orderId = orderId;
		this.orderTotal = orderTotal;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		
	}
	/**
	 * @return the orderId
	 */
	public int getOrderId() {
		return orderId;
	}

	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	/**
	 * @return the orderTotal
	 */
	public double getOrderTotal() {
		return orderTotal;
	}

	/**
	 * @param orderTotal the orderTotal to set
	 */
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}

	/**
	 * @return the orderStatus
	 */
	public String getOrderStatus() {
		return orderStatus;
	}

	/**
	 * @param orderStatus the orderStatus to set
	 */
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	/**
	 * @return the orderDate
	 */
	public LocalDate getOrderDate() {
		return orderDate;
	}

	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}
}
