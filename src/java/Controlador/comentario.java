/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Comentario;
import Modelo.HibernateUtil;
import Modelo.Jugador;
import Modelo.Notificacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Andres
 */
public class comentario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getRequestURI();
        String params[]=url.split("/");
        if(params.length>=3){
            switch(params[3]){
                case "crearComentario":
                    crearComentario(request, response);
                    break;
                case "getComentarios":
                    getComentario(request, response);
                    break;
            }
        }
    }
    
    protected void crearComentario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        try{                        
            Jugador objJugador = (Jugador) request.getSession().getAttribute("JugadorIngresado");
            String Contenido = request.getParameter("contenido");
            String Fecha = getHoraActual();
            String Tipo = request.getParameter("tipo");
            String Id = request.getParameter("id");            
            Comentario objComentario = new Comentario();
            objComentario.setContenido(Contenido);
            objComentario.setFecha(new Date());
            objComentario.setTipo(Tipo);
            Jugador objJugadorComentario = new Jugador();
            objJugadorComentario.setIdJugador(objJugador.getIdJugador());            
            objComentario.setJugadorComentario(objJugadorComentario);
            switch(Tipo){
                case "Jugador":
                    objComentario.setJugadorComentado(Integer.parseInt(Id));
                    break;
                case "Cancha":
                    objComentario.setCanchaComentado(Integer.parseInt(Id));
                    break;
                case "Campo":
                    objComentario.setCampoComentado(Integer.parseInt(Id));
                    break;
                case "Equipo":
                    objComentario.setEquipoComentado(Integer.parseInt(Id));
                    break;
            }
            
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            try{
                sesion.beginTransaction();
                sesion.save(objComentario);
                sesion.getTransaction().commit();
                sesion.close();
                response.getWriter().write("1");
            }
            catch(HibernateException ex){
                System.err.println(ex);
                response.getWriter().write("0");
            }            
            
        }catch(NumberFormatException | HibernateException ex){
            System.err.println(ex);
            response.getWriter().write("0");
        }
    }
    
    protected void getComentario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {           
        try{
            Jugador objJugador = (Jugador) request.getSession().getAttribute("JugadorIngresado");
            String Tipo = request.getParameter("tipo");
            String Id = request.getParameter("id");
            
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Comentario WHERE JugadorComentado="+Id+"");
            List<Comentario> listaComentario = query.list();
            request.getSession().setAttribute("ListaComentarios", listaComentario);
            for(Comentario comentario : listaComentario){                
                response.getWriter().write("<li class='list-group-item'>" +
                                                "<div class='timeline-panel'>" +
                                                    "<div class='timeline-heading'>" +
                                                        "<a href='/FutPlayFinal/jugador/verjugador/"+comentario.getJugadorComentario().getIdJugador()+"'><span class='label label-success'>"+comentario.getJugadorComentario().getAlias()+" - "+comentario.getFecha()+"</span></a>" +
                                                    "</div>" +
                                                    "<div class='timeline-body'>" +
                                                        "<p>"+comentario.getContenido()+"</p>" +
                                                    "</div>" +
                                                "</div>" +
                                            "</li>");                                                
            }                        
        
        }catch(NumberFormatException | HibernateException ex){
            System.err.println(ex);
            response.getWriter().write("0");
        }
        
    }    
    
    private String getHoraActual(){
    
        int hora, minutos, estado; 
        String horaFinal="",minutosFinal="";
        java.util.Calendar calendario = new GregorianCalendar();
        hora = calendario.get(java.util.Calendar.HOUR);
        minutos = calendario.get(java.util.Calendar.MINUTE);
        estado = calendario.get(java.util.Calendar.AM_PM);

        if (hora < 10) {
            System.out.println("condicion hora");
            horaFinal = "0"+String.valueOf(hora);
        }else{
            horaFinal = String.valueOf(hora);
        }
        if (minutos < 10) {
            minutosFinal = "0"+String.valueOf(minutos);
        }else{
            minutosFinal = String.valueOf(minutos);
        }
        System.out.println(horaFinal);
        String HoraActual = horaFinal+":"+minutosFinal+" "+String.valueOf(estado);
        return HoraActual;
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
