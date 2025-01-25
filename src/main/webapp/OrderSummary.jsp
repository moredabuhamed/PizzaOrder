<%@ page import="Model.Pizza" %>
<%@ page import="Model.Topping" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Summary</title>
  <link rel="stylesheet" href="css/OrderSummary.css">
</head>
<body>
<div class="content">
  <h1>Your Order</h1>
  <%
    request.setCharacterEncoding("UTF-8");
    Pizza pizza = (Pizza) session.getAttribute("pizza");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    int toppingCount = pizza.getTopp().size();
  %>
  <table>
    <tr>
      <th colspan="2">Order Details</th>
    </tr>
    <tr>
      <td><strong>Name:</strong></td>
      <td><%= name != null ? name : "N/A" %></td>
    </tr>
    <tr>
      <td><strong>Address:</strong></td>
      <td><%= address != null ? address : "N/A" %></td>
    </tr>
    <tr class="total-price-row">
      <td><strong>Total Price:</strong></td>
      <td><%= pizza.totalPrice() %> HUF</td>
    </tr>
    <tr>
      <th colspan="2">Selected Toppings</th>
    </tr>
    <% if (toppingCount > 0) {
      for (Topping topping : pizza.getTopp()) { %>
    <tr>
      <td><%= topping.getName() %></td>
      <td><%= topping.getPrice() %> HUF</td>
    </tr>
    <% } } else { %>
    <tr>
      <td colspan="2" style="text-align: center;">No toppings selected</td>
    </tr>
    <% } %>
  </table>

  <p class="topping-count">Total Toppings Selected: <%= toppingCount %></p>
  <a href="PizzaOrder.jsp" class="back-button">Back to Order</a>
</div>

<footer>
  Thank you for ordering with us! Contact us at support@pizzaapp.com for any inquiries.
</footer>
</body>
</html>
