<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.model.Entidade" %>
<%@ page import="br.com.senai.projeto.dao.EntidadeDAO" %>
<%@ page import="java.math.BigDecimal" %>

<%
    request.setCharacterEncoding("UTF-8");
    EntidadeDAO dao = new EntidadeDAO();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String idParam = request.getParameter("id");
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        BigDecimal preco = new BigDecimal(request.getParameter("preco"));

        Entidade entidade = new Entidade(nome, categoria, quantidade, preco);

        if (idParam != null && !idParam.trim().isEmpty()) {
            entidade.setId(Integer.parseInt(idParam));
            dao.atualizar(entidade);
        } else {
            dao.cadastrar(entidade);
        }

        response.sendRedirect("index.jsp");
        return;
    }

    Entidade entidadeEdicao = null;
    String idGet = request.getParameter("id");

    if (idGet != null && !idGet.trim().isEmpty()) {
        int id = Integer.parseInt(idGet);
        entidadeEdicao = dao.buscarPorId(id);
    }

    boolean isEdicao = (entidadeEdicao != null);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Controle de Estoque - <%= isEdicao ? "Editar" : "Cadastrar" %></title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/estoque.css">
</head>
<body>
<main class="page">
    <p class="brand">Ateliê • acessórios</p>
    <h1><%= isEdicao ? "Atualizar peça" : "Nova peça no estoque" %></h1>
    <p class="subtitle">Preencha os detalhes do acessório para manter seu catálogo atualizado.</p>

    <section class="panel">
        <form action="cadastre.jsp" method="post">
            <% if (isEdicao) { %>
            <input type="hidden" name="id" value="<%= entidadeEdicao.getId() %>">
            <% } %>

            <div class="form-grid">
                <div class="field">
                    <label for="nome">Nome do acessório</label>
                    <input id="nome" type="text" name="nome" value="<%= isEdicao ? entidadeEdicao.getNome() : "" %>" placeholder="Ex.: Colar dourado" required>
                </div>
                <div class="field">
                    <label for="categoria">Categoria</label>
                    <input id="categoria" type="text" name="categoria" value="<%= isEdicao ? entidadeEdicao.getCategoria() : "" %>" placeholder="Ex.: Colares" required>
                </div>
                <div class="field">
                    <label for="quantidade">Quantidade em estoque</label>
                    <input id="quantidade" type="number" name="quantidade" min="0" value="<%= isEdicao ? entidadeEdicao.getQuantidade() : "" %>" placeholder="0" required>
                </div>
                <div class="field">
                    <label for="preco">Preço unitário (R$)</label>
                    <input id="preco" type="number" name="preco" min="0" step="0.01" value="<%= isEdicao ? entidadeEdicao.getPrecoUnitario() : "" %>" placeholder="0,00" required>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit"><%= isEdicao ? "Salvar alterações" : "Cadastrar acessório" %></button>
                <a class="button button-secondary" href="index.jsp">Voltar ao menu</a>
            </div>
        </form>
    </section>
</main>
</body>
</html>