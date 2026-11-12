<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.dao.EntidadeDAO" %>
<%@ page import="br.com.senai.projeto.model.Entidade" %>
<%@ page import="java.util.List" %>
<%
    EntidadeDAO dao = new EntidadeDAO();
    String acao = request.getParameter("acao");

    if ("POST".equalsIgnoreCase(request.getMethod())
            && "excluir".equals(request.getParameter("acao"))) {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.excluir(id);
        response.sendRedirect("listagem.jsp?acao=excluir");
        return;
    }

    List<Entidade> entidades = dao.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estoque | Acessórios cadastrados</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/estoque.css">
</head>
<body>
<main class="page">
    <p class="brand">Ateliê • acessórios</p>
    <div class="topbar">
        <div>
            <h1>Seu estoque</h1>
            <p class="subtitle">Acompanhe as peças cadastradas e mantenha tudo em ordem.</p>
        </div>
        <div class="topbar-actions">
            <a class="button button-secondary" href="index.jsp">Menu principal</a>
            <a class="button" href="cadastre.jsp">+ Cadastrar peça</a>
        </div>
    </div>

    <section class="panel">
        <% if ("editar".equals(acao)) { %>
            <p class="hint">Escolha uma peça para atualizar.</p>
        <% } else if ("excluir".equals(acao)) { %>
            <p class="hint">Escolha uma peça para excluir. A ação pedirá confirmação.</p>
        <% } %>
        <% if (entidades.isEmpty()) { %>
            <div class="empty-state">Seu estoque ainda está vazio. Cadastre a primeira peça para começar.</div>
        <% } else { %>
            <div class="table-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Acessório</th>
                        <th>Categoria</th>
                        <th>Quantidade</th>
                        <th>Preço unitário</th>
                        <% if ("editar".equals(acao)) { %>
                            <th>Atualizar</th>
                        <% } else if ("excluir".equals(acao)) { %>
                            <th>Excluir</th>
                        <% } %>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Entidade entidade : entidades) { %>
                    <tr>
                        <td><%= entidade.getId() %></td>
                        <td><%= entidade.getNome() %></td>
                        <td><%= entidade.getCategoria() %></td>
                        <td><%= entidade.getQuantidade() %></td>
                        <td>R$ <%= String.format(java.util.Locale.forLanguageTag("pt-BR"), "%.2f", entidade.getPrecoUnitario()) %></td>
                        <% if ("editar".equals(acao)) { %>
                            <td><a href="cadastre.jsp?id=<%= entidade.getId() %>">Atualizar</a></td>
                        <% } else if ("excluir".equals(acao)) { %>
                            <td>
                                <form action="listagem.jsp" method="post" onsubmit="return confirm('Excluir este acessório do estoque?');">
                                    <input type="hidden" name="acao" value="excluir">
                                    <input type="hidden" name="id" value="<%= entidade.getId() %>">
                                    <button class="danger" type="submit">Excluir</button>
                                </form>
                            </td>
                        <% } %>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </section>
</main>
</body>
</html>
