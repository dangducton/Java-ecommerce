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
@Table(name = "mausanpham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mausanpham.findAll", query = "SELECT m FROM Mausanpham m")
    , @NamedQuery(name = "Mausanpham.findByIdmausanpham", query = "SELECT m FROM Mausanpham m WHERE m.idmausanpham = :idmausanpham")
    , @NamedQuery(name = "Mausanpham.findByTenmau", query = "SELECT m FROM Mausanpham m WHERE m.tenmau = :tenmau")
    , @NamedQuery(name = "Mausanpham.findByStatus", query = "SELECT m FROM Mausanpham m WHERE m.status = :status")})
public class Mausanpham implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idmausanpham")
    private Integer idmausanpham;
    @Basic(optional = false)
    @Column(name = "tenmau")
    private String tenmau;
    @Column(name = "status")
    private Integer status;
    @OneToMany(mappedBy = "idmausanpham")
    private Collection<Sanpham> sanphamCollection;

    public Mausanpham() {
    }

    public Mausanpham(Integer idmausanpham) {
        this.idmausanpham = idmausanpham;
    }

    public Mausanpham(Integer idmausanpham, String tenmau) {
        this.idmausanpham = idmausanpham;
        this.tenmau = tenmau;
    }

    public Integer getIdmausanpham() {
        return idmausanpham;
    }

    public void setIdmausanpham(Integer idmausanpham) {
        this.idmausanpham = idmausanpham;
    }

    public String getTenmau() {
        return tenmau;
    }

    public void setTenmau(String tenmau) {
        this.tenmau = tenmau;
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
        hash += (idmausanpham != null ? idmausanpham.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mausanpham)) {
            return false;
        }
        Mausanpham other = (Mausanpham) object;
        if ((this.idmausanpham == null && other.idmausanpham != null) || (this.idmausanpham != null && !this.idmausanpham.equals(other.idmausanpham))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "aaa.Mausanpham[ idmausanpham=" + idmausanpham + " ]";
    }
    
}
