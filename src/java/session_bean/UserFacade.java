/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.User;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author quan.vd173320
 */
@Stateless
public class UserFacade extends AbstractFacade<User> {

    @PersistenceContext(unitName = "projectIPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
    public User checkUser(String name){
        return (User)em.createQuery("select c from User c where c.name = '"+name+"'").getSingleResult();
    }
    
    public void insertUser(String name, String password){
        em.createNativeQuery("insert into User(name,password) value (?,?)")
                .setParameter(1, name)
                .setParameter(2,password)
                .executeUpdate();
    }
    
    public void updateName(String newname, int userId){
        em.createNativeQuery("update User set name = ? where userId = ?")
                .setParameter(1, newname)
                .setParameter("userId", userId)
                .executeUpdate();
        em.createQuery("update User c set c.name = :newname where c.userId = :userId")
                .setParameter("newname", newname)
                .setParameter("userId", userId)
                .executeUpdate();
    }
    
}
