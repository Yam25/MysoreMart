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
 
    public void addCartItem(CartDetails cartDetails) {
    	    Configuration cfg = new Configuration().configure().addAnnotatedClass(CartDetails.class);
    		SessionFactory sessionFactory = cfg.buildSessionFactory();
    		Transaction transaction = null;
        
        try (Session session = sessionFactory.openSession())  {
        	transaction = session.beginTransaction();
            session.save(cartDetails); 
            transaction.commit(); 
            System.out.println("Item added successfully");
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); 
            }
            e.printStackTrace(); 
        } 
    }
   
	public List<CartDetails> getAllCartItems() {
		 Configuration cfg = new Configuration().configure().addAnnotatedClass(CartDetails.class);
 		SessionFactory sessionFactory = cfg.buildSessionFactory();
 		Transaction transaction = null;
        List<CartDetails> cartItems = null; 
        try(Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Query<CartDetails> query = session.createQuery("FROM CartDetails", CartDetails.class);
            cartItems = query.getResultList(); 
            transaction.commit(); 
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); 
            }
            e.printStackTrace();
        }
        return cartItems; 
    }

	public boolean deleteCartItemById(long id) {
		Configuration cfg = new Configuration().configure().addAnnotatedClass(CartDetails.class);
		SessionFactory sessionFactory = cfg.buildSessionFactory();
		Transaction transaction = null;
	        try (Session session = sessionFactory.openSession()) {
	            transaction = session.beginTransaction();
	            CartDetails cd = session.get(CartDetails.class, id);
	    			if (cd != null) {
	    				session.delete(cd);
	    				transaction.commit();
	    				System.out.println("Item deleted Successfully");
	    				session.close();
	    				return true;
	    			}
	    		} catch (Exception e) {

	    			e.printStackTrace();
	    			return false;
	    		} 
	    		return false;
	}
	}
	

