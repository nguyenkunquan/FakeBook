/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import Service.MyProfileService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "UpdateMyProfileController", urlPatterns = {"/updatemyprofile"})
public class UpdateMyProfileController extends HttpServlet {

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
            out.println("<title>Servlet UpdateMyProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateMyProfileController at " + request.getContextPath() + "</h1>");
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
        User user = new MyProfileService().getMyProfileByUserName((String) request.getSession().getAttribute("User"));
        //User user = new MyProfileService().getMyProfileByUserName("quan"); //for testing
        MyProfileService myProfileService = new MyProfileService();

        String newGender = request.getParameter("newGender");
        String newPhone = request.getParameter("newPhone");
        String newEmail = request.getParameter("newEmail");

        if (newGender != null) {
            myProfileService.updateMyProfile(user.getUsername(), newGender, user.getBirthday(), user.getPhone(), user.getEmail());
        }
        try {
            String newDay = request.getParameter("newDay");
            String newMonth = request.getParameter("newMonth");
            String newYear = request.getParameter("newYear");
            String newBirthday = newYear + "-" + newMonth + "-" + newDay;
            System.out.println(newBirthday);
            Date dateOfBirth = Date.valueOf(newBirthday);
            myProfileService.updateMyProfile(user.getUsername(), user.getGender(), dateOfBirth, user.getPhone(), user.getEmail());
        } catch (Exception e) {
           
        }
        if (newPhone != null) {
            myProfileService.updateMyProfile(user.getUsername(), user.getGender(), user.getBirthday(), newPhone, user.getEmail());
        }
        if (newEmail != null) {
            myProfileService.updateMyProfile(user.getUsername(), user.getGender(), user.getBirthday(), user.getPhone(), newEmail);
        }
        response.sendRedirect("./myprofile?people_name="+user.getUsername());
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
