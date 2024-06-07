<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet"href="../resources//bootstrap/css/bootstrap.min.css"type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
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
</style>
<body >
<div class="container-fluid">
  <div id="" class="page-header"><h4>Manage Request Type Sub Type
    <span style="float:right">
	  <a href="" data-toggle="modal" data-target=".recomond-btn" style="text-decoration:none;"> <span>Advance Search</span>
	 	<i class="fa fa-search"></i>
	  </a>
	 </span>
	  </h4>
   </div>
 <form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off">
  <div class="panel panel-default">
   <div class="panel-heading"><h3 class="panel-title text-right">New Record</h3></div>
	<div class="panel-body">
			<div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label required-field" for="">Request Type</label>
							<div class="col-sm-4">
								<select class="form-control" id="" name="">
									<option value="">Select Request Type</option>
									<option value="">New Affiliation</option>
									<option value="">Existing Affiliation</option>
								</select>
						     </div>
							<label class="col-sm-2 col-form-label required-field" for="">Request Sub Type</label>
							  <div class="col-sm-4">
								<input type="text" class="form-control" id="" name="" placeholder="Enter Request Sub Type">
						     </div>
					   </div>
				   </div>
				</div>
 				 
				 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Display Order</label>
							  <div class="col-sm-4">
								<input type="text" class="form-control" id="" name="" placeholder="Enter Display Order">
						     </div>
						   <label class="col-sm-2 col-form-label " for="">Is Active</label>
							  <div class="col-sm-4">
								 <input type="checkbox" class="" id="" value="">
						      </div>
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

				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="" onClick="vldSave()">Save</button>
					<button type="button" class="btn btn-view" id="" onClick="btnReset();">Reset</button> 
				</div>
		</div> <!-- End of panal body -->
	</div> <!-- End of panal default -->
	</form>
  <form class="form-horizontal" name="frmRoleD" id="frmRoleD"  method="post" autocomplete="off" >
    <div class="modal fade recomond-btn" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>

			  <div class="modal-body">
			   <div class="panel panel-default">
                <div class="panel-heading"><h3 class="panel-title text-right">Searching Criteria</h3></div>
     			<div class="panel-body">
								<!-- -------------------------------Write content inside this modal------------------------------------------- -->
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label required-field" for="">Request Type</label>
								<div class="col-sm-4">
									<select class="form-control" id="" name="">
										<option value="">Select Request Type</option>
										<option value="">New Affiliation</option>
										<option value="">Existing Affiliation</option>
									</select>
							     </div>
								<label class="col-sm-2 col-form-label required-field" for="">Request Sub Type</label>
								  <div class="col-sm-4">
									<input type="text" class="form-control" id="" name="" placeholder="Enter Request Sub Type">
							     </div>
						   </div>
					   </div>
					</div>
	 				 
					 <div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-2 col-form-label required-field" for="">Display Order</label>
								  <div class="col-sm-4">
									<input type="text" class="form-control" id="" name="" placeholder="Enter Display Order">
							     </div>
							   <label class="col-sm-2 col-form-label " for="">Is Active</label>
								  <div class="col-sm-4">
									<select class="form-control" id="" name="">
										<option value="">Select</option>
										<option value="">Yes</option>
										<option value="">No</option>
									</select>
							     </div>
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
					<div class="col-md-12 text-center m-t-20">
						<button type="button" class="btn btn-view" id="" data-dismiss="modal" onclick="">Search</button>
						<button type="button" class="btn btn-view" id="" onclick="">Reset</button>
				    </div>
					<!-- -------------------------------End Here (Write content inside this modal)------------------------------------------- -->
			  </div> <!-- End of panal body -->
			</div> <!-- End of panal default -->
		   </div> <!-- End of modal body -->
				 
		  </div> <!-- End of modal content -->
		</div> <!-- End of modal-dialog -->
	</div> <!-- End of modal class/id at which modal will be open -->
	</form>
<iframe class="embed-responsive-item" src="manage_request_type_sub_type_l.jsp" onload="resizeIframe(this)" id=""  name="" frameborder="0" scrolling="no" width="100%" height=""></iframe>
   </div>
</body>
<script>
function resizeIframe(iframe) {
  iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
  window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
</html>