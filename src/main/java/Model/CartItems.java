package Model;

import java.io.Serializable;

public class CartItems extends product implements Serializable{
		private int quantity;
		private int lineTotal;
		private int cartId;
		public CartItems()
		{
			
		}
		public CartItems(int productId, String productName, double price, int stockQuantity,int quantity, double lineTotal, int cartId) {
			super(productId, productName, price, stockQuantity);
			quantity = this.quantity;
			lineTotal = this.lineTotal;
			cartId = this.cartId;
			
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public int getLineTotal() {
			return lineTotal;
		}
		public void setLineTotal(int lineTotal) {
			this.lineTotal = lineTotal;
		}

	}

