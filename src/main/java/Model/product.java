package Model;

import java.io.File;
import java.io.Serializable;

import javax.servlet.http.Part;

import Controller.Utils.StringUtils;

public class product implements Serializable{
	private int productId;
    private String productName;
    private double price;
    private int quantity;
    private String productImage;
    private String productDescription;
    
    public product(int productId, String productName, double price, int quantity, String productDescription, Part productImage) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.productDescription = productDescription;
        this.productImage = getImageUrl(productImage);
    }
    
    public product(String productName, double price, int quantity, String description, String productImage) {

        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.productDescription = description;
        this.productImage = productImage;
    }
    
    
    public product(int productId, String productName, double price, int stockQuantity) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.quantity = stockQuantity;
	}
	
    public product() {
    	
    }
    
    
    public int getProductId()
    {
        return productId;
    }
    public void setProductId(int productId)
    {
        this.productId = productId;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
	private String getImageUrl(Part part) {
		String savePath = StringUtils.PRODUCT_IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart = "download.jpg";
		}
		return imageUrlFromPart;
}
}
