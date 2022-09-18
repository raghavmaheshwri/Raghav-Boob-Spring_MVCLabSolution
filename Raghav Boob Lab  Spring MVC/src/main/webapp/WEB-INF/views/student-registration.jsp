<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous"
    />

    <style>
      * {
        margin: 0px;
        padding: 0px;
      }

      .heading {
        padding: 20px;
        background: #00109f;
        color: white;
        text-align: center;
      }

      .mainLink {
        text-align: center;
        margin-top: 30px;
        font-size: 30px;
      }
    </style>

    <title>Add New Student</title>
  </head>

  <body>
    <header>
      <div class="heading">
        <h1>Debate Event Registration</h1>
      </div>
    </header>
    <main>
      <div class="container">

        <p class="h4 mb-4">Add / Update Student</p>

        <form action="/Student_Registration/students/add" method="POST">
          <!-- Add hidden form field to handle update -->
          <input type="hidden" name="id" value="${Student.id}" />

          <div class="form-inline">
            <input
              type="text"
              name="name"
              value="${Student.name}"
              class="form-control mb-4 col-4"
              placeholder="Name"
            />
          </div>

          <div class="form-inline">
            <input
              type="text"
              name="department"
              value="${Student.department}"
              class="form-control mb-4 col-4"
              placeholder="Department"
            />
          </div>

          <div class="form-inline">
            <input
              type="text"
              name="country"
              value="${Student.country}"
              class="form-control mb-4 col-4"
              placeholder="country"
            />
          </div>

          <button type="submit" class="btn btn-info col-2">Save</button>
        </form>

        <hr />
        <a href="/Student_Registration/students/show">Back to Students List</a>
      </div>
    </main>
  </body>
</html>
