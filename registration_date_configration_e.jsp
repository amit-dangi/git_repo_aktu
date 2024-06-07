<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"href="../resources//bootstrap/css/bootstrap.min.css"type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
<link rel="stylesheet" href="../resources/sits/timepicker/bootstrap-timepicker.css" type="text/css">
<script type="text/javascript" src="../resources/sits/timepicker/bootstrap-timepicker.js"></script>

<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />


</head>
	<script>
	  $( document ).ready(function(){  
	    	 
	    	 $(".XFDATE1").datepicker({
	    	        format: 'dd/mm/yyyy',
	    	        autoclose: true,
	    	    }).on('click', function () {
	    	        $(".XFDATE1").datepicker("setDate", '');
	    	    }).on('clearDate', function (selected) {
	    	    });
	    	 
	    	 $("#XTDATE1").datepicker({
	    	        format: 'dd/mm/yyyy',
	    	        autoclose: true,
	    	    }).on('click', function () {
	    	        $("#XTDATE1").datepicker("setDate", '');
	    	    }).on('clearDate', function (selected) {
	    	    });
	    	
	    	});
	  </script>
	  <script>
	$(document).ready(function() {
		
		$('#totime').timepicker({
			local : 'LT',
			showMeridian : false,
			defaultTime : false,
			sideBySide: true,
		});
 
		$('#xtotime').timepicker({
			local : 'LT',
			showMeridian : false,
			defaultTime : false,
			sideBySide: true,
		});	
	});
</script>
		<body>
			<div class="container-fluid">
				<div id="ftitleHeader" class="page-header">
					<h4>Registration Date Configuration
					<span style="float:right">
			<a href="" data-toggle="modal" data-target=".recomond-btn" style="text-decoration:none;">
				<span>Advance Search</span>
	 			<i class="fa fa-search"></i>
	  		</a>
		</span> 
					</h4>
			</div>
			<form class="form-horizontal" name="relationMaster" action=""
				method="post" autocomplete="off">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title text-right" id="frmstatus">New Record</h3>
					</div>
					<div class="panel-body">
						<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Session</label>
								<div class="col-sm-4">
									<select id="" class="form-control">
										<option value="">Select Session</option>
										<option value="CL0002">2020</option>
										<option value="CL0003">2021</option>
										<option value="CL0004"></option>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Request Type</label>
								<div class="col-sm-4">
									<select id="" class="form-control">
										<option value="">Select Request Type</option>
										<option value="CL0002">New Affiliation</option>
										<option value="CL0003">Existing Affiliation</option>
										<option value="CL0004"></option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">From Date</label>
								<div class="col-sm-4">
									<div class="input-group date" id="">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control XFDATE1" id=""name="XFDATE1" aria-invalid="true" aria-required="true"required="required" placeholder="Enter Date" onclick="" onchange="" value="">
									</div>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">To Date</label>
								<div class="col-sm-4">
									<div class="input-group date" id="">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control XFDATE1" id=""name="XFDATE1" aria-invalid="true" aria-required="true"required="required" placeholder="Enter Date" onclick="" onchange="" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
		
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">From Time</label>
								<div class="col-sm-4">
									<div class="input-group bootstrap-timepicker timepicker">
			                       <div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
			                        <input readonly="readonly" data-field-id="9" type="text" class="form-control" placeholder="HH : MM"  id="totime" name="totime" name="shfrom" value="" >
			                  </div>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">To Time</label>
								<div class="col-sm-4">
									<div class="input-group bootstrap-timepicker timepicker">
			                       <div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
			                        <input readonly="readonly" data-field-id="9" type="text" class="form-control" placeholder="HH : MM"  id="xtotime" name="totime" name="shfrom" value="" >
			                  </div>
								</div>
							</div>
						</div>
					</div>
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-view" onclick="">Save</button>
							<button type="button" class="btn btn-view" onclick="">Reset</button>
		
						</div>
		
					</div>
				</div>
			</form>
			<form class="form-horizontal" name="frmRelationMastRep" id="frmRelationMastRep" action="" target="" method="post">
   <div class="modal fade recomond-btn" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
		<div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button></div>
			  		<div class="modal-body">
			   			<div class="panel panel-default">
                            <div class="panel-heading"><h3 class="panel-title  text-right">Searching Criteria</h3></div>
    					       <div class="panel-body">
			                     <div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Session</label>
								<div class="col-sm-4">
									<select id="" class="form-control">
										<option value="">Select Session</option>
										<option value="CL0002">2020</option>
										<option value="CL0003">2021</option>
										<option value="CL0004"></option>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Request Type</label>
								<div class="col-sm-4">
									<select id="" class="form-control">
										<option value="">Select Request Type</option>
										<option value="CL0002">New Affiliation</option>
										<option value="CL0003">Existing Affiliation</option>
										<option value="CL0004"></option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group m-t-25 m-b-5">
					<div class="col-md-12 text-center">
						<div class="row">
                            <button type="button" class="btn btn-view" data-dismiss="modal" onclick="vldSearch();">Search</button>
                             <button type="button" class="btn btn-view" onclick="resetForm();">Reset</button>
 						</div>
  					</div>
   				</div>
					
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>
					</form>
					
				<iframe class="embed-responsive-item" src="registration_configration_l.jsp" name="btmStockD" id="btmStockD"  onload="resizeIframe(this)" src="" frameborder="0" scrolling="no" width="100%" height=""></iframe>
			
		</div>
		
</body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
</html>