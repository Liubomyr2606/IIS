<%
    session.removeAttribute("name");
    session.removeAttribute("surname");
    session.removeAttribute("id");

    request.getRequestDispatcher("/view/index.jsp").forward(request, response);
%>