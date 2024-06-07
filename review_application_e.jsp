<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
<script type="text/javascript" src="../resources/js/affiliation/review-application.js"></script>
<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">

<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />


</head>
<style>
 .l-title{font-family: 'Poppins',sans-serif !important;font-size:13px;color:#4a3a3a;}
 .containerjasper {
  position: relative;
  overflow: hidden;
  width: 100%;
  padding-top: 56.25%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
}

 #Detailsdiv {
  position: relative;
  overflow: hidden;
  width: 100%;
 /*  padding-top: 56.25%; */ /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
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
.view-data{
	font-size: 15px;
    font-weight: bold;
    color: #0c426f !important;
    float: left;
    margin: 9px 0px;
    text-decoration: underline;
}
.p-0{
	padding: 0px;
}
</style>
<script>
	$(document).ready(function() {
		$("#XFROMDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			endDate:'+1d',
		}).on('click', function() {
			$("#XFROMDATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
		$("#XTODATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			endDate:'+1d',
		}).on('click', function() {
			$("#XTODATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
		$("#XPDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			endDate:'+1d',
		}).on('click', function() {
			$("#XPDATE").datepicker("setDate", '');
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

		function downloadJasperReport(Inst_Id,REG_FOR_NAME)
		{debugger;
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
				
				/* const proxyUrl = 'https://cors-anywhere.herokuapp.com/' + url;
				            fetch(proxyUrl)
				                .then(response => response.blob())
				                .then(blob => {
				                    const link = document.createElement('a');
				                    link.href = window.URL.createObjectURL(blob);
				                    link.download = REG_FOR_NAME;
				                    document.body.appendChild(link);
				                    link.click();
				                    document.body.removeChild(link);
				                })
				                .catch(error => console.error('Error downloading the PDF:', error));  */

			/* 	 document.getElementById("myFrame").src = url;
				  $('html, body').animate({
				         scrollTop: $(".containerjasper").offset().top
				     }, 2000);  */
		}
</script>
 
<%
session.setAttribute("AESUniqueKey","suspl@aktu");
%>
<body >
<div class="container-fluid">
  <div id="" class="page-header"><h4>Review Application and Assign for Inspection</h4></div>
 <form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off">
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
						 <label class="col-sm-2 col-form-label" for="">Payment From Date</label>
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
							<label class="col-sm-2 col-form-label" for="">Payment To Date</label>
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
					<button type="button" class="btn btn-view" id="btnReset" onClick="btnReset();">Reset</button> 
				</div>
			<div class="form-group" id="searchTableHeader" style="display: none;">
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
								<th class="text-center">Application Submit Date</th>
								<th class="text-center">Session</th>
								<th class="text-center">Reg No.</th>
								<th class="text-center">Institute Name</th>
								<th class="text-center">Mobile No.</th>
								<th class="text-center">Email ID</th>
								<th class="text-center">View Application</th>
								<th class="text-center">Download Document(s)</th>
								<th class="text-center">Assigned For Inspection</th>
								
							<tr>
						</thead>	
						<tbody id="stable">
						<!-- Defined in js -->
						</tbody>
					</table>
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
				
			   
								<!-- -------------------------------Write content inside this view part------------------------------------------- -->
				<div id="Detailsdiv" style="display: none;">	 
				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label" for="">Session</label>
							<div class="col-sm-4">
							 <input type="text" class="form-control" disabled id="Xsession" name="Xsession" value="">
						     </div>
							<label class="col-sm-2 col-form-label" for="">Institute Name</label>
							  <div class="col-sm-4">
								 <input type="text" class="form-control" disabled id="Xinst_name" name="Xinst_name" value="">
						     </div>
					   </div>
				   </div>
				</div>
 				 
 				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label" for="">Mobile No.</label>
							<div class="col-sm-4">
								 <input type="text" class="form-control" disabled id="Xmobile_no" name="Xmobile_no" value="">
						     </div>
							<label class="col-sm-2 col-form-label" for="">Email ID</label>
							  <div class="col-sm-4">
								 <input type="text" class="form-control" disabled id="Xemail_id" name="Xemail_id" value="">
						     </div>
					   </div>
				   </div>
				</div>
 				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						<label class="col-sm-2 col-form-label" for="">View Payment</label>
							<div class="col-sm-4">
							<a href="javscript:void(0)" style="text-decoration: underline;padding-left:0px;padding-right:0px; cursor: pointer;" onclick="getReport('paymentdetails');"><b>View Payment Details</b></a>
							 </div>
							<label class="col-sm-2 col-form-label" for="">View Application</label>
							  <div class="col-sm-4">
								<a onclick="downloadJasperReport('');" style="text-decoration: underline;cursor: pointer;" ><b>Click Here to View</b></a>
						     </div>
					   </div>
				   </div>
				</div>
 				 
 				  <div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label required-field" for="">Select Panel</label>
							<div class="col-sm-3">
								<select class="form-control" id="panel_id" name="panel_id" >
									<option value="">Select Panel</option>
									<%=QueryUtil.getComboOption("af_approv_pannel_mast", "panel_id", "panel_name", "", "isActive='Y'", "panel_name") %>
								</select>
						     </div>
						     <a href="javscript:void(0)"   class="col-sm-1 col-from-label" style="text-decoration: underline;padding-left:0px;padding-right:0px;cursor: pointer; " onclick="getReport();"><b>View Member </b></a>
							<label class="col-sm-2 col-form-label" for="">Remarks</label>
							  <div class="col-sm-4">
								 <textarea class="" id="remarks" maxlength="250" style="height: 80px;width: 100%;resize:vertical;max-height:120px;"></textarea>
						     </div>
					   </div>
				   </div>
				</div>
				
				
				<input type="hidden" id="selectedApplication" value=""/>
				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="btnSave" onClick="vldSave()">Save</button>
					<button type="button" class="btn btn-view" id="btnReset" onClick="btnReset();">Reset</button> 
				</div>
				
				</div>
				 
					<!-- -------------------------------End Here (Write content inside this view part)------------------------------------------- -->
			    
			  
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

				<input type="hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>"/>
		        <input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>">
		</div> <!-- End of panal body -->
	</div> <!-- End of panal default -->
   </form>
   
   <form class="form-horizontal" name="NocApprovall" id="NocApprovall" method="post" autocomplete="off">
	<div class="modal fade recomond-btn" id="reportDiolog" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true" style="margin-top: -24px;">
		<div class="modal-dialog modal-lg1" style="width: 1000px !important;">
			<div class="modal-content">
				<div class="modal-header1 text-center">
					<span class="close" data-dismiss="modal" aria-label="Close close-cross"  aria-hidden="true" style="margin-top: 0px !important;">&times;</span>
					<h4 class="modal-title"></h4>
				</div>				
				<div class="modal-body" style="height: 450px; overflow: scroll;"> <!--Start Modal Body-->
				<div id="showframe"></div>
				</div>
			</div>
		</div>
	</div> 
	</form>
<!--     <div class="containerjasper" id="jasperdiv" style="display:none;">
	<iframe id="myFrame"  src="" onload="resizeIframe(this)"  class="responsive-iframe"  width="100%" height="" title="Iframe Example"></iframe>
	</div> -->
	
  </div>
</body>
</html>