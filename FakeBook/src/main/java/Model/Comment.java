/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class Comment {
    private int idPost;
    private int idUser;
    private String content;
    private Timestamp createdTime;
    
    public Comment() {
    }

    public Comment(int idPost, int idUser, String content, Timestamp createdTime) {
        this.idPost = idPost;
        this.idUser = idUser;
        this.content = content;
        this.createdTime = createdTime;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdPost() {
        return idPost;
    }

    public int getIdUser() {
        return idUser;
    }

    
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
}
