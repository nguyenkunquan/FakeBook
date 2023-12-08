/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PostDAO;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author MSI ADMIN
 */
@MultipartConfig
@WebServlet(name = "UpdatePost", urlPatterns = {"/updatepost"})
public class UpdatePost extends HttpServlet {

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
            out.println("<title>Servlet UpdatePost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePost at " + request.getContextPath() + "</h1>");
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
        String pID = request.getParameter("posId");
        int posID = Integer.parseInt(pID);
        String content = request.getParameter("content");
        System.out.println(content);
        System.out.println(posID);
        try {
            Part avatarPart = request.getPart("postAvatar");
            String folderUpload = "/files";
            String pathUploadFolder = request.getServletContext().getRealPath(folderUpload);
            String fileName = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
            // check pathUploadFolder tồn tại hay chưa.
            if (!Files.exists(Paths.get(pathUploadFolder))) {
                Files.createDirectories(Paths.get(pathUploadFolder));
            }
            String urlAvatar = pathUploadFolder + "/" + fileName;
            avatarPart.write(urlAvatar);
            String avatarInsert = folderUpload + "/" + fileName;

            PostDAO postDao = new PostDAO();
            int result = postDao.updateByID(content, avatarInsert, posID);
            if (result > 0) {
                response.sendRedirect("./Home");
                return;
            }
            response.sendRedirect("./post");
        } catch (Exception E) {

            response.sendRedirect("./Home");

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
