<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../myCks.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"href="../resources/bootstrap/css/bootstrap.min.css"type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/consolidate-inspection-committee-statusreport.js"></script>
<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />


</head>
<style>
 .close {
    opacity: 1 !important;
    color: red !important;
}
.view-data{
	font-size: 15px;
    font-weight: bold;
    color: #0c426f !important;
    float: left;
    margin: 9px 0px;
    /* text-decoration: underline; */
}
.p-0{
	padding: 0px;
}
</style>
<style>
 .l-title{font-family: 'Poppins',sans-serif !important;font-size:13px;color:#4a3a3a;}
 .containerjasper {
  position: relative;
  overflow: hidden;
  width: 100%;
  padding-top: 56.25%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
}

/* Then style the iframe to fit in the container div with full height and width */
.responsive-iframe {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
}
.close {
    opacity: 1 !important;
    color: red !important;
}
.p-0{
	padding: 0px;
}
 #paneltable {
  position: relative;
  overflow: hidden;
  width: 100%;
  padding-top: 56.25%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
}
</style>
<script>
	$(document).ready(function() {
		$("#XFROMDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			endDate:'+0d',
		}).on('click', function() {
			$("#XFROMDATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
		$("#XTODATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			endDate:'+0d',
		}).on('click', function() {
			$("#XTODATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
	});
</script>

<body >
<div class="container-fluid">
  <div id="" class="page-header"><h4>Consolidate Inspection Committee Status Report</h4></div>
 <form class="form-horizontal" name="consolidateinspectionreportD" id="consolidateinspectionreportD" action="" method="post" autocomplete="off">
  <div class="panel panel-default">
   <div class="panel-heading"><h3 class="panel-title text-right">New Record</h3></div>
	<div class="panel-body">
			<div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label required-field" for="">Session</label>
							<div class="col-sm-4">
								<select class="form-control" id="session_id" name="session_id">
									<option value="">Select Session</option>
								</select>
						     </div>
							<label class="col-sm-2 col-form-label" for="">Institute Name</label>
							  <div class="col-sm-4">
								 <input type="text" class="form-control" id="inst_name" name="inst_name" placeholder="Enter Institute Name">
						     </div>
					   </div>
				   </div>
				</div>
 				 
				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label" for="">Registration Id.</label>
							  <div class="col-sm-4">
								<input type="text" class="form-control" id="reg_no" name="reg_no" placeholder="Enter Reg Id.">
						     </div>
						   <label class="col-sm-2 col-form-label " for="">Status</label>
							  <div class="col-sm-4">
							  <select id="final_status" name="final_status" class="form-control">
							  <option value="">All</option>
							  <option value="Pending">Pending</option>
							  <option value="ReOpen">ReOpen</option>
							  <option value="Granted">Granted</option>
							  </select>
						      </div>
					     </div>
				   </div>
				</div>
				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="" onClick="getApplicationDetail()">Search</button>
					<button type="button" class="btn btn-view" id="btnReset" onClick="">Reset</button> 
				</div>
				
				<input type="hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>"/>
		        <input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>">
				<input type="hidden" id="selectedApplication" value=""/>
				<input type="hidden" id="user_status" value="<%=user_status%>"/>
				
		</div> <!-- End of panal body -->
	</div> <!-- End of panal default -->
	
   </form>
    <iframe class="containerframe" onload="resizeIframe(this)" src="" name="consolidateinspectionreportL" id=""consolidateinspectionreportL"" frameborder="0" scrolling="no" width="100%" height=""></iframe>
  </div>
</body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
</html>