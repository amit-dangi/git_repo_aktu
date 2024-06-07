<!DOCTYPE html> 
<html lang="en">
<head>
<meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
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
	 <body onload="xgetAdmisssionCategory('${singleDocument.getADM_CAT()}');">
		 <div class="container-fluid">
			<div class="page-header" id=" ">
				<div class="row">
					<div class="col-sm-12">
						<h4>Document Master</h4>
					</div>
				</div>
			</div>
   <form class="form-horizontal" name="frmDocMast" id="frmDocMast" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right" >Searching Criteria</h3>
				</div>
				 
	   <div class="panel-body">
	    <div><br></div>
		   <div class="form-group">
		      <div class="col-md-12">
		         <div class="row">
		         	 <label class="col-sm-2 col-form-label" for="">Document Name</label>
						 <div class="col-sm-4">
				    		 <input type ="text" class="form-control" id="docName" name="docName" maxlength="45" placeholder="Enter Document Name">
				        </div>
				        <label class="col-sm-2 col-form-label" for="">Is Undertaking Allowed</label>						 
						<div class="col-sm-4">   	   	                    
   	   	                	<select class="form-control" id="isUndertakingAllowed" name="isUndertakingAllowed" >
								<option value="">Select Is Undertaking Allowed</option>
				   			 	<option value="Y">Yes </option>
							   	<option value="N">No</option> 
				            </select> 
   	     	    	    </div>				          
					</div>
		        </div>
		    </div>
		    
		    
		    <div class="form-group">
		      <div class="col-md-12">
		         <div class="row">
		         	 <label class="col-sm-2 col-form-label" for="">Is Compulsory</label>						 
						<div class="col-sm-4">   	   	                    
   	   	                	<select class="form-control" id="isMandatory" name="isMandatory" >
								<option value="">Select Is Compulsory</option>
				   			 	<option value="Y">Yes </option>
							   	<option value="N">No</option> 
				            </select> 
   	     	    	    </div>
   	     	    	   <label class="col-sm-2 col-form-label" for="">Is Active</label>
						    <div class="col-sm-4">
   	   	                    <!-- <input type="checkbox" id="isActive" name="isActive" value=""> -->
   	   	                     <select class="form-control" id="isActive" name="isActive" >
								 <option value="">Select Is Active</option>
				   				 <option value="Y">Yes </option>
							     <option value="N">No</option> 
				            </select> 
   	     	              </div>
					</div>
		        </div>
		    </div>
		     <div class="form-group">
		      <div class="col-md-12">
		         <div class="row">	
		        	<label class="col-sm-2 col-form-label" for="">Admission Category</label>
			  			<div class="col-sm-4">
							<select class="form-control acdCat" id="XADM_CAT" name="XADM_CAT">
								<option value="">Select Academic Category</option>											
							</select>
			     		</div>
		           	 
					</div>
		        </div>
		    </div>
	   <div class="form-group m-t-25 m-b-5">
			<div class="col-md-12 text-center">
		 	 <div class="row">
	            <button type="button" class="btn btn-view" id="btnSearch" name="btnSearch" onclick="recordSearch();" >Search</button>
	            <button type="button" class="btn btn-view" id="btnNew" name="btnSearch" onclick="" >New</button>
				<button type="button" class="btn btn-view" id="vldReset" onClick="window.location.reload();" >Reset</button>
	          </div>
	      </div>
	    </div>
	  </div>
	 </div>
	   </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" name="btmfrmDocMast" id="btmfrmDocMast" width="100%;"  height="" src="" frameborder="0" onload="resizeIframe(this)" scrolling="no" style="overflow-y: hidden;">
	  </iframe>   
  </div> <!-- End container-fluid -->
  </body>
  <script type="text/javascript">
  function resizeIframe(iframe) {
	    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
	    window.requestAnimationFrame(() => resizeIframe(iframe));
	}
  </script>
</html>
    