/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String gender;
    private Date birthday;
    private String phone;
    private String email;
    private String firstName;
    private String lastName;
    private String inforName;
    private Timestamp registerDate;
    
    public User() {
    }

    public User(int id, String username, String password, String gender, Date birthday, String phone, String email, String firstName, String lastName, String inforName, Timestamp registerDate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.inforName = inforName;
        this.registerDate = registerDate;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getInforName() {
        return inforName;
    }

    public void setInforName(String inforName) {
        this.inforName = inforName;
    }
    public String getName(){
        return this.firstName + " " + this.lastName;
    }
}
