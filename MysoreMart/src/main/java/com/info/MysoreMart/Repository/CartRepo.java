package com.info.MysoreMart.Repository;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import com.info.MysoreMart.Model.CartDetails;
import org.hibernate.query.Query;

@Repository
public class CartRepo {

    // This will create a new SessionFactory each time. Consider creating it as a singleton.
    private SessionFactory sessionFactory;

    public CartRepo() {
        // Configure and build the SessionFactory once
        this.sessionFactory = new Configuration().configure().addAnnotatedClass(CartDetails.class).buildSessionFactory();
    }

    public void addCartItem(CartDetails cartDetails) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction(); // Start a transaction

            session.save(cartDetails); // Save the cart details

            transaction.commit(); // Commit the transaction
            System.out.println("Record added successfully");
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback in case of error
            }
            e.printStackTrace(); // Log the error for debugging
        }
    }

	public List<CartDetails> getAllCartItems() {
		
		Transaction transaction = null;
        List<CartDetails> cartItems = null; // Declare a variable to hold the result
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction(); // Start a transaction

            // Create a query to fetch all CartDetails
            Query<CartDetails> query = session.createQuery("FROM CartDetails", CartDetails.class);
            cartItems = query.getResultList(); // Execute the query and get the results
            transaction.commit(); // Commit the transaction
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback in case of error
            }
            e.printStackTrace(); // Log the error for debugging
        }
        return cartItems; // Return the list of cart items
    }

	
		//delete item by name
	public boolean deleteCartItemByName(String productName) {
	    Transaction transaction = null;
	    boolean isDeleted = false;

	    try (Session session = sessionFactory.openSession()) {
	        transaction = session.beginTransaction();

	        // Logging to see the SQL and product name
	        System.out.println("Attempting to delete product: '" + productName + "'");
	        
	        // Create a query to delete the CartDetails by productName
	        Query<CartDetails> query = session.createQuery("DELETE FROM CartDetails WHERE productName = :productName");
	        query.setParameter("productName", productName.trim()); // Ensure no leading/trailing spaces

	        // Log the query parameters
	        System.out.println("Executing delete with productName: " + productName.trim());

	        int result = query.executeUpdate();
	        System.out.println("Number of items deleted: " + result);

	        if (result > 0) {
	            isDeleted = true; // Mark as deleted if the result is greater than 0
	            System.out.println("Item deleted successfully.");
	        } else {
	            System.out.println("No item found with product name: " + productName.trim());
	        }

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    }

	    return isDeleted; // Return the deletion status
	}
	}
	

