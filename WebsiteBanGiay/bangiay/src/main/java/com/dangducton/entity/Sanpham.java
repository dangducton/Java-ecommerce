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
@Table(name = "sanpham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sanpham.findAll", query = "SELECT s FROM Sanpham s")
    , @NamedQuery(name = "Sanpham.findByIdsanpham", query = "SELECT s FROM Sanpham s WHERE s.idsanpham = :idsanpham")
    , @NamedQuery(name = "Sanpham.findByTensanpham", query = "SELECT s FROM Sanpham s WHERE s.tensanpham = :tensanpham")
    , @NamedQuery(name = "Sanpham.findByGiagoc", query = "SELECT s FROM Sanpham s WHERE s.giagoc = :giagoc")
    , @NamedQuery(name = "Sanpham.findByGiaban", query = "SELECT s FROM Sanpham s WHERE s.giaban = :giaban")
    , @NamedQuery(name = "Sanpham.findByGiakhuyenmai", query = "SELECT s FROM Sanpham s WHERE s.giakhuyenmai = :giakhuyenmai")
    , @NamedQuery(name = "Sanpham.findByBaohanh", query = "SELECT s FROM Sanpham s WHERE s.baohanh = :baohanh")
    , @NamedQuery(name = "Sanpham.findByMotangan", query = "SELECT s FROM Sanpham s WHERE s.motangan = :motangan")
    , @NamedQuery(name = "Sanpham.findByMotachitiet", query = "SELECT s FROM Sanpham s WHERE s.motachitiet = :motachitiet")
    , @NamedQuery(name = "Sanpham.findByImage1", query = "SELECT s FROM Sanpham s WHERE s.image1 = :image1")
    , @NamedQuery(name = "Sanpham.findByImage2", query = "SELECT s FROM Sanpham s WHERE s.image2 = :image2")
    , @NamedQuery(name = "Sanpham.findByImage3", query = "SELECT s FROM Sanpham s WHERE s.image3 = :image3")
    , @NamedQuery(name = "Sanpham.findByImage4", query = "SELECT s FROM Sanpham s WHERE s.image4 = :image4")
    , @NamedQuery(name = "Sanpham.findByNgaynhap", query = "SELECT s FROM Sanpham s WHERE s.ngaynhap = :ngaynhap")
    , @NamedQuery(name = "Sanpham.findByStatus", query = "SELECT s FROM Sanpham s WHERE s.status = :status")})
public class Sanpham implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idsanpham")
    private Integer idsanpham;
    @Basic(optional = false)
    @Column(name = "tensanpham")
    private String tensanpham;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "giagoc")
    private Double giagoc;
    @Column(name = "giaban")
    private Double giaban;
    @Column(name = "giakhuyenmai")
    private Double giakhuyenmai;
    @Column(name = "baohanh")
    private String baohanh;
    @Column(name = "motangan")
    private String motangan;
    @Column(name = "motachitiet")
    private String motachitiet;
    @Column(name = "image1")
    private String image1;
    @Column(name = "image2")
    private String image2;
    @Column(name = "image3")
    private String image3;
    @Column(name = "image4")
    private String image4;
    @Column(name = "ngaynhap")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaynhap;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "iddanhmuc", referencedColumnName = "iddanhmuc")
    @ManyToOne
    private Danhmucsanpham iddanhmuc;
    @JoinColumn(name = "idmausanpham", referencedColumnName = "idmausanpham")
    @ManyToOne
    private Mausanpham idmausanpham;
    @OneToMany(mappedBy = "idsanpham")
    private Collection<Chitiethoadon> chitiethoadonCollection;
    @OneToMany(mappedBy = "idsanpham")
    private Collection<Comment> commentCollection;
    @OneToMany(mappedBy = "idsanpham")
    private Collection<Nhapchitietsanpham> nhapchitietsanphamCollection;

    public Sanpham() {
    }

    public Sanpham(Integer idsanpham) {
        this.idsanpham = idsanpham;
    }

    public Sanpham(Integer idsanpham, String tensanpham) {
        this.idsanpham = idsanpham;
        this.tensanpham = tensanpham;
    }

    public Integer getIdsanpham() {
        return idsanpham;
    }

    public void setIdsanpham(Integer idsanpham) {
        this.idsanpham = idsanpham;
    }

    public String getTensanpham() {
        return tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        this.tensanpham = tensanpham;
    }

    public Double getGiagoc() {
        return giagoc;
    }

    public void setGiagoc(Double giagoc) {
        this.giagoc = giagoc;
    }

    public Double getGiaban() {
        return giaban;
    }

    public void setGiaban(Double giaban) {
        this.giaban = giaban;
    }

    public Double getGiakhuyenmai() {
        return giakhuyenmai;
    }

    public void setGiakhuyenmai(Double giakhuyenmai) {
        this.giakhuyenmai = giakhuyenmai;
    }

    public String getBaohanh() {
        return baohanh;
    }

    public void setBaohanh(String baohanh) {
        this.baohanh = baohanh;
    }

    public String getMotangan() {
        return motangan;
    }

    public void setMotangan(String motangan) {
        this.motangan = motangan;
    }

    public String getMotachitiet() {
        return motachitiet;
    }

    public void setMotachitiet(String motachitiet) {
        this.motachitiet = motachitiet;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public Date getNgaynhap() {
        return ngaynhap;
    }

    public void setNgaynhap(Date ngaynhap) {
        this.ngaynhap = ngaynhap;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Danhmucsanpham getIddanhmuc() {
        return iddanhmuc;
    }

    public void setIddanhmuc(Danhmucsanpham iddanhmuc) {
        this.iddanhmuc = iddanhmuc;
    }

    public Mausanpham getIdmausanpham() {
        return idmausanpham;
    }

    public void setIdmausanpham(Mausanpham idmausanpham) {
        this.idmausanpham = idmausanpham;
    }

    @XmlTransient
    public Collection<Chitiethoadon> getChitiethoadonCollection() {
        return chitiethoadonCollection;
    }

    public void setChitiethoadonCollection(Collection<Chitiethoadon> chitiethoadonCollection) {
        this.chitiethoadonCollection = chitiethoadonCollection;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
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
        hash += (idsanpham != null ? idsanpham.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sanpham)) {
            return false;
        }
        Sanpham other = (Sanpham) object;
        if ((this.idsanpham == null && other.idsanpham != null) || (this.idsanpham != null && !this.idsanpham.equals(other.idsanpham))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Sanpham[ idsanpham=" + idsanpham + " ]";
    }
    
}
