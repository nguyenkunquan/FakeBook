<%-- 
    Document   : chat
    Created on : Dec 7, 2023, 12:17:11 AM
    Author     : doant
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fakebook messenger</title>
        <link href="https://fonts.googleapis.com/css?family=Inter:100,200,300,regular,500,600,700,800,900" rel="stylesheet" />
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/solid.css">
        <style>
            .chatLine{
                position: relative;
            }
            .sender{
                position: absolute;
                top: 40px;
                right: 0;
                font-size: 9px;
                color: rgb(132, 132, 132);
            }
            .me{
                position: absolute;
                top: 40px;
                left: 0;
                font-size: 9px;
                color: rgb(132, 132, 132);
            }

            #navBars{
                background-color: #2e313e;
            }
            body{
                background-color:darkblue;
                overflow: hidden;
            }
            /*            .friendList{
                            float: right;
                            border: none;
                            background-color: rgb(228, 228, 228);
                            height: 30px;
                            border-radius:10px;
                        }*/
            .friendList{
                position: absolute;
                right: 20px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            .friendLabel{
                width: 100%;
                /* height: 30px; */
                margin-bottom: 9px;
            }
            button{
                box-shadow: rgba(124, 124, 124, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
                border: none;
                transition: background-color 200ms linear;
            }
            button:hover{
                background-color: white;

                cursor: pointer;
            }
            button:hover ion-icon{
                color: #3253C8 ;
            }
            .showID{
                background-color: #00a824 ;
                color: white;
                width: 30px;
                --ionicon-stroke-width: 46px;
            }
            .startChat{
                background-color: #e0032b ;
                color: white;
                width: 30px;
                --ionicon-stroke-width: 46px;
            }
            .startChat ion-icon{
                color: white;
                font-size: 1rem;
            }
            .showID ion-icon{
                color: white;
                font-size: 1rem;
            }
            #container{
                /*position: relative;*/
                padding: 10px;
                display: flex;
                justify-content: space-between;
                /*margin: 0 auto;*/
                /*background-color:#3253C8;*/
            }
            .chatFrame{
                width: 70%;
                float: left;
                background-color: rgb(238, 238, 238);
                height: 85vh;
                position: relative;
                box-shadow: 0 0 2px black;
            }
            #chatTarget{
                position: absolute;
                width: 100%;
                height: 5%;
                background-color: white;
                border-top: 4px solid rgb(34, 218, 13);
                text-align: center;
                padding-top: 5px;
            }
            #chatAction{
                position: absolute;
                left:0;
                right:0;
                margin-left:auto;
                margin-right:auto;
                bottom: 3px;
                width: 99%;
                height: 7%;
                background-color: white;
                display: inline-flex;
                align-items: center;
                justify-content: space-around;
                text-align: center;
                padding-top: 3px;

            }
            #chatContent{
                width: 90%;
                height: 85%;
                border: none;
                border-radius: 20px;
                background-color: rgb(208, 208, 208);
                padding-left: 15px;
                box-sizing: border-box;
            }
            #chatBox{
                position: absolute;
                top: 35px;
                width: 100%;
                height: 85%;
                overflow-y:auto;
            }
            #chatBox li{

                display: inline-block;

                width:100%;
            }
            .myMessage{
                position: relative;
                background: rgb(0,143,255);
                background: linear-gradient(90deg, rgba(0,143,255,1) 0%, rgba(0,212,255,1) 100%);
                width: fit-content;
                float: right;
                border-radius: 10px;
                padding: 10px;
                margin: 15px 10px;
                color:white;
            }
            .targetMessage{
                background-color: #ffffff;
                width: fit-content;
                position: relative;

                border-radius: 10px;
                padding: 10px;
                margin: 15px 10px;
            }
            #sendMessage{
                height: 85%;
                background-color: rgb(1, 162, 255);
                font-weight: 600;
                color: white;
                border-radius: 10px;
                padding:5px;
            }
            .friendList{
                position: absolute;
                width: 25%;
                /* background-color: none; */
                height: 600px;
                border-radius: 10px;
            }
            #Idbox{
                display: flex;
                justify-content: space-between;
            }
            .name{
                display: inline-flex;
                align-items: center;
                width: 80%;
                height: 30px;
                padding-left: 5px;
                background-color: aliceblue;
                box-shadow: rgba(124, 124, 124, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
            }
            .musicController{
                display: inline;
                position: absolute;
                right: 5px;
                padding: 0 4px;
                top: 0;
                height: 600px;
                width: 25%;
                box-shadow: rgba(124, 124, 124, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
            }
            @media screen and (max-width: 1024px) {
                .musicController{
                    display:none;
                }
                .chatFrame{
                    width: 100%;
                    float: right;
                }
                .friendList{
                    /*width:35%;*/
                }
            }
            ::-webkit-scrollbar {
                width: 4px;
            }

            /* Track */
            ::-webkit-scrollbar-track {
                background: none;
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: rgb(9, 93, 228);
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: rgb(6, 113, 159);
            }

            @keyframes rotate {
                0% {
                    transform: rotate(0);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .state {
                color: rgb(247, 51, 51);
                font-size: 1rem;
            }

            .info-song {
                margin-top: 0.5rem;
                margin-bottom: 2rem;
                text-align: center;
            }


            ion-icon{
                display: inline;
            }



            i {
                pointer-events: none;
            }

            @-webkit-keyframes hue {
                from {
                    -webkit-filter: hue-rotate(0deg);
                }
                to {
                    -webkit-filter: hue-rotate(-360deg);
                }
            }
        </style>
    </head>

    <body>
        <%@include file="/views/Layout/header.jsp"%>

        <% String user = (String) session.getAttribute("User");%>

        <div id="container">


            <div class="chatFrame">
                <div id="chatTarget">Fakebook messenger</div>
                <div id="chatBox">
                    <ul id="Line">
<!--                        <li class="chatLine"><div class="myMessage">alohehelloaect
                                <div class="sender">@duongminhtri</div>
                            </div></li>
                        <li class="chatLine"><div class="targetMessage">alohehelloaect
                                <div class="sender">@duongminhtri</div>
                            </div></li>-->
                        
                    </ul>
                </div>
                <form id="formChat">
                    <div id="chatAction">

                        <input id="chatContent" type="text" value="">

                        <button id="sendMessage">SEND</button>


                    </div></form>
            </div>
            <div class="friendList">
                <textarea id="textAreaMessage" rows="10" cols="50"></textarea>
            </div>

        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script type="text/javascript">
            const form = document.getElementById('formChat');
            const textAreaMessage = document.getElementById('textAreaMessage');
            const chatBox = document.getElementById('chatBox');
            const line = document.getElementById('Line');
            const sendButton = document.getElementById('sendMessage');
            var username = "<%=user%>";
            console.log(username)
            var websocket = new WebSocket("ws://localhost:8080/FakeBook/endpoint/" + username);
            websocket.onopen = function (message) {
                console.log(message)
                processOpen(message);
            };
            websocket.onmessage = function (message) {
                processMessage(message);
            };
            websocket.onclose = function (message) {
                processClose(message);
            };
            websocket.onerror = function (message) {
                processError(message);
            };


            function processOpen(message) {
//                textAreaMessage.value += "<%=user%> connect server ..." ;
//                websocket.send(`${username} connect server ... \n`);
            }


            function processMessage(message) {
                textAreaMessage.value += message.data + " \n";
                const div = document.createElement('div');
                const div2 = document.createElement('div');
                var originalString = message.data;
                var parts = originalString.split(':');
                const content = document.getElementById('chatContent').value;

//                if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
//                    websocket.send(content);
//                    console.log("hello")
//                }
                document.getElementById('chatContent').value = ' ';
// Check if the array has at least two elements

                var namePart = parts[0].trim();
                console.log("namePart")
                if (namePart === username) {
                    div.className = 'myMessage';
                    div2.className = 'sender';
                } else {
                    div.className = 'targetMessage'
                    div2.className = 'me';
                }


                const li = document.createElement('li');
                const txt = document.createTextNode(message.data);
                const p = document.createElement('p');

//                const sender = document.createTextNode(username);

//                div2.appendChild(sender);
                p.appendChild(txt);
                div.appendChild(txt);
//                div.appendChild(div2);
                li.appendChild(div);
                line.appendChild(li);
                chatBox.scrollTo(0, chatBox.scrollHeight);
                console.log(line)
            }

            function processClose(message) {
                textAreaMessage.value += "Server Disconnect... \n";
            }
            function processError(message) {
                textAreaMessage.value += "Error... " + message + " \n";
            }

            function sendMessage() {
                if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
                    websocket.send(textMessage.value);
//                    textMessage.value = "";
                }
            }

            function handleForm(event) {
                event.preventDefault();
            }
            form.addEventListener('submit', handleForm);

            sendButton.onclick = () => {
                const content = document.getElementById('chatContent').value;
                if (content === " ") {
                    sendButton.preventDefault();
                }
                if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
                    websocket.send(content);
                }
                document.getElementById('chatContent').value = ' ';
            }




        </script>
    </body>
</html>
