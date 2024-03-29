/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.servlet;

import fr.solutec.bean.Administrateur;
import fr.solutec.bean.Client;
import fr.solutec.bean.Conseiller;
import fr.solutec.dao.ClientDao;
import fr.solutec.dao.ConseillerDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author esic
 */
@WebServlet(name = "EspaceAdmin2Servlet", urlPatterns = {"/espaceadmin2"})
public class EspaceAdmin2Servlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EspaceAdmin2Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EspaceAdmin2Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        
        try{
            request.getRequestDispatcher("WEB-INF/espaceadmin.jsp").forward(request, response);
            
        
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
        }
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
        
        
        /*HttpSession session = request.getSession(true);

        Conseiller c = (Conseiller) session.getAttribute("admin");

        if (c != null) {
            try {
                ConseillerDao.editConseillerPassword(c, request.getParameter("mdp2"));
                request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
            } catch (Exception e) {
                PrintWriter out = response.getWriter();
                out.println(e.getMessage());

            }

        } else {
            request.setAttribute("msg", "Allez voir ailleurs, ce n'est pas un site de l'État.");
            request.getRequestDispatcher("WEB-INF/connexion.jsp").forward(request, response);

        }*/
        
        
                
        HttpSession session = request.getSession(true);
        Administrateur a = (Administrateur) session.getAttribute("administrateur"); 
        if(a!=null){
            try {
                String idd = request.getParameter("idrecup");
                int idI = Integer.parseInt(idd);
                
                Conseiller c = ConseillerDao.getById(idI);
                
                ConseillerDao.editConseillerPassword(c, request.getParameter("mdp2"));
                response.sendRedirect("espaceadmin");
            } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());                
            }
        }
        else{
            request.getRequestDispatcher("index.jsp").forward(request, response);        
         }
        
        
        
        
        
        
        
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
