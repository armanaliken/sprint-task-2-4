<%@ page import="models.Task" %>
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

        <%
            Task task = (Task) request.getAttribute("OneTask");
        %>
        <form action="/updateItem" method="post">
            <input type="hidden" name="id" value="<%= task.getId() %>">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Наименование:</label>
                <input name="name" type="text" class="form-control" id="exampleFormControlInput1" value="<%=task.getName()%>">
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Описание:</label>
                <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=task.getDescription()%></textarea>
            </div>
            <div class="mb-3">
                <label for="startDate">Крайний срок:</label>
                <input name="deadlineDate" id="startDate" class="form-control" type="date" value="<%=task.getDeadlineDate()%>" />
            </div>

            <div class="mb-3">
                <label for="disabledSelect" class="form-label">Выполнено:</label>
                <select name="status" id="disabledSelect" class="form-select">
                    <option <%= task.getStatus() ? "selected" : "" %> value="true">Да</option>
                    <option <%= !task.getStatus() ? "selected" : "" %> value="false">Нет</option>
                </select>
            </div>
            <div style="display: flex">
                <div>
                    <button type="submit" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Сохранить
                    </button>
                </div>
            </div>
        </form>
        <form action="/deleteItem" method="post">
            <div style="margin-left: 10px">
                <input type="hidden" name="id" value="<%= task.getId() %>">
                <button type="submit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                    Удалить
                </button>
            </div>
        </form>
    </div>
</body>
</html>
