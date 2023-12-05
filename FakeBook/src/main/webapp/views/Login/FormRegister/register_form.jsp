

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Facebook Sign up Page 2022</title>
        <link rel="stylesheet" href="views/Login/FormRegister/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet" />
    </head>
    <body>
        <!--Facebook Signup from start-->
        <div class="main">
            <form method="POST" action="./Register" enctype="multipart/form-data">
                <h2 class="first_title" style=" font-size: 40px;
                    padding: 10px 10px 10px 10px;">Sign Up</h2>
                <p class="first_sub_title"> </p>
                <hr />
                <!--Input section start-->
                <div class="input">
                    <input name="id_user" type="text" placeholder="Id" class="id_user" id="all" required />
                    <br />
                    <input name="first_name" type="text" placeholder="First Name" class="first_name" id="all" required />
                    <input name="last_name" type="text" placeholder="Last Name" class="last_name" id="all" required />
                    <br />
                    <input name="user_name" type="text" placeholder="User name" id="all1" required />
                    <br />
                    <input name="password" type="password" placeholder="New password" id="all1" required />
                    <br />
                    <input name="phone" type="number" placeholder="Phone number"  id="all1" required />
                    <br />
                    <input name="email" type="email" placeholder="Email"  id="all1" required />
                    <br />
                </div>
                <p class="sub_title_2" id="sub_title" style="margin-left: 12px; margin-top: 10px">Date of Birth</p>
                <select name="daySelect" style="
                        width: 125px;
                        margin-left: 10px;
                        margin-top: 10px;
                        height: 35px;
                        font-size: 15px;
                        background: none;
                        border: 1px solid #aaaa;
                        border-radius: 5px;">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
                    <option>27</option>
                    <option>28</option>
                    <option>29</option>
                    <option>30</option>
                    <option>31</option>
                </select>
                <select name="monthSelect" style="
                        width: 125px;
                        margin-left: 10px;
                        margin-top: 10px;
                        height: 35px;
                        font-size: 15px;
                        background: none;
                        border: 1px solid #aaaa;
                        border-radius: 5px;">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                </select>
                <select name="yearSelect" style="
                        width: 125px;
                        margin-left: 10px;
                        margin-top: 10px;
                        height: 35px;
                        font-size: 15px;
                        background: none;
                        border: 1px solid #aaaa;
                        border-radius: 5px;">
                    <option>2022</option>
                    <option>2021</option>
                    <option>2020</option>
                    <option>2019</option>
                    <option>2018</option>
                    <option>2017</option>
                    <option>2016</option>
                    <option>2015</option>
                    <option>2014</option>
                    <option>2013</option>
                    <option>2012</option>
                    <option>2011</option>
                    <option>2010</option>
                    <option>2009</option>
                    <option>2008</option>
                    <option>2007</option>
                    <option>2006</option>
                    <option>2005</option>
                    <option>2004</option>
                    <option>2003</option>
                    <option>2002</option>
                    <option>2001</option>
                    <option>2000</option>
                    <option>1999</option>
                </select>
                <!--Date of Birth section end-->
                <br />
                <!--Gender section start-->
                <div>
                    <div class="mb-3">
                        <select class="form-select" id="all1" name="gender" aria-label="Default select example">
                            <option selected value="-1">chọn giới tính</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
                <br />
                <div ><input type="submit" value="Signup" class="submit" /></div>
                <br />


            </form>
        </div>
        <!--Facebook Signup from end-->
    </body>
</html>
