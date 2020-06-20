/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.Category;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

/**
 *
 * @author quan.vd173320
 */
@Stateless
public class CategoryFacade extends AbstractFacade<Category> {

    @PersistenceContext(unitName = "projectIPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoryFacade() {
        super(Category.class);
    }
    
    public void createCategory(String name, String description){
        em.createNativeQuery("insert into Category (name,description) value (?,?)")
                .setParameter(1, name)
                .setParameter(2, description)
                .executeUpdate();
    }
    
    public void updatName(String name, int cateId){
        em.createNativeQuery("update Category set name = ? where cateId = ?")
                .setParameter(1, name)
                .setParameter(2, cateId)
                .executeUpdate();
        em.createQuery("update Category set name = :name where cateId = :cateId")
                .setParameter("name", name)
                .setParameter("cateId", cateId)
                .executeUpdate();
    }
    
    public void updateDescription(String description, int cateId){
        em.createNativeQuery("update Category set description = ? where cateId = ?")
                .setParameter(1, description)
                .setParameter(2, cateId)
                .executeUpdate();
        em.createQuery("update Category set description = :description where cateId = :cateId")
                .setParameter("description", description)
                .setParameter("cateId", cateId)
                .executeUpdate();
    }
    
}
