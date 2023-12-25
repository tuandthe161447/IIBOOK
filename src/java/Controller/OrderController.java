/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Customer;
import Model.Order;
import Model.OrderItem;
import Model.User;
import context.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author vuvan
 */
public class OrderController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            OrderDAO od = new OrderDAO();

            if (service == null) {
                service = "List My Orders";
            }
            HttpSession session = request.getSession();
            switch (service) {
                default:
                    User user = (User) session.getAttribute("user");
                    ArrayList<Order> orders = od.getUserOrders(user.getId());
                    request.setAttribute("orders", orders);
                    request.getRequestDispatcher("/views/user/orders.jsp").forward(request, response);
                    break;
                case "details":
                    String oid = request.getParameter("oid");
                    ArrayList<OrderItem> items = od.getItems(oid);
                    Order order = od.getOrderById(oid);
                    Customer customer = od.getCustomerByOrder(Integer.parseInt(oid));
                    request.setAttribute("customer", customer);
                    request.setAttribute("items", items);
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("/views/user/bill_details.jsp").forward(request, response);
            }
        }
    }
       public void dispath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        RequestDispatcher dispath = request.getRequestDispatcher(path);
        dispath.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.forward(request, response);
    }
}


