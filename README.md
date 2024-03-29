# Bookday
> 독서 노트 기록 서비스 및 종이책 구독 서비스 웹사이트
<br>

> 참여 인원 : 3
* 팀장 : 하수진
* 팀원 : 이수아
* 팀원 : 강지민
<br>

> 수행기간	2022.12.04 ~ 2023.01.05
<br>

> 개발 환경	
* OS : windows
* Java : 11
* Framework : Spring mvc
* DB : Oracle
* DBMS : SQLDepveloper
* 서버 실행 : Tomcat8.5
* IDE : eclipse, VSCode
* 배포 : AWS
* 기타환경 : maven, lombok, mybatis, ojdbc8, dbcp, spring jdbc, jstl, JSP, jQuery, bootstrap, html, css, javascript, ajax, gson, jsonsimple, jsoup, sha256 
* API : 도서정보크롤링API, 문자인증 API, 카카오 로그인 API, 카카오 결제 API, 카카오 우편 API, Google Fonts, Summernote, Date Range Picker 
* 협업 툴 : Git, Github, Source Tree, Google Drive, Discord, Zoom

> 화면구성
* Main
  * 상단 메뉴 고정
  * 베스트셀러, 스테디 셀러, 인기 포스트 swiper 적용
![3 34 217 163_ (3)](https://user-images.githubusercontent.com/116864859/219986342-850ecc06-f2b1-4974-bdc3-5551d2af7a51.png)


<br>

* Join
  * 휴대폰 번호로 인증번호 받아 본인 확인
  * 휴대폰 번호를 아이디로 가입 후 UUID로 고유 ID 부여
  * 유효성 검사 통과 시 회원가입 가능
  * 유효성 검사 결과 바로 알림
![3 34 217 163_member_toSignup](https://user-images.githubusercontent.com/116864859/219986546-a37ab131-a792-49e1-94fb-097464518f86.png)

<br>

* Login
  * 휴대폰 번호로 로그인
  * 비밀번호 SHA256
  * 카카오 회원가입 / 로그인 가능
![3 34 217 163_member_toLogin](https://user-images.githubusercontent.com/116864859/219986629-752bc877-3aab-48b5-b4bb-9cd5e50e927e.png)

<br>

* Book Shelves
  * 대여 중 / 위시리스트 / 포스트 작성 책으로 구성
  * 대여 기간 종료 시 책장에서 사라짐
  * 위시리스트 캐러셀로 10개 넘으면 다음 페이지가 생기게 구성
  * 포스트 작성 시 추가되는 책장은 가장 아래 배치하여 수집의 기쁨을 사용자가 느낄 수 있게 ajax로 무한 스크롤 구현
![3 34 217 163_bookshelves_selectBookshelvesListById](https://user-images.githubusercontent.com/116864859/219986710-a91281aa-1302-4c40-be95-04cd5b700faf.png)

<br>

* Book Calendar
  * 포스트 작성 시 읽은 기간에 맞게 책 이미지 노출
  * 칸을 벗어나 더 많은 책을 기록 시에 스크롤로 모든 책을 담을 수 있도록 하여 UI를 해치지 않았음
  * 현재 달 다음 달로는 이동이 불가하며 월별 달력 이동 시 아래 연간 달력도 가장 마지막 월이 이동 된 월과 일치하게 제작
  * API로 제작하고자 하였으나 기존의 API에 원하는 기능이 없어서 직접 Java script로 제작
![3 34 217 163_bookcalendar_toCalendar](https://user-images.githubusercontent.com/116864859/219986748-7b0fe6e0-1e11-4335-8c67-d4a94e5835fd.png)

<br>

* Book Statistics
  * 모든 테이블을 union 하여 사용자와 관련 있는 책 / 작가 / 장르 상위 5위까지만 나오게 구성
![3 34 217 163_bookstatistics_toStatistics](https://user-images.githubusercontent.com/116864859/219986823-80e77af0-e4e0-4068-975f-4d2249cb4d7b.png)

<br>

* Bookmark
  * 책 검색 시 책 검색 팝업에서 책을 선택 후 책 정보를 가져오는 function을 사용하여 책 정보 입력
  * 북마크 입력 시 ajax를 이용하여 댓글처럼 바로 아래 목록 상위로 추가되도록 구현
  * 북마크 검색 시 본인 북마크 내에서 검색 가능(북마크는 개인적 소장 용도로 제작하여 다른 사용자와 공유하지 않음)
![3 34 217 163_bookmark_selectBookmarkListById](https://user-images.githubusercontent.com/116864859/219986898-2b0ea1d7-f764-47a2-bf49-2d8fcbc4909b.png)

<br>

* Booknote
  * 리스트에서 본인이 작성한 포스트를 모두 볼 수 있음. 본인 포스트 검색 가능. 좋아요 눌러 입력/취소 가능.
  * 포스트 작성 시에도 책 검색 팝업에서 책을 선택 후 책 정보를 가져오는 function을 사용하여 책 정보 입력
  * 포스트 작성 summernote API 사용(이미지 다중 입력 가능. ajax 이용하여 저장 후 저장된 주소값으로 불러오는 방식 base64 방식 아님.)
  * 포스트 작성 시 읽은 기간 선택 datepicker API 사용. 오늘 날짜까지만 선택 가능하게 구성. 선택하지 않을 시 오늘 날짜로 입력 됨.
  * 포스트 디테일에서도 좋아요 입력/취소 가능
  * 포스트 디테일에서 댓글 입력 가능 ajax로 바로바로 댓글이 하단에 붙음
  * 포스트 수정 가능(수정 시 원 포스트 정보 그대로 출력 한 상태에서 수정)
![3 34 217 163_booknote_selectPostListRev (1)](https://user-images.githubusercontent.com/116864859/219986973-a805302d-5943-4f73-9240-6e35ec00953a.png)
![localhost_booknote_toInsertPost (1)](https://user-images.githubusercontent.com/116864859/219987672-fbb9f38d-3107-4f94-b4be-a219058bf37e.png)
![localhost_booknote_selectPostByPseq_p_seq=27 (2)](https://user-images.githubusercontent.com/116864859/220023830-78168fec-2c68-495b-9408-be8faf44fbf1.png)
![localhost_booknote_toUpdatePost_p_seq=27](https://user-images.githubusercontent.com/116864859/220024015-047b6a18-7f02-46a3-9c75-993cbbafa96e.png)

<br>

* Book
  * 책 검색 상단 메뉴 있는 곳 어디에서든 검색 가능 (검색 대상 : 책 제목, 책 작가, 책 장르, 책 관련 포스트, 포스트 작성자, 포스트 제목, 포스트 내용)
  * 책 상세 정보에서 위시리스트 담기, 책가방에 담기, 짧은 리뷰(댓글 형식) 작성, 리뷰에 좋아요 입력/취소, 다른 사용자들이 같이 담은 책 보기 가능
![localhost_search_toSearch](https://user-images.githubusercontent.com/116864859/220032120-f36c9d39-a815-4e1f-91a8-fa2d441c66ab.png)
![localhost_book_selectBookinfo_b_isbn=9788901243658](https://user-images.githubusercontent.com/116864859/220032170-be16d63e-9bdc-424c-a006-e728b167c359.png)

<br>

* subscription
  * 구독하기 에서 카카오로 간편하게 결제할 수 있게 구현
![localhost_delivery_toPayment_id=2bfe441d-652f-48ab-8f31-8ead9ab1169a](https://user-images.githubusercontent.com/116864859/220032320-3bb35807-a683-4e40-b4c1-122b9d417f54.png)
![localhost_delivery_toPayment_id=2bfe441d-652f-48ab-8f31-8ead9ab1169a (1)](https://user-images.githubusercontent.com/116864859/220032431-77a5295a-f261-4d37-af07-ab7e5ceaa68d.png)

<br>

* Bookbag
  * 책가방에서 위시리스트로 이동 가능
  * 선택으로 책가방 내에서도 선택한 책만 대여 가능
  * 구독 회원일 시, 구독 가능한 횟수, 책 권 수/대여 시 배송일자, 반납일자, 배송지 입력 출력
  * 배송지 입력시 카카오 우편번호 API 팝업으로 주소 입력(이 팝업을 거치지 않고는 입력할 수 없게 막음)
  * 미구독 회원일 시, 구독 페이지로 이동하는 버튼 출력
![localhost_delivery_selectBookbagListById_id=03e1db57-b81b-4f5c-b7f7-53cb1390f6fb](https://user-images.githubusercontent.com/116864859/220032557-d0b7defb-a37e-4ffd-90e9-14c869930f75.png)
![localhost_delivery_toRentalCompleted](https://user-images.githubusercontent.com/116864859/220032615-f6120dd2-8102-47e7-a7cb-f363bc239f26.png)

<br>

* My Page
  * 회원 정보, 구독 여부 출력
  * 회원 정보 수정 가능, 프로필 사진도 수정 가능, 아이디로 사용하는 휴대폰 번호도 인증번호 확인 후 수정 가능(고유 아이디로 UUID를 부여했기 때문)
![3 34 217 163_member_toMypage](https://user-images.githubusercontent.com/116864859/220219095-7ab01bdf-7a93-4608-80a4-7dee917c121f.png)
![localhost_member_toUpdateMemInfo (2)](https://user-images.githubusercontent.com/116864859/220033267-de38950e-f995-4578-a080-4de90245cf51.png)
