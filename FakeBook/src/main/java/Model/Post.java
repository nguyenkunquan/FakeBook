/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;


public class Post {
    private int id;
    private String content;
    private String img;
    private int likeNum;
    private int commentNum;
    private int idUser;

    public Post() {
    }

    public Post(int id, String content, String img, int likeNum, int commentNum, int idUser) {
        this.content = content;
        this.img = img;
        this.likeNum = likeNum;
        this.commentNum = commentNum;
        this.idUser = idUser;
    }


    public void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }
    

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
    
    
}
