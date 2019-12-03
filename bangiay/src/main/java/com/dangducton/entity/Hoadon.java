package com.dangducton.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "hoadon")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Hoadon.findAll", query = "SELECT h FROM Hoadon h")
    , @NamedQuery(name = "Hoadon.findByIdhoadon", query = "SELECT h FROM Hoadon h WHERE h.idhoadon = :idhoadon")
    , @NamedQuery(name = "Hoadon.findByDienthoai", query = "SELECT h FROM Hoadon h WHERE h.dienthoai = :dienthoai")
    , @NamedQuery(name = "Hoadon.findByEmail", query = "SELECT h FROM Hoadon h WHERE h.email = :email")
    , @NamedQuery(name = "Hoadon.findByDiachi", query = "SELECT h FROM Hoadon h WHERE h.diachi = :diachi")
    , @NamedQuery(name = "Hoadon.findByTongtien", query = "SELECT h FROM Hoadon h WHERE h.tongtien = :tongtien")
    , @NamedQuery(name = "Hoadon.findByNgaytao", query = "SELECT h FROM Hoadon h WHERE h.ngaytao = :ngaytao")
    , @NamedQuery(name = "Hoadon.findByGhichu", query = "SELECT h FROM Hoadon h WHERE h.ghichu = :ghichu")
    , @NamedQuery(name = "Hoadon.findByStatus", query = "SELECT h FROM Hoadon h WHERE h.status = :status")})
public class Hoadon implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idhoadon")
    private Integer idhoadon;
    @Column(name = "dienthoai")
    private String dienthoai;
    @Column(name = "email")
    private String email;
    @Column(name = "diachi")
    private String diachi;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "tongtien")
    private Double tongtien;
    @Column(name = "ngaytao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaytao;
    @Column(name = "ghichu")
    private String ghichu;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "iduser", referencedColumnName = "iduser")
    @ManyToOne
    private Nguoidung iduser;
    @OneToMany(mappedBy = "idhoadon")
    private Collection<Chitiethoadon> chitiethoadonCollection;

    public Hoadon() {
    }

    public Hoadon(Integer idhoadon) {
        this.idhoadon = idhoadon;
    }

    public Integer getIdhoadon() {
        return idhoadon;
    }

    public void setIdhoadon(Integer idhoadon) {
        this.idhoadon = idhoadon;
    }

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public Double getTongtien() {
        return tongtien;
    }

    public void setTongtien(Double tongtien) {
        this.tongtien = tongtien;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Nguoidung getIduser() {
        return iduser;
    }

    public void setIduser(Nguoidung iduser) {
        this.iduser = iduser;
    }

    @XmlTransient
    public Collection<Chitiethoadon> getChitiethoadonCollection() {
        return chitiethoadonCollection;
    }

    public void setChitiethoadonCollection(Collection<Chitiethoadon> chitiethoadonCollection) {
        this.chitiethoadonCollection = chitiethoadonCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idhoadon != null ? idhoadon.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Hoadon)) {
            return false;
        }
        Hoadon other = (Hoadon) object;
        if ((this.idhoadon == null && other.idhoadon != null) || (this.idhoadon != null && !this.idhoadon.equals(other.idhoadon))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Hoadon[ idhoadon=" + idhoadon + " ]";
    }
    
}
