<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.dao.EntidadeDAO" %>
<%
    new EntidadeDAO();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ateliê | Controle de Estoque</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/estoque.css">
</head>
<body>
<main class="page">
    <p class="brand">Ateliê • acessórios</p>
    <h1>Controle de estoque</h1>
    <p class="subtitle">Organize suas peças com cuidado e mantenha cada detalhe em ordem.</p>

    <section class="menu-grid" aria-label="Opções do estoque">
        <a class="menu-card" href="cadastre.jsp">
            <span>
                <span class="menu-icon" aria-hidden="true">✦</span><br>
                <strong>Cadastrar peça</strong>
            </span>
            <span>Adicione um novo acessório ao seu estoque.</span>
        </a>
        <a class="menu-card" href="listagem.jsp">
            <span>
                <span class="menu-icon" aria-hidden="true">◈</span><br>
                <strong>Ver estoque</strong>
            </span>
            <span>Consulte todas as peças cadastradas.</span>
        </a>
        <a class="menu-card" href="listagem.jsp?acao=editar">
            <span>
                <span class="menu-icon" aria-hidden="true">✎</span><br>
                <strong>Atualizar peça</strong>
            </span>
            <span>Edite os dados de um acessório.</span>
        </a>
        <a class="menu-card" href="listagem.jsp?acao=excluir">
            <span>
                <span class="menu-icon" aria-hidden="true">⌫</span><br>
                <strong>Excluir peça</strong>
            </span>
            <span>Remova uma peça do seu estoque.</span>
        </a>
    </section>
</main>
</body>
</html>
