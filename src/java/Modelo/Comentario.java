/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Andres
 */
@Entity
@Table(name = "Comentario")
public class Comentario {
    @Id
    @Column(name = "idComentario")
    private int idComentario;
    
    @Column(name = "Contenido")
    private String Contenido;
    
    @Column(name = "Fecha")
    private Date Fecha;
    
    @Column(name = "Tipo")
    private String Tipo;
    
    /*@Column(name = "JugadorComentario")
    private int JugadorComentario;*/
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="JugadorComentario")   
    private Jugador JugadorComentario;
    
    @Column(name = "JugadorComentado")
    private int JugadorComentado;
    
    @Column(name = "CanchaComentado")
    private int CanchaComentado;
    
    @Column(name = "EquipoComentado")
    private int EquipoComentado;
    
    @Column(name = "CampoComentado")
    private int CampoComentado;

    public Comentario() {
    }

    public Comentario(int idComentario, String Contenido, Date Fecha, String Tipo, Jugador JugadorComentario, int JugadorComentado, int CanchaComentado, int EquipoComentado, int CampoComentado) {
        this.idComentario = idComentario;
        this.Contenido = Contenido;
        this.Fecha = Fecha;
        this.Tipo = Tipo;
        this.JugadorComentario = JugadorComentario;
        this.JugadorComentado = JugadorComentado;
        this.CanchaComentado = CanchaComentado;
        this.EquipoComentado = EquipoComentado;
        this.CampoComentado = CampoComentado;
    }

    

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getContenido() {
        return Contenido;
    }

    public void setContenido(String Contenido) {
        this.Contenido = Contenido;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public Jugador getJugadorComentario() {
        return JugadorComentario;
    }

    public void setJugadorComentario(Jugador JugadorComentario) {
        this.JugadorComentario = JugadorComentario;
    }    

    public int getJugadorComentado() {
        return JugadorComentado;
    }

    public void setJugadorComentado(int JugadorComentado) {
        this.JugadorComentado = JugadorComentado;
    }

    public int getCanchaComentado() {
        return CanchaComentado;
    }

    public void setCanchaComentado(int CanchaComentado) {
        this.CanchaComentado = CanchaComentado;
    }

    public int getEquipoComentado() {
        return EquipoComentado;
    }

    public void setEquipoComentado(int EquipoComentado) {
        this.EquipoComentado = EquipoComentado;
    }

    public int getCampoComentado() {
        return CampoComentado;
    }

    public void setCampoComentado(int CampoComentado) {
        this.CampoComentado = CampoComentado;
    }            
}
