/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Equipo;
import Modelo.HibernateUtil;
import Modelo.Jugador;
import Modelo.Notificacion;
import Modelo.Persona;
import Modelo.Propietario;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
public class notificacion extends HttpServlet {

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
        
        String url [] = request.getRequestURI().split("/");
        if (url.length >= 3) {
            switch (url[3]){
            
                case "notificacionregistro":
                        NotificacinRegistro(request, response);
                    break;
                    
                case "cargarnotificaciones":
                        
                        CargarNotificaciones(request, response);
                    
                    break;
                
                case "vernotificaciones":
                        VerNotificaciones(request, response);
                    break;
                    
                case "vistonotificacion":
                        vistoNotificacion(request, response);
                    break;
                case "cargarnotificacionespropietario":
                        CargarNotificacionesPropietario(request, response);
                    break;
                case "vernotificacionespropietario":
                        VerNotificacionesPropietario(request, response);
                    break;
                case "vistonotificacionpropietario":
                        VistoNotificacionesPropietario(request, response);
                    break;
                    
                        
            }
        }
        
        
    }
    protected void NotificacinRegistro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            System.out.println("NOTIFICACION -----------------------------> Notificacion Registro");
            Persona objPersona = (Persona) request.getSession().getAttribute("UsuarioRegistrado");
            
            try{
                Session sesion = HibernateUtil.getSessionFactory().openSession();
                Query query = sesion.createQuery("FROM Jugador WHERE Persona = "+objPersona.getIdPersona()+"");
                List<Jugador> ListaJugador = query.list();
                for(Jugador jugador : ListaJugador){
                    
                    /////// ESTA CONVERCION NO ESTA PROVADA!! //////
                    String equipo = String.valueOf(jugador.getEquipo());
                    int eq = Integer.parseInt(equipo);
                    //Notificacion objNotificacion = new Notificacion(new Date(), "11:11 p.m", "Registro", "", jugador, jugador.getEquipo());
                    String horaActual = new Notificacion().getHoraActual();
                    Notificacion objNotificacion = new Notificacion(new Date(), horaActual, "Registro", "", 0, jugador.getIdJugador(), 0, 0, "", 0, 0);
                    sesion.beginTransaction();
                    sesion.save(objNotificacion);
                    sesion.getTransaction().commit();
                    
                    
                }
                
                sesion.close();
                
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/plain");
                response.getWriter().write("1");
                
            }catch(HibernateException ex){
            
                System.err.println(ex);
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/plain");
                response.getWriter().write("0");
            }
        
        }catch(Exception ex){
        
            System.err.println(ex);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/plain");
            response.getWriter().write("0");
        }
    
    }
    protected void CargarNotificaciones(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{

            int numeroVisto = 0, noVistos = 0;
            Jugador objJugador = (Jugador) request.getSession().getAttribute("JugadorIngresado");

            try{

                Session sesion = HibernateUtil.getSessionFactory().openSession();
                
                Query primeraNotificacion = sesion.createQuery("FROM Notificacion WHERE Tipo='Registro' AND JugadorRecibe="+objJugador.getIdJugador()+"");
                List<Notificacion>listaPrimeraNotificacion = primeraNotificacion.list();
                for (Notificacion notificacionn : listaPrimeraNotificacion) {
                  
                    Query query = sesion.createQuery("FROM Notificacion WHERE idNotificacion >= "+notificacionn.getIdNotificacion()+" AND EquipoRecibe ="+objJugador.getEquipo()+" OR JugadorRecibe = "+objJugador.getIdJugador()+"");
                    List<Notificacion> ListaNotificacion = query.list();

                    System.out.println("NUMERO DE NOTIFICACIONES RECIBIDAS -------> "+ListaNotificacion.size());

                    response.setCharacterEncoding("UTF-8");
                    response.setContentType("text/plain");
                    for(Notificacion notificacion : ListaNotificacion){
                        //System.out.println("CARGANDO LAS NOTIFICACIONES ------>     "+notificacion.getTipo());
                        String visto [] = notificacion.getVisto().split("/");
                        for (int i = 0; i < visto.length; i++) {

                            if (visto[i].equals(String.valueOf(objJugador.getIdJugador()))) {

                                numeroVisto++;

                            }
                        }
                    }
                    /////////// REDUNDANCIA ENCONTRADA, ARREGLAR ///////////////
                    noVistos = ListaNotificacion.size() - numeroVisto;
                    if (noVistos != 0) {

                        response.getWriter().write("<span class='notification'>"+noVistos+"</span>");

                    }
                    
                    
                }
                
                
                //sesion.close();

            }catch(HibernateException ex){

                System.out.println(ex);

            }
            
        }catch(Exception ex){
        
            System.out.println(ex);
            
        }
    }
    protected void VerNotificaciones(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        try{
            //System.out.println("---------------> VER NOTIFICACIONESssssssssssssssssssssssssssss");
            Jugador objJugador = (Jugador) request.getSession().getAttribute("JugadorIngresado");
            
            try{
                
                Session sesion = HibernateUtil.getSessionFactory().openSession();
                
                Query primeraNotificacion = sesion.createQuery("FROM Notificacion WHERE Tipo='Registro' AND JugadorRecibe="+objJugador.getIdJugador()+"");
                List<Notificacion>listaPrimeraNotificacion = primeraNotificacion.list();
                for (Notificacion notificacionn : listaPrimeraNotificacion) {
                
                    Query query = sesion.createQuery("FROM Notificacion WHERE idNotificacion >= "+notificacionn.getIdNotificacion()+" AND EquipoRecibe ="+objJugador.getEquipo()+" OR JugadorRecibe = "+objJugador.getIdJugador()+" ORDER BY (idNotificacion) DESC");
                    List<Notificacion>ListaNotificacion = query.list();
                    
                    for(Notificacion notificacion : ListaNotificacion){

                        //System.out.println("TIPO DE NOTIFICAICON ------>    "+notificacion.getTipo());


                        //System.out.println("EQUIPO JUGADOR NOTIFICACIONES------------------>" + objJugador.getEquipo());
                        //System.out.println(notificacion.getTipo());
                        String href = "", contenido = "", icono = "", color="", onclick="";

                        Query queryNotificacion = sesion.createQuery("FROM Jugador WHERE idJugador="+notificacion.getJugadorEnvia()+"");
                        List<Jugador>ListaJugador = queryNotificacion.list();
                        if (ListaJugador.size() > 0) {

                            //System.out.println("NOTIFICACION DEL JUGADOR QUE ENVIA --------)");

                            for(Jugador jugador : ListaJugador){
                                switch (notificacion.getTipo()){

                                    case "Registro":

                                            icono = "group";
                                            href="#";
                                            contenido="PAIZOUN te da la bienvenida!";
                                            color="00BCD4";
                                        break;

                                    case "EditarEquipo":

                                            icono = "mode_edit";
                                            href="/FutPlayFinal/material-dashboard/pages/equipo/verEquipo.jsp";
                                            contenido=""+jugador.getAlias()+" ha cambiado la informacion del equipo.";
                                            color="FF9800";
                                        break;

                                    case "AgregarJugador":

                                            icono = "person_add";
                                            href="/FutPlayFinal/material-dashboard/pages/jugador/verJugadores.jsp";
                                            contenido=""+jugador.getAlias()+" quiere que hagas parte de su quipo.";
                                            color="00BCD4";
                                        break;

                                    case "CrearEquipo":

                                            icono = "group_work";
                                            href="/FutPlayFinal/material-dashboard/pages/equipo/verEquipo.jsp";
                                            contenido=""+jugador.getAlias()+" ha creado el equipo.";
                                            color="4CAF50";

                                        break;

                                    case "FicharJugador":
                                            ////// HACER LA QUEY PARA QUE EN EL CONTENIDO SE MUETRE EL JUGADOR QUE ENVIA ///
                                            Query queryJugadorEnvia = sesion.createQuery("FROM Jugador WHERE idJugador="+notificacion.getJugadorEnvia()+"");
                                            List<Jugador>listaJugadorEnvia = queryJugadorEnvia.list();
                                            for(Jugador jugadorr : listaJugadorEnvia){

                                                icono = "person_add";
                                                href="#";
                                                contenido=""+jugadorr.getAlias()+" quiere que hagas parte de su equipo.";
                                                color="00BCD4";
                                                /// EL ORDEN EL LA INFORMACION DEL ID ES: quien lo invita,id del equipo al que va a pertenecer ///
                                                onclick="onclick='agregarJugador(this)' id='"+jugadorr.getAlias()+"/"+jugadorr.getEquipo()+"'";

                                            }

                                        break;

                                    case "JugadorAgregado":
                                            icono = "check_circle";
                                            href = "/FutPlayFinal/material-dashboard/pages/equipo/verEquipo.jsp";
                                            contenido = ""+jugador.getAlias()+" fue agregado al equipo.";
                                            color="4CAF50";
                                        break;

                                }
                                String Hora[] = notificacion.getHora().split(" ");
                                String Zona = "";
                                if (Hora[1].equals("1")) {
                                    Zona = "P.M";
                                }else{
                                    Zona = "A.M";
                                }
                                String fecha [] = notificacion.getFecha().toString().split(" ");

                                response.getWriter().write("<a href='"+href+"' "+onclick+" class='NotificationP'>"
                                                                +"<div class='Notification-iconP'>"
                                                                    +"<i class='material-icons' style='background-color: #"+color+"; font-size: 25px;'>"+icono+"</i>"
                                                                +"</div>"
                                                                +"<div class='Notification-textP' style='margin-left: 80px;'>"
                                                                    +"<p style='padding-top: 10px;'>"
                                                                        +"<strong class='description'>"+contenido+"</strong><br>"
                                                                        +"<small>"+fecha[0]+" "+Hora[0]+" "+Zona+"</small>"    
                                                                    +"</p>"
                                                                +"</div>"
                                                           +"</a>");


                            }

                        }else{

                            Query queryJugador = sesion.createQuery("FROM Jugador WHERE idJugador="+notificacion.getJugadorRecibe()+"");
                            List<Jugador>ListaJugadorr = queryJugador.list();
                            for(Jugador jugador : ListaJugadorr){

                                //System.out.println("JUGADOR QUE RECIBE °°°°°°°°°°°°");

                                switch (notificacion.getTipo()){

                                    case "Registro":

                                            icono = "group";
                                            href="#";
                                            contenido="PAIZOUN te da la bienvenida!";
                                            color="00BCD4";
                                        break;

                                    case "EditarEquipo":

                                            icono = "mode_edit";
                                            href="/FutPlayFinal/material-dashboard/pages/equipo/verEquipo.jsp";
                                            contenido=""+jugador.getAlias()+" ha cambiado la informacion del equipo.";
                                            color="FF9800";
                                        break;

                                    case "AgregarJugador":

                                            icono = "person_add";
                                            href="/FutPlayFinal/material-dashboard/pages/jugador/verJugadores.jsp";
                                            contenido=""+jugador.getAlias()+" quiere que hagas parte de su quipo.";
                                            color="00BCD4";
                                        break;

                                    case "CrearEquipo":

                                            icono = "group_work";
                                            href="/FutPlayFinal/material-dashboard/pages/equipo/verEquipo.jsp";
                                            contenido=""+jugador.getAlias()+" ha creado el equipo.";
                                            color="4CAF50";

                                        break;

                                    case "FicharJugador":
                                            ////// HACER LA QUEY PARA QUE EN EL CONTENIDO SE MUETRE EL JUGADOR QUE ENVIA ///
                                            Query queryJugadorEnvia = sesion.createQuery("FROM Jugador WHERE idJugador="+notificacion.getJugadorEnvia()+"");
                                            List<Jugador>listaJugadorEnvia = queryJugadorEnvia.list();
                                            for(Jugador jugadorr : listaJugadorEnvia){

                                                icono = "person_add";
                                                href="#";
                                                contenido=""+jugadorr.getAlias()+" quiere que hagas parte de su equipo.";
                                                color="00BCD4";
                                                /// EL ORDEN EL LA INFORMACION DEL ID ES: quien lo invita,id del equipo al que va a pertenecer ///
                                                onclick="onclick='agregarJugador(this)' id='"+jugadorr.getAlias()+"/"+jugadorr.getEquipo()+"'";

                                            }

                                        break;

                                    case "JugadorAgregado":
                                            icono = "check_circle";
                                            href = "/FutPlayFinal/material-dashboard/pages/equipo/verEquipo.jsp";
                                            contenido = ""+jugador.getAlias()+" fue agregado al equipo.";
                                            color="4CAF50";
                                        break;

                                }
                                String Hora[] = notificacion.getHora().split(" ");
                                String Zona = "";
                                if (Hora[1].equals("1")) {
                                    Zona = "P.M";
                                }else{
                                    Zona = "A.M";
                                }
                                String fecha [] = notificacion.getFecha().toString().split(" ");

                                response.getWriter().write("<a href='"+href+"' "+onclick+" class='NotificationP'>"
                                                                +"<div class='Notification-iconP'>"
                                                                    +"<i class='material-icons' style='background-color: #"+color+"; font-size: 25px;'>"+icono+"</i>"
                                                                +"</div>"
                                                                +"<div class='Notification-textP' style='margin-left: 80px;'>"
                                                                    +"<p style='padding-top: 10px;'>"
                                                                        +"<strong class='description'>"+contenido+"</strong><br>"
                                                                        +"<small>"+fecha[0]+" "+Hora[0]+" "+Zona+"</small>"    
                                                                    +"</p>"
                                                                +"</div>"
                                                           +"</a>");

                            }
                        }
                        if (notificacion.getTipo().equals("SolicitarEncuentro")) {
                            
                            System.out.println("ARMANDO LA NOTIFICACION CUANDO HAY UN ENCUENTRO ");
                            
                            ////////////// HACEMOS UNA CONSULTA PARA VERIFICAR SI EL EQUIPO TIENE O NO NOTIFICACIONES ////////
                            Query queryEquipoNotificaciones = sesion.createQuery("FROM Equipo WHERE idEquipo="+notificacion.getEquipoEnvia()+"");
                            List<Equipo>listaEquipo = queryEquipoNotificaciones.list();
                            for (Equipo equipo : listaEquipo) {
                                
                                String Hora[] = notificacion.getHora().split(" ");
                                String Zona = "";
                                if (Hora[1].equals("1")) {
                                    Zona = "P.M";
                                }else{
                                    Zona = "A.M";
                                }
                                String fecha [] = notificacion.getFecha().toString().split(" ");
                                String contenidoNot[] = notificacion.getDatosAdicionales().split("/");                                
                                if(contenidoNot.length == 2){
                                    response.getWriter().write("<a href='#' onclick='aceptarEncuentro(this)' id='"+equipo.getNombre()+"/"+notificacion.getEquipoEnvia()+"/"+notificacion.getDatosAdicionales()+"' class='NotificationP'>"
                                                                +"<div class='Notification-iconP'>"
                                                                    +"<i class='material-icons' style='background-color: #FF9800; font-size: 25px;'>flash_on</i>"
                                                                +"</div>"
                                                                +"<div class='Notification-textP' style='margin-left: 80px;'>"
                                                                    +"<p style='padding-top: 10px;'>"
                                                                        +"<strong class='description'>El equipo "+equipo.getNombre()+" quiere participar en un encuentro contra tu equipo.</strong><br>"
                                                                        +"<small>"+fecha[0]+" "+Hora[0]+" "+Zona+"</small>"    
                                                                    +"</p>"
                                                                +"</div>"
                                                           +"</a>");
                                }else {                                    
                                    String fechaEncuentro[] = contenidoNot[2].split("\\|");                                                                        
                                    response.getWriter().write("<a href='#' onclick='aceptarEncuentroEquipoToEquipo(this)' id='"+equipo.getNombre()+"/"+notificacion.getEquipoEnvia()+"/"+notificacion.getDatosAdicionales()+"/"+contenidoNot[2]+"' class='NotificationP'>"
                                                                +"<div class='Notification-iconP'>"
                                                                    +"<i class='material-icons' style='background-color: #FF9800; font-size: 25px;'>flash_on</i>"
                                                                +"</div>"
                                                                +"<div class='Notification-textP' style='margin-left: 80px;'>"
                                                                    +"<p style='padding-top: 10px;'>"
                                                                        +"<strong class='description'>El equipo "+equipo.getNombre()+" quiere participar en un encuentro contra tu equipo el dia "+fechaEncuentro[0]+".</strong><br>"
                                                                        +"<small>"+fecha[0]+" "+Hora[0]+" "+Zona+"</small>"    
                                                                    +"</p>"
                                                                +"</div>"
                                                           +"</a>");
                                }
                                
                                
                                
                                
                                
                            }
                        }else if (notificacion.getTipo().equals("EncuentroConfirmado")) {
                            
                            //System.out.println("MIRANDO LA NOTIFICACION ENCUENTRO CONFIRMADO");
                            
                            Query queryPropietario = sesion.createQuery("FROM Propietario WHERE idPropietario = "+notificacion.getPropietarioEnvia()+"");
                            List<Propietario>listaPropietario = queryPropietario.list();
                            for (Propietario propietario : listaPropietario) {
                                
                                String Hora[] = notificacion.getHora().split(" ");
                                String Zona = "";
                                if (Hora[1].equals("1")) {
                                    Zona = "P.M";
                                }else{
                                    Zona = "A.M";
                                }
                                String fecha [] = notificacion.getFecha().toString().split(" ");
                                String contenidoNot[] = notificacion.getDatosAdicionales().split("/");
                                
                                response.getWriter().write("<a href='#' class='NotificationP'>"
                                                                +"<div class='Notification-iconP'>"
                                                                    +"<i class='material-icons' style='background-color: #FF9800; font-size: 25px;'>flash_on</i>"
                                                                +"</div>"
                                                                +"<div class='Notification-textP' style='margin-left: 80px;'>"
                                                                    +"<p style='padding-top: 10px;'>"
                                                                        +"<strong class='description'>El propietario del campo ha aceptado el encuentro.</strong><br>"
                                                                        +"<small>"+fecha[0]+" "+Hora[0]+" "+Zona+"</small>"    
                                                                    +"</p>"
                                                                +"</div>"
                                                           +"</a>");
                                
                            }
                            
                        }
                    }
                
                }
                
                /////FALTA CERRAR LA SESION ///////
                //sesion.close();
                
            }catch(HibernateException ex){
                System.err.println(ex);
            }
            
        }catch(Exception ex){
        
            System.err.println(ex);
            
        }
    
    }
    protected void vistoNotificacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            System.out.println("NOTIFICACION ---------------------------------> ACTUALIZAR NOTIFICACION");
            Jugador objJugador = (Jugador) request.getSession().getAttribute("JugadorIngresado");
            
            try{
                Session sesion = HibernateUtil.getSessionFactory().openSession();
                Query query = sesion.createQuery("FROM Notificacion WHERE EquipoRecibe="+objJugador.getEquipo()+" OR JugadorRecibe = "+objJugador.getIdJugador()+"");
                List<Notificacion>ListaNotificaion = query.list();
                for(Notificacion notificacion : ListaNotificaion){
                    
                    String personasVisto [] = notificacion.getVisto().split("/");
                    int numero = 0;
                    for (int i = 0; i < personasVisto.length; i++) {
                        
                        if (personasVisto[i].equals(String.valueOf(objJugador.getIdJugador()))) {
                            
                            numero++;
                            
                        }
                    }
                    
                    if (numero == 0) {
                        
                        sesion.beginTransaction();
                        Query actualizarNotificacion = sesion.createSQLQuery("UPDATE Notificacion SET Visto='"+notificacion.getVisto()+"/"+objJugador.getIdJugador()+"' WHERE idNotificacion = "+notificacion.getIdNotificacion()+"");
                        actualizarNotificacion.executeUpdate();
                        sesion.getTransaction().commit();
                    }
                }
                
                sesion.close();
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/plain");
                response.getWriter().write("1");
                
            }catch(HibernateException ex){
            
                System.err.println(ex);
            }
        }catch (Exception ex){
        
            System.err.println(ex);
        }
    }
    ////////////////////////////// METODOS PARA LAS NOTIFICACIONES DE EL PROPIETARIO ///////////////////////////////////
    protected void CargarNotificacionesPropietario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        try{
            
            int numeroVisto = 0, noVistos = 0;

            Propietario objPropietario = (Propietario) request.getSession().getAttribute("PropietarioIngresado");
            
            Session sesion = HibernateUtil.getSessionFactory().openSession();
                

            Query query = sesion.createQuery("FROM Notificacion WHERE PropietarioRecibe = "+objPropietario.getIdPropietario()+"");
            List<Notificacion> ListaNotificacion = query.list();

            for(Notificacion notificacion : ListaNotificacion){
                //System.out.println("CARGANDO LAS NOTIFICACIONES ------>     "+notificacion.getTipo());
                String visto [] = notificacion.getVisto().split("/");
                for (int i = 0; i < visto.length; i++) {

                    if (visto[i].equals(String.valueOf(objPropietario.getIdPropietario()))) {

                        numeroVisto++;

                    }
                }
            }
            /////////// REDUNDANCIA ENCONTRADA, ARREGLAR ///////////////
            noVistos = ListaNotificacion.size() - numeroVisto;
            if (noVistos != 0) {

                response.getWriter().write("<span class='notification'>"+noVistos+"</span>");

            }
            
        }catch(HibernateException ex){
            System.err.println(ex);
        }catch(Exception ex){
            System.err.println(ex);
        }
        
    }
    protected void VerNotificacionesPropietario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            
            System.out.println("VER NOTIFICAIONES DEL PROPIETARIO");
            
            Propietario objPropietario = (Propietario) request.getSession().getAttribute("PropietarioIngresado");
            
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Notificacion WHERE PropietarioRecibe = "+objPropietario.getIdPropietario()+"");
            List<Notificacion> ListaNotificacion = query.list();

            for(Notificacion notificacion : ListaNotificacion){
                
                
                switch (notificacion.getTipo()){
                
                    case "ConfirmarEncuentro":
                        
                        String fecha [] = notificacion.getFecha().toString().split(" ");
                        String contenidoNot[] = notificacion.getDatosAdicionales().split("/");

                        Query queryEquipo1 = sesion.createQuery("FROM Equipo WHERE idEquipo = "+contenidoNot[1]+"");
                        List<Equipo>listaEquipo1 = queryEquipo1.list();
                        Query queryEquipo2 = sesion.createQuery("FROM Equipo WHERE idEquipo = "+contenidoNot[2]+"");
                        List<Equipo>listaEquipo2 = queryEquipo2.list();
                        
                        for(Equipo equipo : listaEquipo1){
                            
                            for(Equipo eq : listaEquipo2){
                                
                                String Hora[] = notificacion.getHora().split(" ");
                                String Zona = "";
                                if (Hora[1].equals("1")) {
                                    Zona = "P.M";
                                }else{
                                    Zona = "A.M";
                                }
                                
                                response.getWriter().write("<a href='/FutPlayFinal/material-dashboard/pages/cancha/administrarCanchas.jsp' id='"+notificacion.getDatosAdicionales()+"' class='NotificationP'>"
                                                                +"<div class='Notification-iconP'>"
                                                                    +"<i class='material-icons' style='background-color: #FF9800; font-size: 25px;'>flash_on</i>"
                                                                +"</div>"
                                                                +"<div class='Notification-textP' style='margin-left: 70px;'>"
                                                                    +"<p style='padding-top: 10px;'>"
                                                                        +"<strong class='description'>Los equipos "+equipo.getNombre()+" y "+eq.getNombre()+" desean progamar un encuentro.</strong><br>"
                                                                        +"<small>"+fecha[0]+" "+Hora[0]+" "+Zona+"</small>"    
                                                                    +"</p>"
                                                                +"</div>"
                                                           +"</a>");
                                                                
                                                            
                            }
                        
                        
                        }
                        
                    break;
                    
                }
                
            }
            
        }catch(HibernateException ex){
            System.err.println(ex);
        }catch(Exception ex){
            System.err.println(ex);
        }
    }
    protected void VistoNotificacionesPropietario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        try{
            
            Propietario objPropietario = (Propietario) request.getSession().getAttribute("PropietarioIngresado");
            
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Notificacion WHERE PropietarioRecibe="+objPropietario.getIdPropietario()+"");
            List<Notificacion>ListaNotificaion = query.list();
            for(Notificacion notificacion : ListaNotificaion){

                String personasVisto [] = notificacion.getVisto().split("/");
                int numero = 0;
                for (int i = 0; i < personasVisto.length; i++) {

                    if (personasVisto[i].equals(String.valueOf(objPropietario.getIdPropietario()))) {

                        numero++;

                    }
                }

                if (numero == 0) {

                    sesion.beginTransaction();
                    Query actualizarNotificacion = sesion.createSQLQuery("UPDATE Notificacion SET Visto='"+notificacion.getVisto()+"/"+objPropietario.getIdPropietario()+"' WHERE idNotificacion = "+notificacion.getIdNotificacion()+"");
                    actualizarNotificacion.executeUpdate();
                    sesion.getTransaction().commit();
                }
            }

            sesion.close();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/plain");
            response.getWriter().write("1");
            
            
        }catch(HibernateException ex){
            System.err.println(ex);
        }catch(Exception ex){
            System.err.println(ex);
        }
        
    }
    ////////////////////funcion listar encuentros pendientes//////////////////////////
    public List<Notificacion> listarEncuentroPendientes(int idProp){
        
        List<Notificacion> listaNotificacion= null;
        
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Notificacion WHERE PropietarioRecibe = "+idProp+"");
            listaNotificacion = query.list();
            
        }
        catch(Exception ex){
            System.err.println(ex);
        }
        
        return listaNotificacion;
    }
    
    public List<Equipo> listEquipo1(int idProp){
        List<Notificacion> listaEquipo1= null;
        List<Equipo>listaEquipo = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Notificacion WHERE PropietarioRecibe = "+idProp+"");
            listaEquipo1 = query.list();
            for (Notificacion equipo : listaEquipo1) {
                String contenidoNot[] = equipo.getDatosAdicionales().split("/");

                Query queryEquipo1 = sesion.createQuery("FROM Equipo WHERE idEquipo = "+contenidoNot[1]+"");
                listaEquipo = queryEquipo1.list();
            }
        }
        catch(Exception ex){
            System.err.println(ex);
        }
        
        return listaEquipo; 
    }
    
    public List<Equipo> listEquipo2(int idProp){
        List<Notificacion> listaEquipo2;
        List<Equipo>listaEquipo = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Notificacion WHERE PropietarioRecibe = "+idProp+"");
            listaEquipo2 = query.list();
            for (Notificacion equipo : listaEquipo2) {
                String contenidoNot[] = equipo.getDatosAdicionales().split("/");

                Query queryEquipo1 = sesion.createQuery("FROM Equipo WHERE idEquipo = "+contenidoNot[2]+"");
                listaEquipo = queryEquipo1.list();
            }
        }
        catch(Exception ex){
            System.err.println(ex);
        }
        
        return listaEquipo; 
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
