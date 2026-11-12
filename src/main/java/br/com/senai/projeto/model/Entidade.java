package br.com.senai.projeto.model;

import java.math.BigDecimal;

public class Entidade {
int id;
String nome;
String categoria;
int quantidade;
double precoUnitario;

    public Entidade(String nome, String categoria, int quantidade, BigDecimal preco) {
        this.nome = nome;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.precoUnitario = preco.doubleValue();
    }

    public Entidade() {

    }

    public double getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
