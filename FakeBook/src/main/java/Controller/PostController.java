/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PostDAO;
import Model.Comment;
import Model.Post;
import Model.User;
import Service.PostService;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "Post", urlPatterns = {"/post"})
@MultipartConfig()
public class PostController extends HttpServlet {

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
            out.println("<title>Servlet Post</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Post at " + request.getContextPath() + "</h1>");
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
        String postIDStr = (String) request.getParameter("postID");
        int postID = postIDStr != null ? Integer.parseInt(postIDStr) : 0;
        PostService postService = new PostService();
        boolean isExist = postService.isExist(postID);
        System.out.println(isExist);
        if (isExist) {
            String user_name = (String) request.getSession().getAttribute("User");
            boolean isLiked = Boolean.parseBoolean(request.getParameter("isLiked"));
            List<Map<String, Object>> posts = (List<Map<String, Object>>) postService.selectAllPost();
            Map<Comment, User> listComment = postService.selectUserComment(postID);

            for (Map<String, Object> post : posts) {
                int name_post = (int) post.get("id_post");
                if (name_post == postID) {
                    request.setAttribute("post", post);
                    request.setAttribute("id_post", postID);
                    break;
                }

            }
            request.setAttribute("isExist", isExist);
            request.setAttribute("listComment", listComment);
            request.setAttribute("isLiked", isLiked);
            request.setAttribute("user_name", user_name);

        }else{
            request.setAttribute("isExist", isExist);
        }
        
        request.getRequestDispatcher("/views/Home/post.jsp").forward(request, response);
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
        String content = request.getParameter("content");
        String user_name = (String) request.getSession().getAttribute("User");
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
//            String user_name = (String) request.getSession().getAttribute("User");
            Post post = new Post(content, avatarInsert, 0, 0, user_name);

            PostService postService = new PostService();
            int result = postService.insertPost(post);
            if (result > 0) {
                response.sendRedirect("./Home");
                return;
            }
            response.sendRedirect("./post");
        } catch (Exception E) {
            Post post = new Post(content, "", 0, 0, user_name);
            PostService postService = new PostService();
            int result = postService.insertPost(post);
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
