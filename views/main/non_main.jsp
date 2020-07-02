<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<%--
	이 페이지는 비회원에게 보여지는 게시물 메인페이지 | 로그인, 가입하기 유도 페이지 입니다.
  @author 서동혁
  @version v.0.1.0
  @since 2020.05.25
 --%>
<html style="background-color: #F3F0F7">
<head>
<meta charset="UTF-8">
<title>비회원 메인페이지</title>
<link rel="stylesheet" href="/cls/css/nonmem.css">
<link rel="stylesheet" href="/cls/css/proj_fixed.css">
<link rel="stylesheet" href="/cls/css/modal.css">
<link rel="stylesheet" href="/cls/css/w3.css">
<link rel="stylesheet" href="/cls/css/non_search.css">
<script type="text/javascript" src="/cls/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/cls/js/nonmem.js"></script>
<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
</head>
<body onload="printClock()"/>
<!-- 파라미터로 넘길 데이터값 -->
<form method="POST" id="frm">
	<input type="hidden" id="bno" name="bno"> <!-- 글 작성할때 넘겨줄 책 번호 -->
	<input type="hidden" id="eno" name="eno"> <!-- 글 작성할때 넘겨줄 감정번호 -->
	<input type="hidden" id="body" name="body"> <!-- 글 작성할때 넘겨줄 게시글 본문 -->
	<input type="hidden" id="tags" name="tags"> <!-- 글 작성할때 넘겨줄 해시태그 -->
</form>
<form method="POST" id="frm2">
	<input type="hidden" id="pno" name="pno"> <!-- 게시글 삭제시 넘겨줄 게시글 번호 -->
</form>
	<div>
	<!-- 본문부분 -->
		<div id="contents-wrap">
			<div class="contents">
				<!-- 좌측 게시글 부분 -->
				<div class="posts_area">
					<c:forEach var="data" items="${LIST}">
						<article class="eachPost"><!-- id="${data.pno}" -->
							<!-- 작성자 정보 & 버튼 :: 아이디 불러와야함  -->
							<div class="wrtInfo">
								<div class="wrtProf">
									<img src="">
								</div>
								<div class="wrter" id="id${data.pno}"><a href=""><b id="">${data.id}</b></a></div>
								<div class="time" id="time${data.pno}">${data.pdate} ${data.ptime}</div>
								<c:if test="${SID eq data.id}">
									<div class="like-butt" id="${data.pno}" style="display: flex;'">
										<span style="font-size: 12px; line-height: 0px;" class="e-d-img edbtn" id=""></span>
									</div>
								</c:if>
								<div class="like-butt" id="${data.pno}" style="display: flex;'">
									<span style="font-size: 12px; line-height: 0px;" class="like-img likebtn" id="like${data.pno}"></span>
								</div>
							</div>
							<!-- 게시글의 본문부분::도서사진,도서이름,본문 -->
							<div class="postCont" style="text-align: center; font-size: 16px;">
								<!-- 도서사진, 도서이름, 게시글본문 -->
								<div class="book-pic">
									<!-- 도서 사진 들어갈 부분 -->
									<img id="img${data.pno}" src="${data.largeimg}" style="width: 90%; height: auto;" />
								</div>
								<div class="genre-name" style="font-size: 12px; text-align: left;" id="genre${data.pno}">
									<!-- 도서장르 들어갈 부분 -->
									${data.gname}
								</div>
								<div class="book-name" id="bname${data.pno}">
									<!-- 도서명 들어갈 부분 -->
									<b>${data.bname}</b>
								</div>
								<div class="post-body">
									<!-- 게시글 부분 -->
									<a style="box-sizing: border-box; font-size: 18px;" id="pbody${data.pno}">${data.postcont}</a>
								</div>
							</div>
							<div class="wrtInfo">
								<div class="etcdiv" style="text-align: left; font-size: 13px;" id="hash${data.pno}">${data.hash}</div>
								<span class="modifdiv modi_post" id="${data.pno}"></span>
							</div>
						</article>
					</c:forEach>
					<!-- 게시물 수정 삭제 선택 띄워주는 모달 -->
					<div class="modal edit-del-modal" role="none">
						<div class="e-modal-content" style="margin: 100px auto;" id="">
							<div class="w100-pt10" style="height: 40px; border-top: 1px solid black; border-bottom: 1px solid black;">
								<a id="e-btn" style="font-size: 15px; position: absolute; line-height: 1;">수 정</a>
							</div>
							<div class="w100-pt10" style="height: 40px;">
								<a id="d-btn" style="font-size: 15px; position: absolute; line-height: 1;">삭 제</a>
							</div>
							<div class="w100-pt10" style="height: 40px; border-top: 1px solid black; border-bottom: 1px solid black;">
								<a id="c-btn" style="font-size: 15px; position: absolute; line-height: 1;">취 소</a>
							</div>
						</div>
					</div>
					<!-- 게시물 상세보는 모달 -->
					<div class="modal detailPost" role="none">
						<div class="p-modal-content" id="" style="height: 540px;">
							<span class="close w-x-btn" id="d-close_butt">x</span>
							<div class="w100-pt10">
								<div class="wrtProf" style="width: 45px; height: 45px;">
									<img src="">
								</div>
								<div class="wrter" style="line-height: 40px;" id="">
									<a href="" style="font-size: 18px;"><b class="wrter"></b></a>
								</div>
								<div class="time" style="line-height: 40px;" id="time"></div>
								<div class="like-butt" id="">
									<span style="font-size: 12px; line-height: 0px;" class="comt-img comtbtn"></span>
								</div>
								<div class="like-butt" id="" style="display: flex;'">
									<span style="font-size: 12px; line-height: 0px;" class="like-img likebtn" id=""></span>
								</div>
								<div class="w100-h290">
									<div class="book-pic">
										<!-- 도서 사진 들어갈 부분 -->
										<img id="bimg" src="" style="float: left; box-sizing: border-box;" />
									</div>
									<div class="genre-pad" id="genre-pad"></div>
									<div class="genre-pad" style="font-size: 25px; line-height: 25px;"><b id="genre-name"><b></b></b></div>
									<div class="detail-body">
										<!-- 게시글 부분 -->
										<a style="box-sizing: border-box; font-size: 15px;" id="p-body"></a>
									</div>
								</div>
								<div class="w100-h35">
									<div style="margin-left: 20px; text-align: left; font-size: 12px;" id="gethash"></div>
								</div>
								<div class="w100-h95" id="">
									<!-- 댓글 리스트 뽑아오기 -->
								</div>
								<div class="wrtcomt hidcommt" style="display: none;" id="">
									<div class="comwrter">
										<input type="hidden">
										<a>${SID}</a>
									</div>
									<input type="text" class="combody" placeholder="댓글을 입력하세요." />
									<input type="button" class="comsubbtn" value="등록" id=""/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 우측 정보 부분 : 고정페이지로 들어갈 것-->
				<div class="info_area">
					<div style="width: 100%; height: 250px; margin-top: 15px;">
						<div class="w100-h40" style="border-bottom: solid 1px black;">
							<a class="fl-fs13"><b>페이지터너에서 가장 많은 글이 달린 도서</b></a>
						</div>
						<c:forEach var="bData" items="${OLIST}">
							<div class="w100-h40" id="${bData.bno}">
								<a class="fl-fs10" href="">${bData.gname}</a>
								<div class="fl-fs15">${bData.bname}</div>
							</div>
						</c:forEach>
					</div>
					<div style="width: 100%; height: 200px; margin-top: 15px; border: solid 1px white;">
						<a></a>
					</div>
				</div>
				<!-- 우측 정보 끝! -->
			</div>
		</div>
		<!-- 헤더부분 -->
		<div id="header-wrap">
			<div class="header">
				<div class="logobox">
					<div style="box-sizing: border-box; font-size: 30px; text-align: center;">
						<!-- 로고 이미지 혹은 링크 들어갈 자리 class="div_logo" -->
						<a href="/BookNet/main/non.cls" style="color: #120E0A;"><b>PageTurner</b></a>
					</div>
				</div>
				<div class="searchbox">
					<input class="searchinput" type="text" placeholder="search">
				</div>
			  <div class="iconsbox">
               <!-- 상단 로그인, 가입하기 버튼 -->
               <a href="#" class="ft-log foot-box mg-whtie"  style="color: #fff;"id="lbtn">로그인</a>
               <a href="#" class="ft-join joinc0l0" style="padding-left:15px; color:rgba(var(--d69,0,149,246),1);" id="jbtn">가입하기</a>
               <!-- /상단 로그인, 가입하기 버튼 -->
            </div>
			</div>
		</div>
		<!-- Footer Link -->
		     <div class="closeing bgalss dCJb6 rBNOH Igw0E pmxbr HcJZg XfCBB IY_1 4EzTm" style="z-index: 2; height:111.938px; bottom: 0px; position: fixed;">
		         <!-- close button -->
		         <button class="xqRnw dCJp8">
		            <!-- <span aria-label="닫기" style="text-align: center; margin: 0px auto;"><img src="https://img.icons8.com/plasticine/100/000000/close-window.png" style="width: 24px; height: 24px;"/></span> -->
		            <span aria-label="닫기" class="insbak insgreyClose" style="margin: 3px;"></span>
		         </button>
		         <!-- /close button -->
		         <!-- div area -->
		         <div class="divflex" style="width: 903px; margin: 0px auto;">
		            <!-- area in icon -->
		            <div style="height: 56px; width: 56px; border: 1px solid white;" class="inblock posit bd-rad">
		               <span aria-label="로그인" style="color: white; display: block; padding: 6px; padding-top: 15px;" class="XfCBB HcThg dCJb6 full0">LOGO</span>
		            </div>
		            <!-- /area in icon -->
		            <!-- text body -->
		            <div class="mg-left dblock rG18m">
		               <!-- from Login -->
		               <div class="mg-whtie">
		                  <div>PageTurner에 로그인</div>
		               </div>
		               <!-- /from Login -->
		               <!-- body -->
		               <div class="footbody">PageTurner에서 다른 사람들과 당신이 좋아하는 책에 대해 이야기해보세요<img style="width: 20px; hieght: 20px;"src="https://img.icons8.com/cotton/64/000000/apple--v2.png"/></div>
		               <!-- /body -->
		            </div>
		            <!-- /text body -->
		            <!-- Login, Join button -->
		            <div class="ft-btn">
		               <!-- Login -->
		               <div class="mt-12">
		                  <a href="#" class="ft-log foot-box mg-whtie"style="color: #fff;" id="lbtn2">로그인</a>
		               </div>
		               <!-- /Login -->
		               <!-- Join -->
		               <div style="text-align:center; margin-top: 12px; padding: 0px 30px;">
		                  <a href="#" class="ft-join joinc0l0" style="color:rgba(var(--d69,0,149,246),1);"id="jbtn2">가입하기</a>
		               </div>
		               <!-- /Join -->
		            </div>
		            <!-- /Login, Join button -->
		         </div> 
		         <!-- /div area -->
		      </div>
		<!-- /Footer Link -->
     <!-- 풋터부분 -->
      <footer>
      	<jsp:include page="/WEB-INF/views/include/seoFooter.jsp"/>
      </footer>
   </div>
</body>
</html>