/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.Word;
import entity.Category;
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
public class WordFacade extends AbstractFacade<Word> {

    @PersistenceContext(unitName = "projectIPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WordFacade() {
        super(Word.class);
    }
    
    public void insertWord(String word, String mean, int cateId, int userId){
        em.createNativeQuery("insert into Word(name, mean, cate_id, user_id) values (?, ?, ?, ?)")
                .setParameter(1, word)
                .setParameter(2,mean)
                .setParameter(3, cateId)
                .setParameter(4, userId)
                .executeUpdate();
    }
    
    public void updateWord(String newword, int wordId){
        em.createNativeQuery("update Word set name = ? where word_id = ?")
                .setParameter(1, newword)
                .setParameter(2,wordId)
                .executeUpdate();
        em.createQuery("update Word set name = :name where wordId = :wordid")
                .setParameter("name", newword)
                .setParameter("wordid",wordId)
                .executeUpdate();
    }
    
    public void updateMean(String mean, int wordId){
        em.createNativeQuery("update Word set mean = ? where word_id = ?")
                .setParameter(1, mean)
                .setParameter(2, wordId)
                .executeUpdate();
        em.createQuery("update Word set mean = :mean where wordId = :wordid")
                .setParameter("mean", mean)
                .setParameter("wordid",wordId)
                .executeUpdate();
    }
    
    public void updateCategory(String cateId, int wordId){
        em.createNativeQuery("update Word set cate_Id = ? where word_Id = ?")
                .setParameter(1, cateId)
                .setParameter(2, wordId)
                .executeUpdate();
        em.createQuery("update Word set cate_Id = :cate_Id where wordId = :word_Id")
                .setParameter("cateId", cateId)
                .setParameter("wordId",wordId)
                .executeUpdate();
    }
    
    public void deleteWord(int wordId){
        em.createNativeQuery("delete from Word where word_id = ?")
                .setParameter(1, wordId)
                .executeUpdate();
        em.createQuery("delete from Word c where c.wordId = :word_Id")
                .setParameter("word_Id", wordId)
                .executeUpdate(); 
    }
    public List<Word> findWord(String name){
        return em.createQuery("select Word c where c.name = :name")
                .setParameter("name", name)
                .getResultList();
    }
    public List<Word> findByCateid(int cateid){
        return (List<Word>) em.createQuery("select c from Word c where c.cate_Id = :cate_id")
                .setParameter("cate_id", cateid)
                .getResultList();
    }
    
    public List<Word> findByCate(Category ctg){
        return (List<Word>) em.createQuery("select c from Word c where c.cateId = :cate")
                .setParameter("cate", ctg)
                .getResultList();
    }
    
}
