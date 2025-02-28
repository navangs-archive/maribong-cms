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
        
		.notice{
			font-weight : 700;
			color : red;
		}
		
		.question{
			font-weight : 700;
			color : blue;
		}
		
		.nomal{
			font-weight : 700;
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
                    <li class="active">
                        <a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>게시물 관리</a>
                    </li>
                    <li>
                        <a href="/quizBoard" class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>퀴즈 관리</a>
                    </li>
                    <li>
                        <a href="/user" class="dropdown-toggle"> <i class="menu-icon fa fa-user"></i>회원 관리</a>
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
                                <h1>게시물 관리</h1>
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
                            <div class="card-header">
								<strong class="card-title">
									<button type="button" class="btn btn-primary"
										style="height: 40px; font-size: medium; float: right; position: relative;" onclick="editPage()">
										<i class="fa fa-pencil"></i>&nbsp; 등록
									</button>
								</strong>
							</div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                	<colgroup>
                                		<col width="5%">
                                		<col width="35%">
                                		<col width="13%">
                                		<col width="12%">
                                		<col width="15%">
                               		</colgroup>
                                    <thead>
                                        <tr>
                                            <th>seq</th>
                                            <th>내용</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>처리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${boardList}" var="boardList">
			                            <tr>
			                            	<td>${boardList.seq}
			                                <td>
			                                	<a href="/detail?userId=${boardList.userId}&communityNo=${boardList.communityNo}">
				                                	<c:choose>
				                                		<c:when test="${boardList.category eq '공지'}"> 
				                                			<span class="notice">[${boardList.category}]</span>
				                                		</c:when>
				                                		<c:when test="${boardList.category eq '일반'}"> 
				                                			<span class="nomal">[${boardList.category}]</span>
				                                		</c:when>
				                                	</c:choose>
				                                	${boardList.title}
			                                	</a>
			                                </td>
			                                <td>${boardList.userName}</td>
			                                <td>${boardList.reg_date}</td>
			                                <td>
			                                	<button type="button" class="btn btn-danger" style="height: 30px; font-size: x-small; position: relative;" onclick="deleteCommunity('${boardList.userId}', '${boardList.communityNo}')">
													<i class="fa fa-pencil"></i>&nbsp; 삭제 
												</button>
												<c:if test="${boardList.mark != 'y'}">
			                                	<button type="button" class="btn btn-success" style="height: 30px; font-size: x-small; position: relative;" onclick="updateMark('${boardList.userId}', '${boardList.communityNo}')">
													<i class="fa fa-pencil"></i>&nbsp; 인증마크등록 
												</button>
												</c:if>
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
        });
        
        function editPage() {
        	window.location.href = "/edit?userId=0&communityNo=0";
        }
        
        function deleteCommunity(userId, communityNo) {
        	if(confirm("삭제하시겠습니까?")){
        		window.location.href = "/delete?userId=" + userId +"&communityNo=" + communityNo;
        	}
        }
        
        function updateMark(userId, communityNo) {
        	if(confirm("인증마크를 부여하시겠습니까?")){
        		window.location.href = "/updateMark?userId=" + userId +"&communityNo=" + communityNo;
        	}
        }
  	</script>
</body>
</html>