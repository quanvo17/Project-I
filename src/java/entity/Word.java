/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author quan.vd173320
 */
@Entity
@Table(name = "word")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Word.findAll", query = "SELECT w FROM Word w")
    , @NamedQuery(name = "Word.findByWordId", query = "SELECT w FROM Word w WHERE w.wordId = :wordId")
    , @NamedQuery(name = "Word.findByName", query = "SELECT w FROM Word w WHERE w.name = :name")
    , @NamedQuery(name = "Word.findByMean", query = "SELECT w FROM Word w WHERE w.mean = :mean")})
public class Word implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "word_id")
    private Integer wordId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "mean")
    private String mean;
    @JoinColumn(name = "cate_id", referencedColumnName = "cate_id")
    @ManyToOne
    private Category cateId;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne
    private User userId;

    public Word() {
    }

    public Word(Integer wordId) {
        this.wordId = wordId;
    }

    public Word(Integer wordId, String name, String mean) {
        this.wordId = wordId;
        this.name = name;
        this.mean = mean;
    }

    public Integer getWordId() {
        return wordId;
    }

    public void setWordId(Integer wordId) {
        this.wordId = wordId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMean() {
        return mean;
    }

    public void setMean(String mean) {
        this.mean = mean;
    }

    public Category getCateId() {
        return cateId;
    }

    public void setCateId(Category cateId) {
        this.cateId = cateId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wordId != null ? wordId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Word)) {
            return false;
        }
        Word other = (Word) object;
        if ((this.wordId == null && other.wordId != null) || (this.wordId != null && !this.wordId.equals(other.wordId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Word[ wordId=" + wordId + " ]";
    }
    
}
