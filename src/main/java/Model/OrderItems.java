/**
 * 
 */
package Model;

/**
 * 
 */
public class OrderItems extends product{
	private int quantity;
	private double lineTotal;
	public OrderItems() 
	{
		
	}
	public OrderItems(int quantity, double lineTotal)
	{
		this.quantity = quantity;
		this.lineTotal = lineTotal;
	}
	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the lineTotal
	 */
	public double getLineTotal() {
		return lineTotal;
	}
	/**
	 * @param lineTotal the lineTotal to set
	 */
	public void setLineTotal(double lineTotal) {
		this.lineTotal = lineTotal;
	}
	
	
}
