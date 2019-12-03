package com.dangducton.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "danhmucsanpham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Danhmucsanpham.findAll", query = "SELECT d FROM Danhmucsanpham d")
    , @NamedQuery(name = "Danhmucsanpham.findByIddanhmuc", query = "SELECT d FROM Danhmucsanpham d WHERE d.iddanhmuc = :iddanhmuc")
    , @NamedQuery(name = "Danhmucsanpham.findByTendanhmuc", query = "SELECT d FROM Danhmucsanpham d WHERE d.tendanhmuc = :tendanhmuc")
    , @NamedQuery(name = "Danhmucsanpham.findByStatus", query = "SELECT d FROM Danhmucsanpham d WHERE d.status = :status")})
public class Danhmucsanpham implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iddanhmuc")
    private Integer iddanhmuc;
    @Column(name = "tendanhmuc")
    private String tendanhmuc;
    @Column(name = "status")
    private Integer status;
    @OneToMany(mappedBy = "iddanhmuc")
    private Collection<Sanpham> sanphamCollection;

    public Danhmucsanpham() {
    }

    public Danhmucsanpham(Integer iddanhmuc) {
        this.iddanhmuc = iddanhmuc;
    }

    public Integer getIddanhmuc() {
        return iddanhmuc;
    }

    public void setIddanhmuc(Integer iddanhmuc) {
        this.iddanhmuc = iddanhmuc;
    }

    public String getTendanhmuc() {
        return tendanhmuc;
    }

    public void setTendanhmuc(String tendanhmuc) {
        this.tendanhmuc = tendanhmuc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Sanpham> getSanphamCollection() {
        return sanphamCollection;
    }

    public void setSanphamCollection(Collection<Sanpham> sanphamCollection) {
        this.sanphamCollection = sanphamCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddanhmuc != null ? iddanhmuc.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Danhmucsanpham)) {
            return false;
        }
        Danhmucsanpham other = (Danhmucsanpham) object;
        if ((this.iddanhmuc == null && other.iddanhmuc != null) || (this.iddanhmuc != null && !this.iddanhmuc.equals(other.iddanhmuc))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Danhmucsanpham[ iddanhmuc=" + iddanhmuc + " ]";
    }
    
}
