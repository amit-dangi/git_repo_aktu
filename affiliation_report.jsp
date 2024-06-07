<!-- @Author Amit danGi -->
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@include file="../myCks.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"  type="text/css"> 
    <script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" 	src="../resources/js/affiliation/affiliation_report.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css" type="text/css">
   
<style>
.manageTxt {
	width: 100%;
	border-radius: 9px;
	margin-bottom: 15px;
}

.manageTxt1 {
	padding-top: 2px !important;
	margin-bottom: 23px;
}

@media screen and (min-width: 500px) {
        .modal-lg1 {
          width: 500px; /* New width for large modal */
        }
    }
    
    .modal-header1 .close1 {
	    margin-top: -40px;
	    margin-right: 10px;
	    color: red;
	}
.close {
    opacity: 1 !important;
    color: red !important;
    padding-right: 10px;
}
</style>
<script type="text/javascript">
   $(document).ready(function() { 
		$("#XFROMDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		 	todayHighlight : true,
		}).on('click', function() {
			$("#XFROMDATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
		$("#XTODATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			todayHighlight : true,
		}).on('click', function() {
			$("#XTODATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
	});

 function resetForm() {
		location.reload();
}
</script>
</head>
<%  
	String OPT_VALUE = "",req_name="";
	String OPT_TYPE = General.checknull(request.getParameter("fstatus"));
 	String viewStatus = General.checknull(request.getParameter("viewStatus"));
%>
<body onload="getAcademicSession('<%=session_id%>');">
<div class="container-fluid">
	<div id="ftitleHeader" class="page-header">
		<h4>Affiliation Detail Report
		</h4>
	</div>
	

	<form class="form-horizontal" name="frmNewAffiReportd" id="frmNewAffiReportd" method="post" autocomplete="off">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-right"><%=OPT_VALUE %></h3>
			</div>
		
		<div class="panel-body">
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label for="" class="col-sm-2 col-form-label required-field">Session</label>
								<div class="col-sm-4">
									<select id="session_id" name="session_id" class="form-control">
										<option value="">Select Session</option>
									</select>
								</div>
							<label for="" class="col-sm-2 col-form-label required-field">Request Type</label>
								<div class="col-sm-4">
									<select id="req_id" name="req_id"class="form-control">
										<option value="">Select Request Type</option>
										  <%=QueryUtil.getComboOption("af_request_type", "req_id", "req_desc ",req_name, "", "req_desc") %>
										  <option value="RT0000">New (Registered Offline)</option>
									</select>
								</div>
					   </div>
				   </div>
				</div>
				<!-- <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label" for="">Type of Registration</label>
							<div class="col-sm-4">
								<select class="form-control" id="reg_type" name="reg_type">
									<option value="">Select Request Type</option>
									<option value="I">Institution</option>
									<option value="S">Society</option>
									<option value="T">Trust</option>
									<option value="C">Company</option>
									
								</select>
						     </div>
							<label class="col-sm-2 col-form-label" for="">Status</label>
							  <div class="col-sm-4">
								<select class="form-control" id="app_status" name="app_status">
									<option value="">Select Status</option>
									<option value="A">Approved</option>
									<option value="R">Reject</option>
								</select>
						     </div>
					   </div>
				   </div>
				</div> -->
 				 
				<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage1" id="errMsg1"></div>
					</div>
				</div>
					<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage2" id="errMsg2"></div>
					</div>
					</div>

				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="" onClick="vldSearch()">Search</button>
					<button type="button" class="btn btn-view" id="" onClick="resetForm();">Reset</button> 
				</div>
			</div>
			<!-- End panel-body -->
		</div>
			<!-- End panel-default -->
	<input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>">
	<iframe class="embed-responsive-item" name="btmfrmNewAffiRequestReportL" onload="resizeIframe(this)"id="btmfrmNewAffiRequestReportL" width="100%;" height=""src="affiliation_report_l.jsp" frameborder="0"scrolling="no"></iframe>
		</form>
	</div>

</body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
<script src="../assets/datepicker/bootstrap-datepicker.js"></script>
</html>
