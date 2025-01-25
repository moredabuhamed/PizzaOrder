<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Pizza" %>
<%@ page import="Model.Topping" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pizza Order</title>
    <link rel="stylesheet" href="css/PizzaOrder.css">
</head>
<body>
<h1>Please choose your toppings!</h1>

<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<div class="message"><%= message %></div>
<%
    }

    if (request.getParameter("size") != null) {
        int size = Integer.parseInt(request.getParameter("size"));
        Pizza pizza2 = new Pizza(size);
        request.getSession().setAttribute("pizza", pizza2);

        if (getServletContext().getAttribute("availableToppings") == null) {
            ArrayList<Topping> toppings = new ArrayList<>();
            toppings.add(new Topping("Mushrooms", 100));
            toppings.add(new Topping("Tomatoes", 150));
            toppings.add(new Topping("Beans", 150));
            toppings.add(new Topping("Broccoli", 200));
            toppings.add(new Topping("Corn", 100));
            toppings.add(new Topping("Cheddar cheese", 300));
            toppings.add(new Topping("Mozzarella cheese", 200));
            toppings.add(new Topping("Parmesan cheese", 300));
            getServletContext().setAttribute("availableToppings", toppings);
        }
    }

    ArrayList<Topping> toppings = (ArrayList<Topping>) getServletContext().getAttribute("availableToppings");
    Pizza pizza = (Pizza) session.getAttribute("pizza");
%>

<p>Available Toppings:</p>
<table>
    <tr>
        <th>Topping</th>
        <th>Price (HUF)</th>
        <th>Action</th>
    </tr>
    <% for (Topping topping : toppings) { %>
    <tr>
        <td><%= topping.getName() %></td>
        <td><%= topping.getPrice() %></td>
        <td><a href="ManageToppings?add=<%= topping.getName() %>">Add</a></td>
    </tr>
    <% } %>
</table>

<p>Selected Toppings:</p>
<table>
    <tr>
        <th>Topping</th>
        <th>Price (HUF)</th>
        <th>Action</th>
    </tr>
    <% for (Topping topping : pizza.getTopp()) { %>
    <tr>
        <td><%= topping.getName() %></td>
        <td><%= topping.getPrice() %></td>
        <td><a href="ManageToppings?remove=<%= topping.getName() %>">Remove</a></td>
    </tr>
    <% } %>
</table>

<p class="total-price">Total price: <%= pizza.totalPrice() %> HUF</p>

<h2>Finalize your order</h2>
<form action="OrderSummary.jsp" method="post">
    <input type="text" name="name" placeholder="Enter your name" required>
    <input type="text" name="address" placeholder="Enter your address" required>
    <input type="submit" value="Place Order">
</form>
</body>
</html>
