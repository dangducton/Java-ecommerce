package com.dangducton.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "nguoidung")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Nguoidung.findAll", query = "SELECT n FROM Nguoidung n")
    , @NamedQuery(name = "Nguoidung.findByIduser", query = "SELECT n FROM Nguoidung n WHERE n.iduser = :iduser")
    , @NamedQuery(name = "Nguoidung.findByTenuser", query = "SELECT n FROM Nguoidung n WHERE n.tenuser = :tenuser")
    , @NamedQuery(name = "Nguoidung.findByTendangnhap", query = "SELECT n FROM Nguoidung n WHERE n.tendangnhap = :tendangnhap")
    , @NamedQuery(name = "Nguoidung.findByMatkhau", query = "SELECT n FROM Nguoidung n WHERE n.matkhau = :matkhau")
    , @NamedQuery(name = "Nguoidung.findByEmail", query = "SELECT n FROM Nguoidung n WHERE n.email = :email")
    , @NamedQuery(name = "Nguoidung.findByDiachi", query = "SELECT n FROM Nguoidung n WHERE n.diachi = :diachi")
    , @NamedQuery(name = "Nguoidung.findByDienthoai", query = "SELECT n FROM Nguoidung n WHERE n.dienthoai = :dienthoai")
    , @NamedQuery(name = "Nguoidung.findByNgaytao", query = "SELECT n FROM Nguoidung n WHERE n.ngaytao = :ngaytao")
    , @NamedQuery(name = "Nguoidung.findByStatus", query = "SELECT n FROM Nguoidung n WHERE n.status = :status")})
public class Nguoidung implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iduser")
    private Integer iduser;
    @Basic(optional = false)
    @Column(name = "tenuser")
    private String tenuser;
    @Basic(optional = false)
    @Column(name = "tendangnhap")
    private String tendangnhap;
    @Basic(optional = false)
    @Column(name = "matkhau")
    private String matkhau;
    @Column(name = "email")
    private String email;
    @Column(name = "diachi")
    private String diachi;
    @Column(name = "dienthoai")
    private String dienthoai;
    @Basic(optional = false)
    @Column(name = "ngaytao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaytao;
    @Basic(optional = false)
    @Column(name = "status")
    private int status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iduser")
    private Collection<Hoadon> hoadonCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idnguoidung")
    private Collection<Chitiethoadon> chitiethoadonCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idnguoidung")
    private Collection<Userrole> userroleCollection;

    public Nguoidung() {
    }

    public Nguoidung(Integer iduser) {
        this.iduser = iduser;
    }

    public Nguoidung(Integer iduser, String tenuser, String tendangnhap, String matkhau, Date ngaytao, int status) {
        this.iduser = iduser;
        this.tenuser = tenuser;
        this.tendangnhap = tendangnhap;
        this.matkhau = matkhau;
        this.ngaytao = ngaytao;
        this.status = status;
    }

    public Integer getIduser() {
        return iduser;
    }

    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }

    public String getTenuser() {
        return tenuser;
    }

    public void setTenuser(String tenuser) {
        this.tenuser = tenuser;
    }

    public String getTendangnhap() {
        return tendangnhap;
    }

    public void setTendangnhap(String tendangnhap) {
        this.tendangnhap = tendangnhap;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
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

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Hoadon> getHoadonCollection() {
        return hoadonCollection;
    }

    public void setHoadonCollection(Collection<Hoadon> hoadonCollection) {
        this.hoadonCollection = hoadonCollection;
    }

    @XmlTransient
    public Collection<Chitiethoadon> getChitiethoadonCollection() {
        return chitiethoadonCollection;
    }

    public void setChitiethoadonCollection(Collection<Chitiethoadon> chitiethoadonCollection) {
        this.chitiethoadonCollection = chitiethoadonCollection;
    }

    @XmlTransient
    public Collection<Userrole> getUserroleCollection() {
        return userroleCollection;
    }

    public void setUserroleCollection(Collection<Userrole> userroleCollection) {
        this.userroleCollection = userroleCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iduser != null ? iduser.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Nguoidung)) {
            return false;
        }
        Nguoidung other = (Nguoidung) object;
        if ((this.iduser == null && other.iduser != null) || (this.iduser != null && !this.iduser.equals(other.iduser))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entityes.Nguoidung[ iduser=" + iduser + " ]";
    }
    
}