package com.dangducton.entity;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "comment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c")
    , @NamedQuery(name = "Comment.findByIdcomment", query = "SELECT c FROM Comment c WHERE c.idcomment = :idcomment")
    , @NamedQuery(name = "Comment.findByHoten", query = "SELECT c FROM Comment c WHERE c.hoten = :hoten")
    , @NamedQuery(name = "Comment.findByEmail", query = "SELECT c FROM Comment c WHERE c.email = :email")
    , @NamedQuery(name = "Comment.findByNgaycomment", query = "SELECT c FROM Comment c WHERE c.ngaycomment = :ngaycomment")
    , @NamedQuery(name = "Comment.findByStatus", query = "SELECT c FROM Comment c WHERE c.status = :status")
    , @NamedQuery(name = "Comment.findByNoidung", query = "SELECT c FROM Comment c WHERE c.noidung = :noidung")})
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idcomment")
    private Integer idcomment;
    @Column(name = "hoten")
    private String hoten;
    @Column(name = "email")
    private String email;
    @Column(name = "ngaycomment")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaycomment;
    @Column(name = "status")
    private Integer status;
    @Column(name = "noidung")
    private String noidung;
    @JoinColumn(name = "idsanpham", referencedColumnName = "idsanpham")
    @ManyToOne
    private Sanpham idsanpham;

    public Comment() {
    }

    public Comment(Integer idcomment) {
        this.idcomment = idcomment;
    }

    public Integer getIdcomment() {
        return idcomment;
    }

    public void setIdcomment(Integer idcomment) {
        this.idcomment = idcomment;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getNgaycomment() {
        return ngaycomment;
    }

    public void setNgaycomment(Date ngaycomment) {
        this.ngaycomment = ngaycomment;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public Sanpham getIdsanpham() {
        return idsanpham;
    }

    public void setIdsanpham(Sanpham idsanpham) {
        this.idsanpham = idsanpham;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcomment != null ? idcomment.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.idcomment == null && other.idcomment != null) || (this.idcomment != null && !this.idcomment.equals(other.idcomment))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Comment[ idcomment=" + idcomment + " ]";
    }
    
}
