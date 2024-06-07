<%@page import="com.sits.general.ApplicationConstants"%>
<%@include file="../myCks.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />
  <title></title>
  
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
	<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
	
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="../resources/js/affiliation/pending-payment-verification.js"></script>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>
	
</head>
  <script>
	$(document).ready(function() {
		$("#XFROMDATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			orientation: 'top',
			todayHighlight: true,
		});
		$("#XTODATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			orientation: 'top',
			todayHighlight: true,
		});
	});
</script>
<body>
<div class="container-fluid">	
	<div class="page-header" id="ftitleHeader">
		<div class="row">
			<div class="col-sm-12"><h4>Pending Payment Verification</h4></div>
		</div>
	</div>	
	<form class="form-horizontal" name="pendingpaymentd" id="pendingpaymentd" action="" method="post" autocomplete="off">
	<div class="panel panel-default">
		<div class="panel-heading" ><h3 class="panel-title text-right"><%=ApplicationConstants.SEARCH %></h3></div>		
		<div class="panel-body">
		 		<div class="form-group">
					<div class="col-md-12">
						<div class="row">
						<label for="from_date" class="col-sm-2 col-form-label">Application Submitted From Date </label>
						   <div class="col-sm-4">
							<div class="input-group date" id="msg-XFROMDATE">
								<div class="input-group-addon"><i class="fa fa-calendar"></i>
								</div>
								<input readonly="readonly" data-field-id=" " type="text"
									class="form-control datecalendar from_date" id="XFROMDATE"
									name="XFROMDATE" placeholder="DD/MM/YYYY" value="">
							</div>
						</div>
						<label for="from_date" class="col-sm-2 col-form-label">Application Submitted To Date </label>
						  <div class="col-sm-4">
							<div class="input-group date" id="msg-XTODATE">
								<div class="input-group-addon"><i class="fa fa-calendar"></i>
								</div>
								<input readonly="readonly" data-field-id=" " type="text"
									class="form-control datecalendar from_date" id="XTODATE"
									name="XTODATE" placeholder="DD/MM/YYYY" value="">
							</div>
						</div>
					   </div>
				   </div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label" for="">Registration No</label>
							<div class="col-sm-4" >
							<input  type="text"  autocomplete="off" class="form-control" id="regno" name="regno" 
							placeholder="Enter Registration No" value=""/>  
							</div>
							<label class="col-sm-2 col-form-label required-field" for="">Payment Type</label>
							<div class="col-sm-4" >
								<select class="form-control" id="type" name="type">
									<option value="">Select Payment Type</option>
									<option value="R">Registration Payment</option>
									<option value="S">Sub Request Payment</option>
								</select>
							</div>
					   </div>
				   </div>
				</div>
				
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Payment Type</label>
							<div class="col-sm-4" >
								<select class="form-control" id="payment_status" name="payment_status">
									<option value="">All</option>
									<option value="paid">Payment Paid</option>
									<option value="created">Created</option>
									<option value="attempted">Attempted</option>
								</select>
							</div>
					   </div>
				   </div>
				</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="errmessage text-center" id="errMsg"></div>
				</div>
			</div>
			<div class="form-group m-t-25 m-b-5">
			  <div class="col-md-12 text-center">
			    <div class="row">
			    <button type='button' class='btn btn-view' id="btnView" >View</button>
				 <button type="button" class="btn btn-view" id="btnReset">Reset</button>
   			  </div>
   			</div>
   			</div>
   		
		</div><!-- End panel-body -->
	  </div><!-- End panel-default -->
	</form> 
	<iframe class="embed-responsive-item" onload="resizeIframe(this)" name="iframdoubleverification" id="iframdoubleverification" src="" scrolling="no"  frameborder="0" width="100%" height=""></iframe>
</div><!-- End container-fluid -->
</body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
</html>