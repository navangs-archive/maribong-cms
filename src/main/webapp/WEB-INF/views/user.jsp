<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin Page</title>
    <meta name="description" content="Admin Page">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />

   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }

		.modal_wrap1{
	        display: none;
	        width: 500px;
	        height: 200px;
	        position: absolute;
	        top:50%;
	        left: 50%;
	        margin: -250px 0 0 -250px;
	        background:#eee;
	        z-index: 2;
	    }
		.modal_wrap2{
	        display: none;
	        width: 500px;
	        height: 250px;
	        position: absolute;
	        top:50%;
	        left: 50%;
	        margin: -250px 0 0 -250px;
	        background:#eee;
	        z-index: 2;
	    }
	    .black_bg{
	        display: none;
	        position: absolute;
	        content: "";
	        width: 100%;
	        height: 100%;
	        background-color:rgba(0, 0,0, 0.5);
	        top:0;
	        left: 0;
	        z-index: 1;
	    }
	    .modal_close{
	        width: 26px;
	        height: 26px;
	        position: absolute;
	        top: -30px;
	        right: 0;
	    }
	    .modal_close> a{
	        display: block;
	        width: 100%;
	        height: 100%;
	        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
	        text-indent: -9999px;
	    }
			

    </style>
</head>

<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="menu-title">메뉴</li><!-- /.menu-title -->
                    <li>
                        <a href="/board" class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>게시물 관리</a>
                    </li>
                    <li>
                        <a href="/quizBoard" class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>퀴즈 관리</a>
                    </li>
                    <li class="active">
                        <a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-user"></i>회원 관리</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><img src="images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
        </header>
        <!-- /#header -->
        
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>회원 관리 </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Content -->
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header" style="height:65px;">
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                	<colgroup>
                                		<col width="20%">
                                		<col width="20%">
                                		<col width=10%">
                                		<col width="*">
                                	</colgroup>
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>성별</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${userList}" var="User">
			                            <tr>
			                                <td>${User.userId}</td>
			                                <td>${User.userName}</td>
			                                <td>${User.userSex}</td>
			                                <td>
			                                	<button type="button" class="btn btn-warning" style="height: 30px; font-size: x-small; position: relative;" onclick="onClick(1,'${User.userId}')">
													<i class="fa fa-pencil"></i>&nbsp; 퀴즈할당 
												</button>
			                                	<button type="button" class="btn btn-success" style="height: 30px; font-size: x-small; position: relative;" onclick="onClick(2,'${User.userId}')">
													<i class="fa fa-pencil"></i>&nbsp; 봉사인증기록 등록 
												</button>
			                                </td>
			                            </tr>
			                        	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2018 Ela Admin
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

	<div class="black_bg"></div>
	<div class="modal_wrap1">
	    <div class="modal_close"><a href="#" onclick="offClick(1)">close</a></div>
	    <div>
	    	<div style="width:100%;height:30px;text-align:center;margin-top:10px;">
				<h3 style="text-weight:600">퀴즈할당</h3>
			</div>
			<div style="margin-top:20px;">
				<div style="text-align:center;margin-top:5px">
					아이디 : <input type="text" id="m_userId1" disabled style="width:75%">
				</div>
				<div style="text-align:center;margin-top:5px">
					퀴&nbsp;&nbsp;&nbsp;즈 : 
					<select id="m_quizNo" style="width:75%">
						<option value="">선택하세요.</option>
						<c:forEach items="${quizList}" var="Quiz">
						<option value="${Quiz.quizNo }">${Quiz.quizTitle }</option>
						</c:forEach>
					</select>
				</div>
				<div style="text-align:center;margin-top:5px">
					<button type="button" class="btn btn-primary" onclick="addQuiz()">등록</button>
				</div>
			</div>
	    </div>
	</div>
	<div class="modal_wrap2">
	    <div class="modal_close"><a href="#" onclick="offClick(2)">close</a></div>
	    <div>
	        <div style="width:100%;height:30px;text-align:center;margin-top:10px;">
				<h3 style="text-weight:600">봉사인증기록 부여</h3>
			</div>
			<div style="margin-top:20px;">
				<div style="text-align:center;margin-top:5px">
					아이디 : <input type="text" id="m_userId2" disabled style="width:75%">
				</div>
				<div style="text-align:center;margin-top:5px">
					내&nbsp;&nbsp;&nbsp;용 : <input type="text" id="m_content" style="width:75%" placeholder="내용을 입력해주세요.">
				</div>
				<div style="text-align:center;margin-top:5px">
					기&nbsp;&nbsp;&nbsp;간 : <input type="text" id="m_sdate" style="width:36%" placeholder="시작일자" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
					 - <input type="text" id="m_edate" style="width:36%" placeholder="종료일자" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
				</div>
				<div style="text-align:center;margin-top:5px">
					<button type="button" class="btn btn-primary" onclick="addHistory()">등록</button>
				</div>
			</div>
	    </div>
	</div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>

	<!--table Scripts -->
    <script src="assets/js/lib/data-table/datatables.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/jszip.min.js"></script>
    <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="assets/js/init/datatables-init.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
     	 } );
        	 
        function onClick(t,id) {
        	if (t == 1) {
            	document.querySelector('.modal_wrap1').style.display ='block';
            	document.getElementById('m_userId1').value = id;
        	} else {
            	document.querySelector('.modal_wrap2').style.display ='block';
            	document.getElementById('m_userId2').value = id;
        	}
            document.querySelector('.black_bg').style.display ='block';
        }   
        function offClick(t) {
        	if (t == 1) {
	            document.querySelector('.modal_wrap1').style.display ='none';
        	} else {
	            document.querySelector('.modal_wrap2').style.display ='none';
        	}
            document.querySelector('.black_bg').style.display ='none';
        }
     
		function addQuiz(){
			var userId = document.getElementById('m_userId1').value;
			var quizNo = document.getElementById('m_quizNo').value;
			
			$.ajax({
				type:'GET'
			  , url:'/addQuiz'
			  , data: {
				  		"userId":userId
				  	  , "quizNo":quizNo
			  		  }
			  , dataType:"JSON"
			  , async:true
			  , success: function(response){
					if (response.result == "success"){
						alert("퀴즈가 할당되었습니다.");
					} else {
						alert("이미 할당되어 있습니다.");
					}
			  }
			});
		}     
		
		function addHistory(){
			var userId = document.getElementById('m_userId2').value;
			var content = document.getElementById('m_content').value;
			var sDate = document.getElementById('m_sdate').value;
			var eDate = document.getElementById('m_edate').value;
			
			if (content == '') {
				alert("내용을 입력해주세요.");
				return false;
			}
			
			if (sDate.length < 8 || eDate.length < 8) {
				alert("시작일자, 종료일자를 확인해주세요.");
				return false;
			}
			
			$.ajax({
				type:'GET'
			  , url:'/addHistory'
			  , data: {
				  		"userId":userId
				  	  , "content":content
				  	  , "sDate":sDate
				  	  , "eDate":eDate
			  		  }
			  , dataType:"JSON"
			  , async:true
			  , success: function(response){
					if (response.result == "success"){
						alert("인증기록이 부여되었습니다.");
					} else {
						alert("인증기록 부여에 실패했습니다.");
					}
			  }
			});
		}     
  	</script>
</body>
</html>