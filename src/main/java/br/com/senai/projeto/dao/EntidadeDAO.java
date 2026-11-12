package br.com.senai.projeto.dao;

import br.com.senai.projeto.config.Conexao;
import br.com.senai.projeto.model.Entidade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EntidadeDAO {
    public EntidadeDAO() {
        Conexao.createTable();
    }

    public void cadastrar(Entidade entidade){
        String sql = "insert into entidades (nome, categoria, quantidade, preco_unitario) values (?, ?, ?, ?)";
        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, entidade.getNome());
            stmt.setString(2, entidade.getCategoria());
            stmt.setInt(3, entidade.getQuantidade());
            stmt.setDouble(4, entidade.getPrecoUnitario());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Entidade> listar(){
        List<Entidade> entidades = new ArrayList<>();

        String sql = "select * From entidades";

        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Entidade entidade = new Entidade();
                entidade.setId(rs.getInt("id"));
                entidade.setNome(rs.getString("nome"));
                entidade.setCategoria(rs.getString("categoria"));
                entidade.setQuantidade(rs.getInt("quantidade"));
                entidade.setPrecoUnitario(rs.getDouble("preco_unitario"));
                entidades.add(entidade);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return entidades;
    }

    public Entidade buscarPorId(int id) {
        String sql = "select * from entidades where id = ?";
        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Entidade entidade = new Entidade();
                    entidade.setId(rs.getInt("id"));
                    entidade.setNome(rs.getString("nome"));
                    entidade.setCategoria(rs.getString("categoria"));
                    entidade.setQuantidade(rs.getInt("quantidade"));
                    entidade.setPrecoUnitario(rs.getDouble("preco_unitario"));
                    return entidade;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }




    public void atualizar(Entidade entidade){
        String sql = "update entidades set nome = ?, categoria = ?, quantidade = ?, preco_unitario = ? where id = ?";
        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, entidade.getNome());
            stmt.setString(2, entidade.getCategoria());
            stmt.setInt(3, entidade.getQuantidade());
            stmt.setDouble(4, entidade.getPrecoUnitario());
            stmt.setInt(5, entidade.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void excluir(int id){

        String sql = "delete from entidades where id = ?";
        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
