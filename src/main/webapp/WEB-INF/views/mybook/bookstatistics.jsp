<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookStatistics</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @font-face {
            font-family: 'NanumSquareNeo-Variable';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        * {
            box-sizing: border-box;
            font-family: 'NanumSquareNeo-Variable';
        }

        /* div {
	border: 1px solid black;
} */
        .container {
            margin: auto;
            overflow: hidden;
            width: 978px;
        }

        hr {
            display: block;
            height: 1px;
            border: 0;
            border-top: 1px solid rgb(216, 216, 216);
            margin-top: 15px;
            margin-bottom: 15px;
        }
        button:hover{
            cursor: pointer;
        }
        
        /*     header */
        .header {
            height: 150px;
            overflow: hidden;
        }

        .logo {
            float: left;
            position: relative;
            height: 100%;
            width: 55%;
        }

        #logoImg {
            height: 50%;
            position: absolute;
            bottom: 0px;
            left: 0px;
        }

        .search {
            float: left;
            position: relative;
            height: 100%;
            width: 25%;
        }

        .searchBox {
            position: absolute;
            bottom: 5px;
            left: 0px;
            overflow: hidden;
            height: 40px;
            width: 100%;
            border: none;
            border-radius: 5px;
            box-shadow: 3px 3px 3px 3px #80808050;
        }

        .searchTxt {
            float: left;
            padding: 0;
            background: none;
            border: none;
            outline: none;
            font-size: 15px;
            line-height: 40px;
            position: absolute;
            left: 10px;
        }

        .searchBtn {
            position: absolute;
            right: 0px;
            line-height: 100px;
            border: none;
            background-color: #ffffff;
            color: #5397fc50;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icons {
            float: left;
            position: relative;
            width: 20%;
            height: 100%;
        }

        .iconBox {
            position: absolute;
            bottom: 0px;
            right: 0px;
        }

        span.size-40 {
            font-size: 40px;
            color: black;
            font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 40
        }

        span,
        #logoImg:hover {
            cursor: pointer;
        }

        /*     header */

        /* navi */
        .navi {
            width: 100%;
            height: 50px;
        }

        /* body */
        /* sidenavi */
        .sideNavi {
            width: 10%;
            float: left;
        }

        ul {
            list-style-type: none;
            margin-top: 20px;
            padding-left: 0px;
        }

        li {
            margin-top: 10px;
            width: 40px;
            height: 40px;
            text-align: center;
            border-radius: 50%;
        }

        span.size-35 {
            line-height: 40px;
            font-size: 35px;
            color: gray;
            font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 35
        }

        .selected {
            background-color: #5397fc50;
        }

        /* contents */
        .contentsHeader {
            width: 100%;
            margin-bottom: 30px;
            font-size: 25px;
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }

        #profile {
            border-radius: 50%;
        }

        .contents {
            width: 90%;
            float: left;
            overflow: hidden;
        }

        .title {
            height: 50px;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-end;
        }

        .titleTxt {
            line-height: 30px;
            font-size: 20px;
        }

        span.size-30 {
            font-size: 30px;
            color: gray;
            font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 35
        }

        
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <img src="/resources/bookday_logotitle.png" id="logoImg">
            </div>
            <div class="search">
                <div class="searchBox">
                    <form action="//search" id="search" method="post">
                        <input class="searchTxt" type="text" placeholder="검색어를 입력해 주세요" id="searchWord"
                            name="searchWord">
                        <button class="searchBtn" type="submit">
                            <span class="material-symbols-outlined"> search </span>
                        </button>
                    </form>
                </div>
            </div>
            <div class="icons">
                <div class="iconBox">
                    <span class="material-symbols-outlined size-40" id="notifications">notifications</span>
                    <span class="material-symbols-outlined size-40" id="bookbag">shopping_bag</span>
                    <span class="material-symbols-outlined size-40" id="bookshelves">shelves</span>
                    <span class="material-symbols-outlined size-40" id="mypage">person</span>
                </div>
            </div>
        </div>
        <hr id="headerHr">
        <div class="navi"></div>
        <div class="body">
            <div class="sideNavi">
                <ul>
                    <li><span class="material-symbols-outlined size-35" id="snBookshelves">shelves</span></li>
                    <li class="selected"><span class="material-symbols-outlined size-35" id="snStatistics">equalizer</span></li>
                    <li><span class="material-symbols-outlined size-35" id="snCalendar">calendar_month</span></li>
                    <li><span class="material-symbols-outlined size-35" id="snBookmark">book</span></li>
                    <li><span class="material-symbols-outlined size-35" id="snBooknote">edit</span></li>
                </ul>
            </div>
            <div class="contents">
                <div class="contentsHeader">
                    <div id="contentsHeaderImg"><img src="/images/${dto.sysprofname }" width="100" height="100" id="profile"></div>
                    <div id="contentsHeaderTxt">${dto.nickname }님 책하루와 함께한 ${dto.signup_date } 하루</div>
                </div>
                <div class="contentsBody">
                    <div class="title">
                        <div class="titleTxt">책갈피</div>&nbsp
                        <span class="material-symbols-outlined size-30">book</span>
                    </div>
                    <div class=""></div>
                </div>
            </div>
            <div class="footer"></div>
        </div>
        <script>
            $("#logo_img").on("click", function () {
                location.href = "/";
            })

            $("#searchword").on("keydown", function (e) {
                if (e.keyCode == 13) {
                    $("#search").submit();
                }
            })
            $("#notifications").on("click", function () {
                location.href = "//toNotification";
            })
            $("#bookbag").on("click", function () {
                location.href = "/delivery/toBookbag";
            })
            $("#bookshelves").on("click", function () {
                location.href = "/bookshelves/selectBookshelves";
            })
            $("#mypage").on("click", function () {
                if (loginID == null) {
                    location.href = "/member/login";
                }
                location.href = "/member/toMypage";
            })
            $("#snBookshelves").on("click", function () {
                location.href = "/bookshelves/selectBookshelves";
            })
            $("#snStatistics").on("click", function () {
                location.href = "/bookstatistics/select-";
            })
            $("#snCalendar").on("click", function () {
                location.href = "/bookcalendar/select-";
            })
            $("#snBookmark").on("click", function () {
                location.href = "/bookmark/selectBookmark";
            })
            $("#snBooknote").on("click", function () {
                location.href = "/booknote/select-";
            })
        </script>
</body>
</html>