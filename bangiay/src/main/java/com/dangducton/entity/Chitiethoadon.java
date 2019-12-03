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
@Table(name = "chitiethoadon")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Chitiethoadon.findAll", query = "SELECT c FROM Chitiethoadon c")
    , @NamedQuery(name = "Chitiethoadon.findByIdchitiethoadon", query = "SELECT c FROM Chitiethoadon c WHERE c.idchitiethoadon = :idchitiethoadon")
    , @NamedQuery(name = "Chitiethoadon.findBySoluong", query = "SELECT c FROM Chitiethoadon c WHERE c.soluong = :soluong")
    , @NamedQuery(name = "Chitiethoadon.findByGiatien", query = "SELECT c FROM Chitiethoadon c WHERE c.giatien = :giatien")
    , @NamedQuery(name = "Chitiethoadon.findBySotien", query = "SELECT c FROM Chitiethoadon c WHERE c.sotien = :sotien")
    , @NamedQuery(name = "Chitiethoadon.findByStatus", query = "SELECT c FROM Chitiethoadon c WHERE c.status = :status")})
public class Chitiethoadon implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idchitiethoadon")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idchitiethoadon;
    @Column(name = "soluong")
    private Integer soluong;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "giatien")
    private Double giatien;
    @Column(name = "sotien")
    private Double sotien;
    @Basic(optional = false)
    @Column(name = "status")
    private int status;
    @JoinColumn(name = "idhoadon", referencedColumnName = "idhoadon")
    @ManyToOne()
    private Hoadon idhoadon;
    @JoinColumn(name = "idnguoidung", referencedColumnName = "iduser")
    @ManyToOne(optional = false)
    private Nguoidung idnguoidung;
    @JoinColumn(name = "idsanpham", referencedColumnName = "idsanpham")
    @ManyToOne(optional = false)
    private Sanpham idsanpham;
    @JoinColumn(name = "idsizesanpham", referencedColumnName = "idsizesanpham")
    @ManyToOne(optional = false)
    private Sizesanpham idsizesanpham;

    public Chitiethoadon() {
    }

    public Chitiethoadon(Integer idchitiethoadon) {
        this.idchitiethoadon = idchitiethoadon;
    }

    public Chitiethoadon(Integer idchitiethoadon, int status) {
        this.idchitiethoadon = idchitiethoadon;
        this.status = status;
    }

    public Integer getIdchitiethoadon() {
        return idchitiethoadon;
    }

    public void setIdchitiethoadon(Integer idchitiethoadon) {
        this.idchitiethoadon = idchitiethoadon;
    }

    public Integer getSoluong() {
        return soluong;
    }

    public void setSoluong(Integer soluong) {
        this.soluong = soluong;
    }

    public Double getGiatien() {
        return giatien;
    }

    public void setGiatien(Double giatien) {
        this.giatien = giatien;
    }

    public Double getSotien() {
        return sotien;
    }

    public void setSotien(Double sotien) {
        this.sotien = sotien;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Hoadon getIdhoadon() {
        return idhoadon;
    }

    public void setIdhoadon(Hoadon idhoadon) {
        this.idhoadon = idhoadon;
    }

    public Nguoidung getIdnguoidung() {
        return idnguoidung;
    }

    public void setIdnguoidung(Nguoidung idnguoidung) {
        this.idnguoidung = idnguoidung;
    }

    public Sanpham getIdsanpham() {
        return idsanpham;
    }

    public void setIdsanpham(Sanpham idsanpham) {
        this.idsanpham = idsanpham;
    }

    public Sizesanpham getIdsizesanpham() {
        return idsizesanpham;
    }

    public void setIdsizesanpham(Sizesanpham idsizesanpham) {
        this.idsizesanpham = idsizesanpham;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idchitiethoadon != null ? idchitiethoadon.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Chitiethoadon)) {
            return false;
        }
        Chitiethoadon other = (Chitiethoadon) object;
        if ((this.idchitiethoadon == null && other.idchitiethoadon != null) || (this.idchitiethoadon != null && !this.idchitiethoadon.equals(other.idchitiethoadon))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entityes.Chitiethoadon[ idchitiethoadon=" + idchitiethoadon + " ]";
    }
    
}
