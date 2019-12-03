package com.dangducton.entity;

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
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "nhapchitietsanpham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Nhapchitietsanpham.findAll", query = "SELECT n FROM Nhapchitietsanpham n")
    , @NamedQuery(name = "Nhapchitietsanpham.findByIdnhapchitiet", query = "SELECT n FROM Nhapchitietsanpham n WHERE n.idnhapchitiet = :idnhapchitiet")
    , @NamedQuery(name = "Nhapchitietsanpham.findBySoluong", query = "SELECT n FROM Nhapchitietsanpham n WHERE n.soluong = :soluong")})
public class Nhapchitietsanpham implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idnhapchitiet")
    private Integer idnhapchitiet;
    @Column(name = "soluong")
    private Integer soluong;
    @JoinColumn(name = "idsanpham", referencedColumnName = "idsanpham")
    @ManyToOne
    private Sanpham idsanpham;
    @JoinColumn(name = "idsize", referencedColumnName = "idsizesanpham")
    @ManyToOne
    private Sizesanpham idsize;

    public Nhapchitietsanpham() {
    }

    public Nhapchitietsanpham(Integer idnhapchitiet) {
        this.idnhapchitiet = idnhapchitiet;
    }

    public Integer getIdnhapchitiet() {
        return idnhapchitiet;
    }

    public void setIdnhapchitiet(Integer idnhapchitiet) {
        this.idnhapchitiet = idnhapchitiet;
    }

    public Integer getSoluong() {
        return soluong;
    }

    public void setSoluong(Integer soluong) {
        this.soluong = soluong;
    }

    public Sanpham getIdsanpham() {
        return idsanpham;
    }

    public void setIdsanpham(Sanpham idsanpham) {
        this.idsanpham = idsanpham;
    }

    public Sizesanpham getIdsize() {
        return idsize;
    }

    public void setIdsize(Sizesanpham idsize) {
        this.idsize = idsize;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idnhapchitiet != null ? idnhapchitiet.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Nhapchitietsanpham)) {
            return false;
        }
        Nhapchitietsanpham other = (Nhapchitietsanpham) object;
        if ((this.idnhapchitiet == null && other.idnhapchitiet != null) || (this.idnhapchitiet != null && !this.idnhapchitiet.equals(other.idnhapchitiet))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Nhapchitietsanpham[ idnhapchitiet=" + idnhapchitiet + " ]";
    }
    
}
