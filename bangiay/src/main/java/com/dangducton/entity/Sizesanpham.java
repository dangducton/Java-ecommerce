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

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "sizesanpham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sizesanpham.findAll", query = "SELECT s FROM Sizesanpham s")
    , @NamedQuery(name = "Sizesanpham.findByIdsizesanpham", query = "SELECT s FROM Sizesanpham s WHERE s.idsizesanpham = :idsizesanpham")
    , @NamedQuery(name = "Sizesanpham.findByTensize", query = "SELECT s FROM Sizesanpham s WHERE s.tensize = :tensize")
    , @NamedQuery(name = "Sizesanpham.findByStatus", query = "SELECT s FROM Sizesanpham s WHERE s.status = :status")})
public class Sizesanpham implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "idsizesanpham")
    @Basic(optional = false) 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idsizesanpham;
    @Column(name = "tensize")
    private String tensize;
    @Column(name = "status")
    private Integer status;
    @OneToMany(mappedBy = "idsizesanpham")
    private Collection<Chitiethoadon> chitiethoadonCollection;
    @OneToMany(mappedBy = "idsize")
    private Collection<Nhapchitietsanpham> nhapchitietsanphamCollection;

    public Sizesanpham() {
    }

    public Sizesanpham(Integer idsizesanpham) {
        this.idsizesanpham = idsizesanpham;
    }

    public Integer getIdsizesanpham() {
        return idsizesanpham;
    }

    public void setIdsizesanpham(Integer idsizesanpham) {
        this.idsizesanpham = idsizesanpham;
    }

    public String getTensize() {
        return tensize;
    }

    public void setTensize(String tensize) {
        this.tensize = tensize;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Chitiethoadon> getChitiethoadonCollection() {
        return chitiethoadonCollection;
    }

    public void setChitiethoadonCollection(Collection<Chitiethoadon> chitiethoadonCollection) {
        this.chitiethoadonCollection = chitiethoadonCollection;
    }

    @XmlTransient
    public Collection<Nhapchitietsanpham> getNhapchitietsanphamCollection() {
        return nhapchitietsanphamCollection;
    }

    public void setNhapchitietsanphamCollection(Collection<Nhapchitietsanpham> nhapchitietsanphamCollection) {
        this.nhapchitietsanphamCollection = nhapchitietsanphamCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsizesanpham != null ? idsizesanpham.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sizesanpham)) {
            return false;
        }
        Sizesanpham other = (Sizesanpham) object;
        if ((this.idsizesanpham == null && other.idsizesanpham != null) || (this.idsizesanpham != null && !this.idsizesanpham.equals(other.idsizesanpham))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Sizesanpham[ idsizesanpham=" + idsizesanpham + " ]";
    }
    
}