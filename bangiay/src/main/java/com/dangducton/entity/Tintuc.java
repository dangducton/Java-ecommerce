package com.dangducton.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "tintuc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tintuc.findAll", query = "SELECT t FROM Tintuc t")
    , @NamedQuery(name = "Tintuc.findByIdtintuc", query = "SELECT t FROM Tintuc t WHERE t.idtintuc = :idtintuc")
    , @NamedQuery(name = "Tintuc.findByMotangan", query = "SELECT t FROM Tintuc t WHERE t.motangan = :motangan")
    , @NamedQuery(name = "Tintuc.findByTentintuc", query = "SELECT t FROM Tintuc t WHERE t.tentintuc = :tentintuc")
    , @NamedQuery(name = "Tintuc.findByNoidung", query = "SELECT t FROM Tintuc t WHERE t.noidung = :noidung")
    , @NamedQuery(name = "Tintuc.findByImage", query = "SELECT t FROM Tintuc t WHERE t.image = :image")
    , @NamedQuery(name = "Tintuc.findByNgaytao", query = "SELECT t FROM Tintuc t WHERE t.ngaytao = :ngaytao")
    , @NamedQuery(name = "Tintuc.findByStatus", query = "SELECT t FROM Tintuc t WHERE t.status = :status")})
public class Tintuc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idtintuc")
    private Integer idtintuc;
    @Column(name = "motangan")
    private String motangan;
    @Column(name = "tentintuc")
    private String tentintuc;
    @Column(name = "noidung")
    private String noidung;
    @Column(name = "image")
    private String image;
    @Column(name = "ngaytao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaytao;
    @Column(name = "status")
    private Integer status;

    public Tintuc() {
    }

    public Tintuc(Integer idtintuc) {
        this.idtintuc = idtintuc;
    }

    public Integer getIdtintuc() {
        return idtintuc;
    }

    public void setIdtintuc(Integer idtintuc) {
        this.idtintuc = idtintuc;
    }

    public String getMotangan() {
        return motangan;
    }

    public void setMotangan(String motangan) {
        this.motangan = motangan;
    }

    public String getTentintuc() {
        return tentintuc;
    }

    public void setTentintuc(String tentintuc) {
        this.tentintuc = tentintuc;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtintuc != null ? idtintuc.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tintuc)) {
            return false;
        }
        Tintuc other = (Tintuc) object;
        if ((this.idtintuc == null && other.idtintuc != null) || (this.idtintuc != null && !this.idtintuc.equals(other.idtintuc))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Tintuc[ idtintuc=" + idtintuc + " ]";
    }
    
}
