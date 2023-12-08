/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import Service.FriendListService;
import Service.MyProfileService;
import Service.SearchService;
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
import javax.servlet.http.Part;

/**
 *
 * @author acer
 */
@WebServlet(name = "MyProfileController", urlPatterns = {"/myprofile"})
@MultipartConfig()
public class MyProfileController extends HttpServlet {

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
            out.println("<title>Servlet MyProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyProfileController at " + request.getContextPath() + "</h1>");
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
        //String myAccount = user_name tài khoản đang đăng nhập lấy từ session
        String myAccount = (String) request.getSession().getAttribute("User");
        User user = new MyProfileService().getMyProfileByUserName(request.getParameter("people_name")); //thay "quan" = request.getParameter("people_name")
        SearchService searchService = new SearchService();
        FriendListService friendListService = new FriendListService();
        
        request.setAttribute("myAccount", myAccount);
        request.setAttribute("user", user);
        if (!user.getUsername().equals(myAccount)) {
            request.setAttribute("isFriend", searchService.isFriend(myAccount, user.getUsername()));
            request.setAttribute("listFriend", friendListService.getFriendList(user.getUsername()));
        }else{
            request.setAttribute("isFriend", false);
            request.setAttribute("listFriend", friendListService.getFriendList(myAccount));
        }
        
        request.getRequestDispatcher("views/MyProfile/myprofile.jsp").forward(request, response);
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
        String myAccount = (String) request.getSession().getAttribute("User");
        MyProfileService myProfileService = new MyProfileService();

        if (request.getPart("cusCover") != null) {
            Part coverPart = request.getPart("cusCover");
            String folderUpload = "/files";
            String pathUploadFolder = request.getServletContext().getRealPath(folderUpload);
            String fileName = Paths.get(coverPart.getSubmittedFileName()).getFileName().toString();
            // check pathUploadFolder tồn tại hay chưa.
            if (!Files.exists(Paths.get(pathUploadFolder))) {
                Files.createDirectories(Paths.get(pathUploadFolder));
            }
            String urlCover = pathUploadFolder + "/" + fileName;
            coverPart.write(urlCover);

            // build model customer
            String coverInsert = folderUpload + "/" + fileName;

            myProfileService.updateMyProfile(myAccount, myProfileService.getMyProfileByUserName(myAccount).getAvatar(), coverInsert);
        }

        if (request.getPart("cusAvatar") != null) {
            Part avatarPart = request.getPart("cusAvatar");
            String folderUpload = "/files";
            String pathUploadFolder = request.getServletContext().getRealPath(folderUpload);
            String fileName = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
            // check pathUploadFolder tồn tại hay chưa.
            if (!Files.exists(Paths.get(pathUploadFolder))) {
                Files.createDirectories(Paths.get(pathUploadFolder));
            }
            String urlAvatar = pathUploadFolder + "/" + fileName;
            avatarPart.write(urlAvatar);

            // build model customer
            String avatarInsert = folderUpload + "/" + fileName;

            myProfileService.updateMyProfile(myAccount, avatarInsert, myProfileService.getMyProfileByUserName(myAccount).getBackground());
        }

        if (request.getParameter("content") != null || request.getPart("cusAvatar") != null) {

            //COPY CODE TỪ PostController vào đây
        }

        response.sendRedirect("./myprofile?people_name="+myAccount);
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
