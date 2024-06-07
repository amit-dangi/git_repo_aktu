<!DOCTYPE html> 
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.ApplicationConstants"%>
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
<script type="text/javascript" src="../resources/js/affiliation/affiliation-payment-details-report.js"></script>

<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
   
</head>
	 <body onload="">
		 <div class="container-fluid">
			<div class="page-header" id=" ">
				<div class="row">
					<div class="col-sm-12">
						<h4><%=ReadProps.getkeyValue("affi_payment_details_report.header","sitsResource") %></h4>
					</div>
				</div>
			</div>
   <form class="form-horizontal" name="frmAFPaymentDetailMast" id="frmAFPaymentDetailMast" method="post" autocomplete="off">
	  <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title text-right" ><%= ApplicationConstants.SEARCH %></h3>
				</div>
				 
	   <div class="panel-body">
	    <div><br></div>
	    
	    <div class="form-group">
		      <div class="col-md-12">
		         <div class="row">
		          <label class="col-sm-2 col-form-label" for="">Report Type</label>
						 <div class="col-sm-4">
				    		 <select class="form-control" id="report_type" name="report_type" Style="font-weight:bold;">
				    		 <option value="TR">Transaction Id Wise Detail Report</option>
				    		 <option value="FS">Final Submitted Status Detail Report</option>
				            </select> 
				        </div>
				        
				        <label class="col-sm-2 col-form-label" for="">Final Submit Status</label>
						 <div class="col-sm-4">
				    		 <select class="form-control" id="final_submit" name="final_submit" Style="font-weight:bold;">
				    		 <option value="">All</option>
				    		 <option value="Y">Yes</option>
				    		 <option value="N">No</option>
				            </select> 
				        </div>
					</div>
		        </div>
		    </div>
		    
		    
		   <div class="form-group">
		      <div class="col-md-12">
		         <div class="row">
		         	 <label class="col-sm-2 col-form-label" for="">College Name</label>
						 <div class="col-sm-4">
				    		 <select class="form-control" id="college_name" name="college_name" >
				    		 <option value="">All College</option>
								<%=QueryUtil.getComboOption("af_already_reg_clg_mast" , "InstituteCode", "concat(InstituteName,'(',InstituteCode,')')", "", "", "InstituteName") %>
				            </select> 
				        </div>
				        <label class="col-sm-2 col-form-label" for="">Request Name</label>						 
						<div class="col-sm-4">  
						 	   	                    
   	   	                	<select class="form-control" id="request_name" name="request_name" >
   	   	                		 <option value="">Select Request Name</option>
   	   	                			<%=QueryUtil.getComboOption("af_request_type" , "req_id", "req_desc", "", "", "req_desc") %> 
				            </select> 
   	     	    	    </div>				          
					</div>
		        </div>
		    </div>
		    
		    
		    <div class="form-group">
		      <div class="col-md-12">
		         <div class="row">
		         	 <label class="col-sm-2 col-form-label" for="">Sub Request Name</label>						 
						<div class="col-sm-4">   	   	                    
   	   	                	<select class="form-control" id="sub_req_name" name="sub_req_name" >
								<option value="">Select Sub Request</option>
   	   	                			<%=QueryUtil.getComboOption("af_manage_request_type_sub_type" , "MRT_ID", "sub_request_id", "", "", "sub_request_id") %>
				            </select> 
   	     	    	    </div>
					</div>
		        </div>
		    </div>
		   
	   <div class="form-group m-t-25 m-b-5">
			<div class="col-md-12 text-center">
		 	 <div class="row">
	            <button type="button" class="btn btn-view" id="btnSearch" name="btnSearch" onclick="vldSearch();" >Search</button>
				<button type="button" class="btn btn-view" id="vldReset" name="vldReset" onClick="" >Reset</button>
	          </div>
	      </div>
	    </div>
	  </div>
	 </div>
	   </form><!-- End panel-default -->
       <iframe class="embed-responsive-item" name="btmPaymentDetailMast" id="btmPaymentDetailMast" width="100%;"  height="" src="" frameborder="0" onload="resizeIframe(this)" scrolling="no" style="overflow-y: hidden;">
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
    