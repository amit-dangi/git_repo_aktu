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
<script type="text/javascript" src="../resources/js/affiliation/inspection-by-registrar.js"></script>
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
 /* #paneltable {
  position: relative;
  overflow: hidden;
  width: 100%;
  padding-top: 56.25%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
} */
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
<script type="text/javascript">
	
	//script for form call in pdf through jasper
		
		var tibcoserverUrl = '<%=General.checknull(ReadProps.getkeyValue("jasper.url", "sitsResource")) %>';
		var tibcoserverUsername='<%=General.checknull(ReadProps.getkeyValue("jasper.username", "sitsResource")) %>';
		var tibcoserverPassword ='<%=General.checknull(ReadProps.getkeyValue("jasper.password", "sitsResource")) %>';
		var folder_name ='<%=General.checknull(ReadProps.getkeyValue("jasper.report_folder_name", "sitsResource")) %>';
		var jaspername='affiliation_request_main_report';

	function downloadJasperReport(Inst_Id)
	{
		
			if(Inst_Id==""){
			   var Inst_Id= $("#selectedApplication").val();
			}
			
		    var session= $("#session_id").val();
			$("#jasperdiv").show();
		  	var downloadtype="pdf";
			var validstatus='';
			var url=tibcoserverUrl+"?flowId=viewReportFlow&_flowId=viewReportFlow&ParentFolderUri=%2Freports&reportUnit="+folder_name
						 		+jaspername+"&j_password="+tibcoserverPassword+"&standAlone=true&validflag="+validstatus+"&output="+downloadtype+"&j_username="+tibcoserverUsername
						 		+"&Inst_Id="+Inst_Id+"&001Q1=CR1120001412&session="+session;
			console.log("JasperUrl>>>>>>");
			console.log(url);
			 window.open(url);
			/* document.getElementById("myFrame").src = url;
			  $('html, body').animate({
			         scrollTop: $(".containerjasper").offset().top
			     }, 2000); */
	}
</script>

<body >
<div class="container-fluid">
  <div id="" class="page-header"><h4>Inspection by Registrar for Granted Applications</h4></div>
 <form class="form-horizontal" name="myform" id="myform" action="" method="post" autocomplete="off">
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
							<label class="col-sm-2 col-form-label" for="">Mobile No.</label>
							  <div class="col-sm-4">
								<input type="text" class="form-control" id="mobile_no" name="mobile_no" placeholder="Enter Mobile No.">
						     </div>
						   <label class="col-sm-2 col-form-label " for="">Email ID</label>
							  <div class="col-sm-4">
								 <input type="text" class="form-control" id="email_id" name="email_id" placeholder="Enter Email ID">
						      </div>
					     </div>
				   </div>
				</div>
			 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label" for="">Assigned From Date</label>
							<div class="col-sm-4">
								<div class="input-group date" id="msg-XTODATE">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input readonly="readonly" data-field-id=" " type="text"
										class="form-control datecalendar from_date" id="XTODATE"
										name="XTODATE" placeholder="DD/MM/YYYY" value="">
								  </div>
							</div>
							<label class="col-sm-2 col-form-label required-field" for=""> Assigned To Date</label>
							 <div class="col-sm-4">
								<div class="input-group date" id="msg-XFROMDATE">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input readonly="readonly" data-field-id=" " type="text"
										class="form-control datecalendar" id="XFROMDATE"
										name="XFROMDATE" placeholder="DD/MM/YYYY" value="">
								  </div>
							</div>
					   </div>
				   </div>
				</div>
				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="" onClick="getApplicationDetail()">Search</button>
					<button type="button" class="btn btn-view" id="btnReset" onClick="">Reset</button> 
				</div>
				
			<div class="form-group" id="headerdiv" style="display: none;">
				<div class="col-md-12">
					<div class="page-header-1">
		    			<div class="repTitle">List of Application(s)</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" style="display: none;">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Session</th>
								<th class="text-center">Reg No.</th>
								<th class="text-center">Institute Name</th>
								<th class="text-center">Mobile No.</th>
								<th class="text-center">Email ID</th>
								<th class="text-center">View Application</th>
								<th class="text-center">Assigned Panel</th>
								<th class="text-center">Action</th>
								
							<tr>
						</thead>	
						<tbody id="stable">
						<!-- Defined in js -->
						</tbody>
					</table>
				  </div>
				</div> 
			  
				
			    <div id="paneltable"  class="col-md-12" style="padding: 0px; display:none;" >
			     <div class="panel panel-default">
					<div class="panel-body" >
								<!-- -------------------------------Write content inside this view part------------------------------------------- -->
					<div class="col-md-12 p-0">
		    			<div class="view-data" >Administrative Inspection : (<span id="Xinst_name" class=""></span>)</div>
					</div>
					
					 
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" ">
						<thead>
							<tr>
								<th style="text-align:center; width:10%;">Committee Member (Inspection Submitted by)</th>
								<th style="text-align:center; width:10%;">Submitted Application (By Convener)</th>
								<th style="text-align:center; width:8%;">Remarks (By Convener )</th>
								<th style="text-align:center; width:8%;">Recommendation (By Convener)</th>
							<tr>
						</thead>	
						<tbody id="Dtable">
						</tbody>
					</table>
				  </div>
				</div> 
				
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label text-right required-field"  for="">Feedback by Registrar</label>
							  <div class="col-sm-10">
							<textarea class="" id="remarks" value="" style="height: 80px;width: 100%;resize:vertical;max-height:120px;" maxlength="299"></textarea>
						     </div>
					   </div>
				   </div>
				</div>
					<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label text-right required-field" for="">Remarks</label>
							  <div class="col-sm-10">
								<textarea class="" id="Recommendation" value="" style="height: 80px;width: 100%; resize:vertical;max-height:120px;" maxlength="299"></textarea>
						     </div>
					   </div>
				   </div>
				</div>
					<!-- -------------------------------End Here (Write content inside this view part)------------------------------------------- -->
			    </div>
			  </div>
			 </div>
			 
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
				
			  <div class="col-md-12 text-center m-t-20" id="showbtn" style="padding: 0px; display:none;">
			  		<button type="button" class="btn btn-view btnSave" id="btnSave" onClick="Save('Y')">Application Accepted & transfer to Government Body</button>
					<button type="button" class="btn btn-view btnSave" id="btnSave" onClick="Save('N')">Application Rejected</button>
					<button type="button" class="btn btn-view btnFinalSave" id="btnFinalSave" onClick="Save('Y')">Final submit approval & share acknowledgement to college</button>
					<button type="button" class="btn btn-view" id="rstBtn" onClick="Resetbtn();">Reset</button> 
				<input type="hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>"/>
		        <input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>">
				<input type="hidden" id="selectedApplication" value=""/>
				<input type="hidden" id="user_status" value="<%=user_status%>"/>
				</div>
				
		</div> <!-- End of panal body -->
	</div> <!-- End of panal default -->
   </form>
    <iframe class="containerframe" onload="resizeIframe(this)" src="" name="InspectionDetailViewFrame" id="InspectionDetailViewFrame" frameborder="0" scrolling="no" width="100%" height=""></iframe>
  <!-- <div class="containerjasper" id="jasperdiv" style="display:none;">
	<iframe id="myFrame"  src="" onload="resizeIframe(this)"  class="responsive-iframe"  width="100%" height="" title="Iframe Example"></iframe>
	</div> -->
  </div>
</body>
</html>