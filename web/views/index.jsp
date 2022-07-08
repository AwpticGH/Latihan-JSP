<%-- 
    Document   : index
    Created on : Jun 23, 2022, 9:19:55 PM
    Author     : rafih
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.ProductController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/views/layouts/head.jsp">
            <jsp:param name="title" value="Home"/>
        </jsp:include>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <jsp:include page="/views/layouts/navbar.jsp"></jsp:include>
        
        <%
            ProductController pc = new ProductController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = pc.get();
            } else {
                rs = pc.getByName(search);
            }
        %>
        
        <!-- Begin page content -->
        <main class="flex-shrink-0">
          <div class="container">
                <h1 class="mt-5">Hello, <%= request.getSession(true).getAttribute("name") %></h1>
                <p class="lead">Welcome to the inventory app! You are logged in using username: <strong><%= request.getSession().getAttribute("username") %></strong></p>
            <div class="row pt-5">
                <div class="col-6">
                    <form action="Home" method="GET">
                        <div class="mb-3">
                            <label class="form-label">Search</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="search" value="<%= search%>" />
                                <span class="input-group-append">
                                    <button class="input-group-text bg-light d-block">
                                        <i class='bx bxs-search'></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row pt-5">
                <div class="col-12">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Nama Barang</th>
                                <th>Jenis Barang</th>
                                <th>Stok</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (rs.next()) {%>
                                <tr>
                                    <td><%= rs.getString("id")%></td>
                                    <td><%= rs.getString("name")%></td>
                                    <td><%= rs.getString(8)%></td>
                                    <td><%= rs.getString("stock")%></td>
                                    <td>
                                        <form action="Delete?id=<%= rs.getString("id") %>" method="POST"
                                              onsubmit="return confirm('Are you sure want to delete the data?')">
                                            <a href="Edit?id=<%= rs.getString("id") %>" class="btn btn-sm btn-info">Edit</a>
                                            <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <% }%>
                        </tbody>
                    </table>
                    <a href="About">Go to About Page</a>
                </div>
            </div>
          </div>
        </main>
        
        <jsp:include page="/views/layouts/footer.jsp"></jsp:include>
        <jsp:include page="/views/layouts/scripts.jsp"></jsp:include>
    </body>
</html>
