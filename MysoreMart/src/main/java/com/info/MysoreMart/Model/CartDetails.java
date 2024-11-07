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
    private long id;

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
    public CartDetails(long id, String productName, double price, String selectedQuantity, String imgUrl) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.selectedQuantity = selectedQuantity;
        this.imgUrl = imgUrl;
    }

    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                ", selectedQuantity='" + selectedQuantity + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                '}';
    }
}
