<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Task" %>
<%@ page import="db.DbManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br>

    <button type="button" class="btn btn-dark">+ Добавить задание</button>
    <br><br>

    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Наименование</th>
                <th scope="col">Крайний срок</th>
                <th scope="col">Выполнено</th>
                <th scope="col" width="10%">Детали</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Task> taskArrayList = DbManager.getAlltasks();
                for(Task task : taskArrayList){
            %>
            <tr>
              <td><%=task.getId()%></td>
              <td><%=task.getName()%></td>
              <td><%=task.getDeadlineDate()%></td>
              <td><%=task.getStatus()%></td>
                <td>
                    <a href="${pageContext.request.contextPath}/details?id=<%=task.getId()%>" class="btn btn-dark">Детали</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
