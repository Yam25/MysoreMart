package com.info.MysoreMart.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class CartDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cid;

    @Column(name = "product_name") 
    private String productName;

    @Column(name = "price")
    private double price;

    @Column(name = "quantity")
    private String selectedQuantity;

    @Column(name = "image")
    private String imgUrl;

    // Default constructor
    public CartDetails() {}

    // Constructor with parameters
    public CartDetails(long cid, String productName, double price, String selectedQuantity, String imgUrl) {
        this.cid = cid;
        this.productName = productName;
        this.price = price;
        this.selectedQuantity = selectedQuantity;
        this.imgUrl = imgUrl;
    }

    
    public long getId() {
        return cid;
    }

    public void setId(long cid) {
        this.cid = cid;
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

    public String getSelectedQuantity() {
        return selectedQuantity;
    }

    public void setSelectedQuantity(String selectedQuantity) {
        this.selectedQuantity = selectedQuantity;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
    
    @Override
    public String toString() {
        return "CartDetails{" +
                "id=" + cid +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                ", selectedQuantity='" + selectedQuantity + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                '}';
    }
}
