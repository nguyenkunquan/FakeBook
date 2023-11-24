/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Comment {
    private int idPost;
    private int idUser;
    private String content;

    public Comment() {
    }

    public Comment(int idPost, int idUser, String content) {
        this.idPost = idPost;
        this.idUser = idUser;
        this.content = content;
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
