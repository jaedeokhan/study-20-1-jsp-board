# study-20-1-jsp-board
2020 0702 JSP 게시판 만들기 클론코딩 - 동빈나님 

## JSP 게시판 만들기
* 1강 - Hello World! 
   * Downlaod Java SE [JAVA jdk SE 8u251 install link](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)
   * 환경변수 설정
      * 자신의 jdk 설치한 경로 설정
         * JAVA_HOME = C:\Program Files\Java\jdk1.8.0_19
         * PATH = %JAVA_HOME%\bin  
   * Install tomcat version 8 [tomcat v 8,5 install link](https://tomcat.apache.org/download-80.cgi)
   * Download Ecplise [Elicpse install link](https://www.eclipse.org/downloads/)
   * index.jsp

* 2강 - 로그인 페이지 디자인
   *  encoding = UTF-8 설정
   *  디자인 레이아웃은 bootstrap 을 사용 [bootstrap install link](http://getbootstrap.com/docs/3.3/)
   * index.jsp
   * login.jsp 
  
* 3강 - 회원 데이터베이스 구축하기
   * Install mysql [mysql 8.0 install link](https://dev.mysql.com/downloads/installer/) 
   * DB, TABLE 생성 [user.sql]()
   * Java Beans 생성 [user/User.java]()
 
* 4강 - 로그인 기능 구현하기
   * UserDAO.java : UserDAO(), login(userID, userPassword)
   * loginAction.jsp : result 1, 0, -1, -2 에 따라 처리해주기

* 5강 - 회원가입 페이지 디자인
   * join.jsp : 회원가입 폼 구현

* 6강 - 회원가입 기능 구현하기
   * UserDAO.java => join(User user) 구현
   * joinAction.jsp  

* 7강 - 접속한 회원 세션 관리하기
   * logoutAction.jsp : session 해제
   * loginAction.jsp : session 부여
   * joinAction.jsp  : session 부여
   * main.jsp : session 이 존재하는 것과 하지 않는것 구분해서 처리

* 8강 - 게시판 메인 페이지 디자인
   * bbs.jsp : board bulitin system 게시판 페이지 구현
   * write.jsp : 게시판 글쓰기

* 9강 - 게시판 데이터베이스 구축하기
   * 게시판 테이블 [board.sql]()
   * board Java Beans 생성 [board/Board.java]()

* 10강 - 글쓰기 기능 구현하기
   * write.jsp : 게시판 UI 구현하기
   * BoardDAO.java : 3개의 함수 만들어주기 =>  getDate(), getNext(), write(bbsTile, userID, bbsContent) 구현
   * writeAction.jsp

* 11강 - 게시판 글 목록 기능 구현하기
   * BoardDAO.java 에서 함수 두 개 생성
      * ArrayList<Board> getList(int pageNumber) : SQL에 해당하는 list 가져오기
      * boolean nextPage(int pageNumber) : 페이징 처리
   * bbs.jsp 목록 구현 
   * bbs.jsp 다음 페이지, 이전 페이지 구현

* 12강 - 게시글 보기 기능 구현하기
   * BoardDAO.java => Board getBoard(int bbsID);
   * view.jsp : replaceAll("\n", "<br>") => 브라우저에서는 태그인지 구별하지 못하므로 replaceAll 처리를 해준다.
      * 특수문자 출력이 되도록 처리
      * Cross Site Script 문제점 처리하기: replaceAll 로 태그들을 치환해주기

* 13강 - 게시글 수정 및 삭제 기능 구현하기
   * update.jsp  
      * BoardDAO.java => int update(int bbsID, String bbsTitle, String bbsContent);
   * updateAction.jsp 
   * deleteAction.jsp 
      * BoardDAO.java => int delete(int bbsID);
   * view.jsp 
      * Javascript onclick confirm() 함수를 이용해서 정말로 삭제하는지 질의

* 14강 - 웹 사이트 메인 페이지 디자인
   * main.jsp : bootstarp jumbtron 사용해서 UI 구성  
      * custom.css => import google.font => Nanum Gothic, Hanna
      * carousel 디자인

* 15강 - 프로젝트 완성 및 배포
   * 웹 호스팅 서비스 이용=> cafe 24
   * cafe 24에서 호스팅 한 mysql admin에서 DB TABLE User, Board 동일하게 생성 
   * UserDAO, BoardDAO 에서 connection 만드는 경로, 아이디, 비밀번호 cafe24 호스팅 한 서버에 맞게 설정
   * JAVA JDK cafe 24 에 맞게 1.7 다운 그레이드 해주기
   * 해당 폴더를 전부 웹 서버에 업로드한다. 
      * 웹 서버 접속 도구는 파일질라, r드라이브 
