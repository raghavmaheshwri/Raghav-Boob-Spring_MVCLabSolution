<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Student Registration</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
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

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous"
    />
  </head>

  <body>
    <header>
      <div class="heading">
        <h1>Debate Event Registration</h1>
      </div>
    </header>
    <main>
      <div class="container">
        <center><h3>Student Registration</h3></center> 
        <hr />

        <!-- Add a search form -->

        <form action="/Student_Registration/students/search" class="form-inline" method="post">
          <a class="btn btn-success mb-2 mr-3" href="/Student_Registration/students/showAddStudent">Add new Student</a>

          <label class="sr-only" for="inlineFormInputName2">Name</label>
          <input
            type="text"
            class="form-control mb-2 mr-sm-2"
            id="inlineFormInputName2"
            name="name"
            placeholder="Name"
          />
          <label class="sr-only" for="inlineFormInputName2">Department</label>
          <input
            type="text"
            class="form-control mb-2 mr-sm-2"
            id="inlineFormInputName2"
            name="department"
            placeholder="Department"
          />
          <label class="sr-only" for="inlineFormInputName2">Name</label>
          <input
            type="text"
            class="form-control mb-2 mr-sm-2"
            id="inlineFormInputName2"
            name="country"
            placeholder="Country"
          />

          <button type="submit" class="btn btn-primary mb-2">Search</button>
        </form>

        <table class="table table-bordered table-striped">
          <thead class="thead-dark">
            <tr>
              <th>Student ID</th>
              <th>Name</th>
              <th>Department</th>
              <th>Country</th>
              <th>Action</th>
            </tr>
          </thead>

          <tbody>
            <c:forEach items="${Student}" var="tempStudent">
              <tr>
                <td><c:out value="${tempStudent.id}" /></td>
                <td><c:out value="${tempStudent.name}" /></td>
                <td><c:out value="${tempStudent.department}" /></td>
                <td><c:out value="${tempStudent.country}" /></td>
                <td>
                  <!-- Add "update" button/link -->
                  <a
                    href="showUpdateStudent/?studentId=${tempStudent.id}"
                    class="btn btn-info btn-sm"
                  >
                    Update
                  </a>
                  <!-- Add "delete" button/link -->
                  <a
                    href="delete?studentId=${tempStudent.id}"
                    class="btn btn-danger btn-sm"
                    onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false"
                  >
                    Delete
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
    <footer>
    
    	<center><a class="btn btn-warning btn-sm" href="/Student_Registration">Go To Home Page</a></center>
      <!-- place footer here -->
    </footer>
  </body>
</html>
