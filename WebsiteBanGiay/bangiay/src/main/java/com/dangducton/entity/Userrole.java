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
@Table(name = "userrole")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Userrole.findAll", query = "SELECT u FROM Userrole u")
    , @NamedQuery(name = "Userrole.findById", query = "SELECT u FROM Userrole u WHERE u.id = :id")})
public class Userrole implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "idnguoidung", referencedColumnName = "iduser")
    @ManyToOne(optional = false)
    private Nguoidung idnguoidung;
    @JoinColumn(name = "idrode", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Role idrode;

    public Userrole() {
    }

    public Userrole(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Nguoidung getIdnguoidung() {
        return idnguoidung;
    }

    public void setIdnguoidung(Nguoidung idnguoidung) {
        this.idnguoidung = idnguoidung;
    }

    public Role getIdrode() {
        return idrode;
    }

    public void setIdrode(Role idrode) {
        this.idrode = idrode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Userrole)) {
            return false;
        }
        Userrole other = (Userrole) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entityes.Userrole[ id=" + id + " ]";
    }
    
}