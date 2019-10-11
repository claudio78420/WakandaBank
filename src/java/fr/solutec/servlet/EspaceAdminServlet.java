/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.servlet;

import fr.solutec.bean.Administrateur;
import fr.solutec.bean.Client;
import fr.solutec.bean.Conseiller;
import fr.solutec.dao.ConseillerDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.UTF_8;
import java.util.List;
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
@WebServlet(name = "EspaceAdminServlet", urlPatterns = {"/espaceadmin"})
public class EspaceAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet EspaceAdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EspaceAdminServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);

        Administrateur a = (Administrateur) session.getAttribute("administrateur");

        if (a != null) {
            try {
                List<Conseiller> conseillersactives = ConseillerDao.getActiveCons();
                List<Conseiller> conseillersdesactives = ConseillerDao.getDisabledCons();
                request.setAttribute("administrateur", a);
                request.setAttribute("listeconseillersactives", conseillersactives);
                request.setAttribute("listeconseillersdesactives", conseillersdesactives);
                request.getRequestDispatcher("WEB-INF/espaceadmin.jsp").forward(request, response);
            } catch (Exception e) {
            }

        } else {
            request.setAttribute("msg", "Allez voir ailleurs, ce n'est pas un site de l'État.");
            request.getRequestDispatcher("WEB-INF/connexionadmin.jsp").forward(request, response);

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
        
        String nom = request.getParameter("nom");
        byte[] ptext = nom.getBytes(ISO_8859_1);
        String nomValUtf = new String(ptext, UTF_8);
        
        String prenom = request.getParameter("prenom");
        byte[] pptext = prenom.getBytes(ISO_8859_1);
        String prenomValUtf = new String(pptext, UTF_8);
        
        String mail = request.getParameter("mail");
        byte[] ppptext = mail.getBytes(ISO_8859_1);
        String mailValUtf = new String(ppptext, UTF_8);
        
        String mdp = request.getParameter("mdp");
        byte[] pppptext = mdp.getBytes(ISO_8859_1);
        String mdpValUtf = new String(pppptext, UTF_8);
        
        Conseiller co = new Conseiller(nomValUtf, prenomValUtf, mailValUtf, mdpValUtf);
        
        try {
            ConseillerDao.insertConseiller(co);
            response.sendRedirect("espaceadmin");
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());            
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
