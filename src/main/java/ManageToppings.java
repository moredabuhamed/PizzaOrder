import Model.Pizza;
import Model.Topping;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ManageToppings", value = "/ManageToppings")
public class ManageToppings extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Pizza pizza=(Pizza)request.getSession().getAttribute("pizza");
        ArrayList<Topping> toppings=(ArrayList<Topping>)getServletContext().getAttribute("availableToppings");
        // A topping has to be added to the pizza
        if (request.getParameter("add")!=null){
            Topping t=toppings.stream()
                    .filter(topping->topping.getName().equals(request.getParameter("add")))
                    .findFirst().orElse(null);
            if (t!=null){
                pizza.addTopping(t);
                request.setAttribute("message", "Topping added.");
            }
        }
        // A topping has to be removed from the pizza
        if (request.getParameter("remove")!=null){
            Topping t=toppings.stream()
                    .filter(topping->topping.getName().equals(request.getParameter("remove")))
                    .findFirst().orElse(null);
            if (t!=null){
                pizza.removeTopping(t);
                request.setAttribute("message", "Topping removed.");
            }
        }
        // Forward to the ordering page
        request.getRequestDispatcher("PizzaOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
