<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"href="../assets/sits/bootstrap/3.3.7/css/bootstrap.min.css"type="text/css">
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
.pd-lebel{
padding-right:0px !important;
padding-left:0px !important;
padding-top: 1px !important;;
}
.pd-link{padding-right:0px !important;

}

.accordion .card-header:after {
    font-family: 'FontAwesome';  
    content: "\f068";
    float: right; 
     color:#ffffff;
}
.accordion .card-header.collapsed:after {
    /* symbol for "collapsed" panels */
    content: "\f067"; 
    color:#ffffff;
}
.card-title{
font-family: Calibri, verdana,Arial, Helvetica, sans-serif;
    font-size: 13px;
    color: #ffffff;
    font-weight: bold;
}
	.boxAlign{
		margin: 5px 0 0 !important;
		margin-right: 5px !important;
	}
	.page-header-2 .repTitle {
    font-family: Calibri, verdana;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 0px;
    color: #720c01 !important;
    width: 100%;
    float: left;
}
.btn-view1 {
    border-color: #687DB4;
    font-size: 14px;
    /* box-shadow: 2px 2px 1px #336376; */
    color: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#16261d), color-stop(100%,#5c746b));
    box-shadow: 2px 2px 1px #07680a;
    background-image: -ms-linear-gradient(bottom, #336376 0%, #78B9D2 100%);
    filter: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#336376,endColorStr=#78B9D2);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#37983b), color-stop(100%,#395640));
    /* background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#336376), color-stop(100%,#78B9D2)); */
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    margin: 0px 4px;
}

</style>
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
<body>
<div class="container-fluid">
				<div id="ftitleHeader" class="page-header">
					<h4>Administrative Configuration</h4>
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
								<label for="" class="col-sm-2 col-form-label required-field">Institute Name</label>
								<div class="col-sm-4">
									 <input type="text" class="form-control" id="" name="" value="" placeholder="Enter Institute Name "> 
								</div>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
							<label for="" class="col-sm-2 col-form-label required-field">Assigned From Date</label>
								<div class="col-sm-4">
									<div class="input-group date" id="">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control XFDATE1" id=""name="XFDATE1" aria-invalid="true" aria-required="true"required="required" placeholder="Enter Date" onclick="" onchange="" value="">
									</div>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Assigned To Date</label>
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
					 
					 
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block; ;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Session</th>
								<th class="text-center">Institute Name</th>
								<th class="text-center">Mobile No</th>
								<th class="text-center">Email ID</th>
								<th class="text-center">Address</th>
								<th class="text-center">Start Inspection</th>
								<th class="text-center">Final Submit</th>
								<th class="text-center">Print</th>
							
							</tr>
						</thead>	
						<tbody>
			                <tr>
								<td style="text-align:center; width:5%;">1</td>
								<td style="text-align:center; width:8%;">2022-2023</td>
								<td style="text-align:center; width:8%;">J S S Academy</td>
								<td style="text-align:center; width:8%;">9656566677</td>
								<td style="text-align:center; width:8%;">jssacademy@gmail.com</td>
								<td style="text-align:center; width:8%;">Delhi</td>
								<td style="text-align:center; width:8%;"><a style="color:green;">Click here to View</a></td>
								<td style="text-align:center; width:8%;"><button type="button" class="btn btn-view1" style="background-color:#2c5e2c !important;">Submit</button></td>
								<td style="text-align:center; width:8%;"><button type="button" class="btn btn-view">Print</button></td>
								
							 </tr>
							  <tr>
								<td style="text-align:center; width:5%;">2</td>
								<td style="text-align:center; width:8%;">2022-2023</td>
								<td style="text-align:center; width:8%;">Amity University</td>
								<td style="text-align:center; width:8%;">9656560099</td>
								<td style="text-align:center; width:8%;">amitynoida@gmail.com</td>
								<td style="text-align:center; width:8%;">Noida</td>
								<td style="text-align:center; width:8%;"><a>Click here to View</a></td>
								<td style="text-align:center; width:8%;"><button type="button" class="btn btn-view">Submit</button></td>
								<td style="text-align:center; width:8%;"><button type="button" class="btn btn-view">Print</button></td>
								
							 </tr>
							 <tr>
								<td style="text-align:center; width:5%;">3</td>
								<td style="text-align:center; width:8%;">2022-2023</td>
								<td style="text-align:center; width:8%;">Sharda University</td>
								<td style="text-align:center; width:8%;">9656566677</td>
								<td style="text-align:center; width:8%;">shardauni@gmail.com</td>
								<td style="text-align:center; width:8%;">Delhi</td>
								<td style="text-align:center; width:8%;"><a>Click here to View</a></td>
								<td style="text-align:center; width:8%;"><button type="button" class="btn btn-view">Submit</button></td>
								<td style="text-align:center; width:8%;"><button type="button" class="btn btn-view">Print</button></td>
								
							 </tr>
						</tbody>
					</table>
				  </div>
				</div>
		
 
      <div class="panel-body"></div>
     <div id="accordionOne" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #624d1d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseOne">
                <a class="card-title">
                  Apply for Affiliation
                </a>
            </div>
            </div>
            <div id="collapseOne" class="panel-body collapse" data-parent="#accordionOne" >
             <div class="form-group" >
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Applicant Details From Society/Trust</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Name</th>
								<th class="text-center">Post</th>
								<th class="text-center">Designation</th>
								<th class="text-center">Is Applicant</th>
								<th class="text-center">Delete</th>
								
							</tr><tr>
						</tr></thead>	
						<tbody>
			                <tr>
								<td style="text-align:center; width:5%;">1</td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								
							 </tr>
						</tbody>
					</table>
				  </div>
				</div>
					<div class="form-group" >
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Affiliation Request</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Request Name</th>
								<th class="text-center">Sub Request Name</th>
								<th class="text-center">Applied on</th>
							</tr>
						</thead>	
						<tbody>
			                <tr>
								<td style="text-align:center; width:5%;">1</td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
							 </tr>
						</tbody>
					</table>
				  </div>
				</div>
				<div class="form-group" >
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Request for Intake Details</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Course Name</th>
								<th class="text-center">Branch Name</th>
								<th class="text-center">Shift</th>
								<th class="text-center">Request in AICTE</th>
								<th class="text-center">Request in COPCI</th>
								<th class="text-center">Request in University</th>
							</tr>
						</thead>	
						<tbody>
			                <tr>
								<td style="text-align:center; width:5%;">1</td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
							 </tr>
						</tbody>
					</table>
				  </div>
				</div>
			
            </div>
           </div>
           </div>
          
           
           
        </div>
    </div>    
        
        
        
        
        
   
     <div id="accordionTwo" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #624d1d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseTwo">
                <a class="card-title">
                   General Information
                </a>
            </div>
            </div>
            <div id="collapseTwo" class="panel-body collapse" data-parent="#accordionTwo" >
            <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
							<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Program Name</th>
								<th class="text-center">Program Type</th>
								<th class="text-center">Shift</th>
								<th class="text-center">Applied in University</th>
							</tr><tr>
						</tr></thead>	
						<tbody>
			                <tr>
								<td style="text-align:center; width:5%;">1</td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
								<td style="text-align:center; width:8%;"></td>
							 </tr>
						</tbody>
							</table>
						  </div>
					</div> 
			<hr class="subHead-hr">
			<!-- <div class="form-group" >
				<div class="col-md-12">
					<div class="page-header-2">
		    			<div class="repTitle ">Basic Detail(s)</div>
					</div>
				</div>
			</div>
			 -->
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Type of Registration :</label>
							<div class="col-sm-6">
								<select class="form-control" id="projtype" name="projtype">
									<option value="">Select Type</option>
								</select>
				           </div>
				       </div>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				          <label class="col-sm-5 col-form-label text-right" for="">Institute Type :</label>
							<div class="col-sm-6">
								<select class="form-control" id="erptype" name="erptype">
									<option value="">Select Type</option>
								</select>
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				           <label class="col-sm-5 col-form-label text-right " for="">Institute Category :</label>
							<div class="col-sm-6">
							 	<select class="form-control" id="erptype" name="erptype">
									<option value="">Select Type</option>
								</select>
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						   <label class="col-sm-5 col-form-label text-right" for="">Is Minority :</label>
							<div class="col-sm-6">
								<input type="checkbox" class="" id="" name="" value="">
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						   <label class="col-sm-5 col-form-label text-right" for="">Proposed Institute Name :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Proposed Institute Name" id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Address :</label>
							<div class="col-sm-6">
							 <textarea class="form-control" style="resize:vertical;max-height:120px;" placeholder="Enter Address" id="" name=""></textarea>
				           </div>	
				       </div>
				</div>
			</div>
		 
			<!-- <div class="form-group" >
				<div class="col-md-12">
					<div class="page-header-2">
		    			<div class="repTitle ">Permanent Address Detail(s)</div>
					</div>
				</div>
			</div> -->
			
			<!-- <div class="form-group" >
			<div class="col-md-12">
					<div class="row" >
						<label class="col-sm-5 col-form-label text-right" for="">Permanent Address :</label>
							<div class="col-sm-6">
							 <textarea class="form-control" style="resize:vertical;max-height:120px;"  placeholder="Enter Address" id="" name="" maxlength=""></textarea>
				           </div>	
				       </div>
				</div>
			</div> -->
			<div class="form-group">
			  <div class="col-md-12">
					<div class="row">
							  <label class="col-sm-5 col-form-label text-right" for="">Country Name :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control" placeholder="Enter Country" id="" name="">
				           </div>	
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">State :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter State" id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				           <label class="col-sm-5 col-form-label text-right" for="">District :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control" placeholder="Enter District Name" value="" id="" name="">
				           </div>
				       </div>
				</div> 
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				           <label class="col-sm-5 col-form-label text-right" for="">Chairman Chief/Trustee MD Name :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control" placeholder="Enter Chairman Chief/Trustee MD Name" value="" id="" name="">
				           </div>
				       </div>
				</div>
			</div>
		
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						    <label class="col-sm-5 col-form-label text-right" for="">Mobile No. :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control" placeholder="Enter Mobile No." id="" name="">
				           </div>
				       </div>
				</div>
			</div>
				
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						   <label class="col-sm-5 col-form-label text-right" for="">Email :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Email Id" id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			
		  <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Chairman Aadhaar No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Chairman Aadhaar No." id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			 <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Register Name :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Register Name" id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Register Mobile No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Mobile No." id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Register Email ID :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Email ID" id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Register Aadhaar No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" placeholder="Enter Aadhaar No." id="" name="">
				           </div>
				       </div>
				</div>
			</div>
			
			
			 
			 <div class="col-md-12 text-center" style="margin-top:15px; padding-bottom:10px;">
                <button type="button" class="btn btn-view" onclick="">Save </button>
                <button type="button" class="btn btn-view" onclick="">Reset</button>
		    </div>
            </div>
           </div>
           </div>
          
           
           
        </div>
    </div>
      <div id="accordionThree" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #624d1d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseThree">
                <a class="card-title">
                    Computer Peripheral & Facilities Details
                </a>
            </div>
            </div>
            <div id="collapseThree" class="panel-body collapse" data-parent="#accordionThree" >
    <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="tableGrid " cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Computer Peripheral Type</th>
									<th class="text-center">Available Room</th>
									<th class="text-center">Feedback</th>
									<th class="text-center">Refer Attachment</th>
								</tr></thead>	
								<tbody>
									<tr>
										<td style="text-align:center; width:5%;">1</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label ">Number of PCs </label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">2</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Legal System Software</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">3</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Legal Application Software</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">4</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Printers</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">5</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Internet Speed in Mbps.</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
					                <tr>
										<td style="text-align:center; width:5%;">6</td>
										<td style="text-align:center; width:20%;">
											<input type="text" class="form-control" placeholder="EnterComputer Peripheral Type" id="" name="">
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
								</tbody>
							</table>
						  </div>
					</div> 
					
					<div class="col-md-12 text-right m-t-20">
						<button type="button" class="btn btn-view" id="btnSave" onclick="">Add More</button>
					</div>
			 	<div class="form-group">
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Pre Affiliation Library Facility Details</div>
						</div>
					</div>
				  </div>
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Library Facility Type</th>
									<th class="text-center">Available Room</th>
									<th class="text-center">Feedback</th>
									<th class="text-center">Refer Attachment</th>
								</tr>
							</thead>	
									<tbody>
									<tr>
										<td style="text-align:center; width:5%;">1</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Title Books</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">2</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Volume Books</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">3</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Journals</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">4</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Reading Room Seating Capicity</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">5</td>
										<td style="text-align:left; width:20%;">
											<label for="" class="col-form-label">Multimedia PCs for Digital Library</label>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
					                <tr>
										<td style="text-align:center; width:5%;">6</td>
										<td style="text-align:center; width:20%;">
											<input type="text" class="form-control" placeholder="EnterComputer Peripheral Type" id="" name="">
										</td>
										<td style="text-align:center; width:10%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
								</tbody>
							</table>
						  </div>
					</div> 
					<div class="col-md-12 text-right m-t-20" style="margin-bottom:15px;">
						<button type="button" class="btn btn-view" id="btnSave" onclick="">Add More</button>
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
		           
			<div class="col-md-12 text-center" style="margin-top:15px; padding-bottom:10px;">
				<button type="button" class="btn btn-view" onclick="">Save &amp; Continue</button>
				<button type="button" class="btn btn-view" onclick="">Reset</button>
			</div>
    </div>
    </div>
    </div>
    </div>
    </div>
     <div id="accordionFour" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #624d1d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseFour">
                <a class="card-title">Administrative & Amenities Details
                </a>
            </div>
            </div>
            <div id="collapseFour" class="panel-body collapse" data-parent="#accordionFour" >
              <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Administrative Type</th>
									<th class="text-center">Available Carpet (in Sq. Meter)</th>
									<th class="text-center">Available Rooms</th>
									<th class="text-center">Feedback</th>
									<th class="text-center">Refer Attachment</th>
								</tr><tr>
							</tr></thead>	
								<tbody>
								<tr>
									<td style="text-align:center; width:5%;">1</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Principal Director Office</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
					                <tr>
										<td style="text-align:center; width:5%;">2</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Board Room</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">3</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Office All Inclusive</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">4</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Department Office</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">5</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Cabins of Head of Departments</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">6</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">faculty Rooms</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">7</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Central Stores</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">8</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Project Details</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">9</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Maintenance</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">10</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Security</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">11</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">House Keeping</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">12</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Pantry for Staff</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">13</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Examination Control Office</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
									 <tr>
										<td style="text-align:center; width:5%;">14</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Placement Office</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="" id="" name="">
										</td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:5%;">15</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Details" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
								</tbody>
							</table>
						  </div>
					</div> 
					
					<div class="col-md-12 text-right m-t-20" style="margin-bottom:15px;">
						<button type="button" class="btn btn-view" id="btnSave" onclick="">Add More</button>
					</div>
					
					<div class="form-group">
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Pre Affiliation Amenities Details</div>
						</div>
					</div>
				  </div>
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Amenities Type</th>
									<th class="text-center">Available Carpet (in Sq. Meter)</th>
									<th class="text-center">Available Rooms</th>
									<th class="text-center">Feedback</th>
									<th class="text-center">Refer Attachment</th>
								</tr><tr>
							</tr></thead>	
								<tbody>
									<tr>
									<td style="text-align:center; width:5%;">1</td>
										<td style="text-align:left; width:8%;">
											<label for="" class="col-form-label">Total (Ladies &amp; Gents)</label>
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
					                <tr>
										<td style="text-align:center; width:5%;">2</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Details" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Area in Sq. Meter" id="" name="">
										</td>
										<td style="text-align:center; width:8%;">
											<input type="text" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
										<td style="text-align:left; width:8%;">
											<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										</td>
										<td style="text-align:center; width:10%;">
											<input type="file" class="form-control" placeholder="Enter Available Rooms" id="" name="">
										</td>
									 </tr>
								</tbody>
							</table>
						  </div>
					</div> 
					
					<div class="col-md-12 text-right m-t-20">
						<button type="button" class="btn btn-view" id="btnSave" onclick="">Add More</button>
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
					<div class="col-md-12 text-center" style="margin-top:15px; padding-bottom:10px;">
						<button type="button" class="btn btn-view" onclick="">Save &amp; Continue</button>
						<button type="button" class="btn btn-view" onclick="">Reset</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		<div id="accordionFive" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #624d1d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseFive">
								<a class="card-title">Infrastructure Information </a>
							</div>
						</div>
						<div id="collapseFive" class="panel-body collapse"data-parent="#accordionFive">
							<div class="col-md-12 table-responsive"style="padding: 0px; display: inline-block;">
								<div id="" class="dataEntryDiv"style="padding: 0px; display: inline-block;">
									<table id="searchTable"class="tableGrid"cellspacing="0" width="100%">
										<thead>
											<tr>
												<th class="text-center">S.No.</th>
												<th class="text-center">Program</th>
												<th class="text-center">Computer Peripheral Type</th>
												<th class="text-center">Available Area (in Sq. Mtr.)</th>
												<th class="text-center">Available Room</th>
												<th class="text-center">Feedback</th>
									            <th class="text-center">Refer Attachment</th>
											</tr>
											<tr>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="text-align: center; width: 5%;">1</td>
												<td style="text-align: left; width: 20%;"><label for="" class="col-form-label">Class Room (C)</label></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Enter Computer Peripheral Type" id=""name=""></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control"placeholder="Available Area (in Sq. Meter)" id=""name=""></td>
												<td style="text-align: center; width: 8%;"><input type="text" class="form-control"placeholder="Available Room" id="" name=""></td>
												<td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>
											</tr>
											<tr>
												<td style="text-align: center; width: 5%;">2</td>
												<td style="text-align: left; width: 20%;"><label for="" class="col-form-label">Tutorials Room (D) PG Class Rooms(H)</label></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Enter Computer Peripheral Type" id=""name=""></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Available Area (in Sq. Meter)" id="" name=""></td>
												<td style="text-align: center; width: 8%;"><input 	type="text" class="form-control" placeholder="Available Room" id="" name=""></td>
											    <td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>
											</tr>
											<tr>
												<td style="text-align: center; width: 5%;">3</td>
												<td style="text-align: left; width: 20%;"><label for="" class="col-form-label">Laboratory (Includes Machine Rooms Instrument Rooms)</label></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Enter Computer Peripheral Type" id="" 	name=""></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Available Area (in Sq. Meter)" id="" name=""></td>
												<td style="text-align: center; width: 8%;"><input type="text" class="form-control" placeholder="Available Room" id="" name=""></td>
											    <td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>
											</tr>
		
											<tr>
												<td style="text-align: center; width: 5%;">4</td>
												<td style="text-align: left; width: 20%;"><label for="" class="col-form-label">Computers Center</label></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Enter Computer Peripheral Type" id="" 	name=""></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Available Area (in Sq. Meter)" id="" 	name=""></td>
												<td style="text-align: center; width: 8%;"><input type="text" class="form-control" 	placeholder="Available Room" id="" name=""></td>
												<td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>	
												
											</tr>
		
											<tr>
												<td style="text-align: center; width: 5%;">5</td>
												<td style="text-align: left; width: 20%;"><label for="" class="col-form-label">Library and Reading Room</label></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Enter Computer Peripheral Type" id=""name=""></td>
												<td style="text-align: center; width: 12%;"><input
													type="text" class="form-control"
													placeholder="Available Area (in Sq. Meter)" id=""
													name=""></td>
												<td style="text-align: center; width: 8%;"><input type="text" class="form-control" placeholder="Available Room" id="" name=""></td>
													<td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>
											</tr>
		
											<tr>
												<td style="text-align: center; width: 5%;">6</td>
												<td style="text-align: left; width: 20%;"><label for="" class="col-form-label">Seminar Hall</label></td>
												<td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Enter Computer Peripheral Type" id="" name=""></td>
											     <td style="text-align: center; width: 12%;"><input type="text" class="form-control" placeholder="Available Area (in Sq. Meter)" id="" name=""></td>
												<td style="text-align: center; width: 8%;"><input type="text" class="form-control"placeholder="Available Room" id="" name=""></td>
											    <td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>	
													
												
											</tr>
		
											<tr>
												<td style="text-align: center; width: 5%;">7</td>
												<td style="text-align: center; width: 20%;"><input
													type="text" class="form-control"
													placeholder="Enter Program" id="" name=""></td>
												<td style="text-align: center; width: 12%;"><input
													type="text" class="form-control"
													placeholder="Enter Computer Peripheral Type" id=""
													name=""></td>
												<td style="text-align: center; width: 12%;"><input
													type="text" class="form-control"
													placeholder="Available Area (in Sq. Meter)" id=""
													name=""></td>
												<td style="text-align: center; width: 8%;"><input 	type="text" class="form-control"></td>
												<td style="text-align:left; width:8%;">
											      <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
										        </td>
										         <td style="text-align:center; width:10%;">
											       <input type="file" class="form-control" placeholder="" id="" name="">
										        </td>
													
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-md-12 text-right m-t-20">
								<button type="button" class="btn btn-view" id="btnSave"
									onclick="">Add More</button>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="page-header-2">
										<div class="repTitle ">Pre Affiliation Land Detail(s)</div>
									</div>
								</div>
							</div>
		
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<label class="col-sm-5 col-form-label text-right" for="">Type
											of Land :</label>
										<div class="col-sm-6">
											<select class="form-control" id="erptype" name="erptype">
												<option value="">Select Type</option>
												<option value="">Urban</option>
												<option value="">Rural</option>
											</select>
										</div>
									</div>
								</div>
							</div>
		
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<label class="col-sm-5 col-form-label text-right" for="">Available
											Land in Acres (in Sq. Mtr.) :</label>
										<div class="col-sm-6">
											<input type="text" class="form-control"
												placeholder="Enter Area" id="" name="">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<label class="col-sm-5 col-form-label text-right " for="">Available
											Constructed Building Area (in Sq. Mtr.) :</label>
										<div class="col-sm-6">
											<input type="text" class="form-control"
												placeholder="Enter Area" id="" name="">
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
							<div class="col-md-12 text-center"
								style="margin-top: 15px; padding-bottom: 10px;">
								<button type="button" class="btn btn-view" onclick="">Save
									&amp;Continue</button>
								<button type="button" class="btn btn-view" onclick="">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="accordionSix" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #624d1d;">
							<div class="card-header collapsed" data-toggle="collapse" href="#collapseSix">
								<a class="card-title">Society Information </a>
							</div>
						</div>
						<div id="collapseSix" class="panel-body collapse"data-parent="#accordionSix">
						<div class="form-group">
					   <div class="col-md-12">
							<div class="row">
								<label class="col-sm-5 col-form-label text-right" for="">Institute Registration Type :</label>
									<div class="col-sm-6">
										<select class="form-control" id="projtype" name="projtype">
											<option value="">Select Type</option>
										</select>
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
								<label class="col-sm-5 col-form-label text-right" for="">Society/ Trust/ Section 25 Detail's Name :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Details" id="" name="">
						           </div>
						       </div>
						</div>
					</div>
					
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						          <label class="col-sm-5 col-form-label text-right" for="">Society/ Trust/ Section 25 Detail's Address :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Details" id="" name="">
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">State Name:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter State Name" id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">District Name :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter District" id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Tahsil Name :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Tahsil Name" id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Pin Code :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Pin Code" id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Phone No. :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Phone No." id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Email :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Email ID" id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Fax :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="Enter Fax Details" id="" name="">	
						           </div>
						       </div>
						</div>
					</div>
				
					 
					<div class="form-group">
						<div class="col-md-12">
							<div class="page-header-2">
				    			<div class="repTitle ">Member Information</div>
							</div>
						</div>
					</div>
					
					 <div class="panel panel-default">
						<div class="panel-body">
							  <div class="form-group">
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Member Name</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="Enter Member Name" id="" name="">	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Member Aadhaar</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="Enter Member Aadhaar" id="" name="">	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group">
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Member DOB</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="Enter Member DOB" id="" name="">	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Member Mobile</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="Enter Mobile No." id="" name="">	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group">
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Member Email ID</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="Enter Email ID" id="" name="">	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Member Designation</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="Enter Member Designation" id="" name="">	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group">
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Upload Photo</label>
											<div class="col-sm-4">
												<input type="file" class="" id="" name="" vaule="">	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Upload Signature</label>
											<div class="col-sm-4">
												<input type="file" class="" id="" name="" vaule="">	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group">
								<div class="col-md-12">
										<div class="row">
									           <label class="col-sm-2 col-form-label text-left " for="">Upload Memorandum in Corporation Letter</label>
												<div class="col-sm-4">
													<input type="file" class="" id="" name="" vaule="">	
									           </div>
									       </div>
									</div>
								</div>
								
								 
						</div>
					</div>
						 
					<div class="col-md-12 text-right m-t-20">
						<button type="button" class="btn btn-view" id="btnSave" onclick="">Add More</button>
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
					<div class="col-md-12 text-center" style="margin-top:15px; padding-bottom:10px;">
						<button type="button" class="btn btn-view" onclick="">Save &amp; Continue</button>
						<button type="button" class="btn btn-view" onclick="">Reset</button>
					</div>	
		          </div>
		      </div>
		   </div>
		</div>
   </div>
   <div id="accordionSeven" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #624d1d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseSeven">
								<a class="card-title">Faculty Information </a>
							</div>
						</div>
						<div id="collapseSeven" class="panel-body collapse"data-parent="#accordionSeven">
						<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Faculty Name</th>
								<th class="text-center">Aadhaar No.</th>
								<th class="text-center">PAN card No.</th>
								<th class="text-center">Father Name</th>
								<th class="text-center">Designation Name</th>
								<th class="text-center">Is Director</th>
								<th class="text-center">Feedback</th>
							    <th class="text-center">Refer Attachment</th>
								
							</tr><tr>
						</tr></thead>	
						<tbody>
			                <tr>
								<td style="text-align:center; width:5%;">1</td>
								<td style="text-align:center; width:8%;">
									<input type="text" class="form-control" placeholder="Enter Faculty Name" id="" name="">
								</td>
								<td style="text-align:center; width:8%;">
									<input type="text" class="form-control" placeholder="Enter Aadhaar No." id="" name="">
								</td>
								<td style="text-align:center; width:8%;">
									<input type="text" class="form-control" placeholder="Enter PAN card No." id="" name="">
								</td>
								<td style="text-align:center; width:8%;">
									<input type="text" class="form-control" placeholder="Enter Father Name" id="" name="">
								</td>
								<td style="text-align:center; width:8%;">
									<input type="text" class="form-control" placeholder="Enter Designation Name" id="" name="">
								</td>
								<td style="text-align:center; width:8%;">
									<input type="checkbox" class="" id="" value="">
								</td>
								<td style="text-align:left; width:8%;">
									<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							    </td>
								<td style="text-align:center; width:10%;">
									<input type="file" class="form-control" placeholder="" id="" name="">
								</td>
							 </tr>
						</tbody>
					</table>
				  </div>
				</div> 
				<div class="col-md-12 text-right m-t-20" style="margin-bottom:15px;">
					<button type="button" class="btn btn-view" id="btnSave" onclick="">Add More</button>
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
					<button type="button" class="btn btn-view" id="btnSave" onclick="">Save &amp; Continue</button>
					<button type="button" class="btn btn-view" id="btnReset" onclick="">Reset</button> 
				</div>
		          </div>
		      </div>
		   </div>
		</div>
   </div>
   <div id="accordionEight" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #624d1d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseEight">
								<a class="card-title">Questionnaires </a>
							</div>
						</div>
						<div id="collapseEight" class="panel-body collapse"data-parent="#accordionEight">
						 <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="tableGrid" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Question</th>
									<th class="text-center">Yes/ No</th>
									<th class="text-center">Field 1</th>
									<th class="text-center">Field 2</th>
									<th class="text-center">Field 3</th>
									<th class="text-center">Feedback</th>
							        <th class="text-center">Refer Attachment</th>
								</tr><tr>
							</tr></thead>	
								<tbody>
					                <tr>
										<td style="text-align:center; width:3%;">1</td>
										<td style="text-align:left; width:12%;">If Affiliation has already been granted for Previous Year? (If Yes, Upload Order Copy in Last Step)</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:left; width:8%;">Last Order No.</td>
										<td style="text-align:left; width:5%;">Date</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">2</td>
										<td style="text-align:left; width:12%;">Adequate fire-fighting facility are available in the institute(Upload NOC in the format of NBC 2005)</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:left; width:8%;">Approval Letter No.</td>
										<td style="text-align:left; width:5%;">Valid Date </td>
										<td style="text-align:center; width:5%;"> </td>
									   <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">3</td>
										<td style="text-align:left; width:12%;">Indicate the expenditure, made in Equipment of Workshops, Computer Centre and Different Labs.</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:left; width:8%;">Expenditure in INR.</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									 
									 <tr>
										<td style="text-align:center; width:3%;">4</td>
										<td style="text-align:left; width:12%;">In Endowment Fund Amount of Course Running has been Deposited.</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									   <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									 <tr>
										<td style="text-align:center; width:3%;">5</td>
										<td style="text-align:left; width:12%;">Does the Institute have building for already running/proposed new (If yes, Please upload the related document from building Area of Lecture rooms , Workshop, library and laboratories)</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									   <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									 <tr>
										<td style="text-align:center; width:3%;">6</td>
										<td style="text-align:left; width:12%;">Is the Institute have its Own Sports Fields?</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									     <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									 <tr>
										<td style="text-align:center; width:3%;">7</td>
										<td style="text-align:left; width:12%;">Indicate the Number of Teaching Faculty Members Approved by the Regulatory Body </td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:left; width:5%;">Number of Faculty </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">8</td>
										<td style="text-align:left; width:12%;">Indicate the Number of Admin and Support Staff in the Institute as</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:left; width:5%;">Number of Admin and Support 20 </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">9</td>
										<td style="text-align:left; width:12%;">Is the Director/ Principal having qualifications as per Regulatory Body Norms and also Approved by Regulatory Body? </td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">10</td>
										<td style="text-align:left; width:12%;">Is the management Committee constituted and approved by University?(If Yes upload approve documents in last steps)  </td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">11</td>
										<td style="text-align:left; width:12%;">Has the Secretary of the Institute given the undertaking to the University to maintain the norms (If Yes upload approve documents in last steps) </td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">12</td>
										<td style="text-align:left; width:12%;">Has the Secretary of the Institute for new affiliation of course given the undertaking to make payment of faculty and staff for next three year from their resources?(If Yes upload approve documents in last steps)</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">13</td>
										<td style="text-align:left; width:12%;">Is the Institute having the Student Grievance Cell?</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">14</td>
										<td style="text-align:left; width:12%;">Do the facilities for Sanitary &amp; Hygiene exist in hostels?</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
									  <tr>
										<td style="text-align:center; width:3%;">15</td>
										<td style="text-align:left; width:12%;">Do the Mess facilities exist in hostels?</td>
										<td style="text-align:left; width:4%;">
											<input type="radio" class="" id="Y" value="Y" name="opt">&ensp;Yes <br> 
											<input type="radio" class="" id="N" value="N" name="opt">&ensp;No
										</td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
										<td style="text-align:center; width:5%;"> </td>
									    <td style="text-align:left; width:8%;">
									       <textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
							           </td>
								        <td style="text-align:center; width:10%;">
									       <input type="file" class="form-control" placeholder="" id="" name="">
								        </td>
									 </tr>
								</tbody>
							</table>
						  </div>
					</div> 
					
		          </div>
		      </div>
		   </div>
		</div>
   </div>
   <div id="accordionNine" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #624d1d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseNine">
								<a class="card-title">Upload Document </a>
							</div>
						</div>
						<div id="collapseNine" class="panel-body collapse"data-parent="#accordionNine">
						
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Land Registration Document :</label>
					<div class="col-sm-2 pd-link" >
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel ">The validity of the registration of the Society :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Security FDR :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Faculty List :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Affidavit :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Clearance/No Objection Certificate :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Document for Registration of the Society/Trust :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Land Use Certificate :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Registered land/Government leased land documents :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Appropriate order from the Government permitting :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Building Plan :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Document by the registered Society/Trust earmarking land and buildings for the proposed college :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Details of the latest fund position :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label for="" class="col-sm-2 col-form-label text-right pd-lebel">Project Details :</label>
					<div class="col-sm-2 pd-link">
						<a href="#"><b>Download Attachment</b></a>
					</div>
					<label for="" class="col-sm-2 col-form-label text-right ">Feedback :</label>
					<div class="col-sm-3">
						<textarea class="form-control" style="resize:vertical;max-height:120px;"></textarea>
					</div>
		
					<div class="col-sm-3">
		
						<input type="file" class="" id="" name="">
					</div>
				</div>
			</div>
		</div>
		
		
<!-- 
			
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right ">Faculty List :</label>
						<div class="col-sm-6">
                      		<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right ">Affidavit :</label>
						<div class="col-sm-6">
							<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right ">Clearance/No Objection Certificate :</label>
						<div class="col-sm-6">
                    	  <input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
							<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
                     		<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
							<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
                     		<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
					<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
                     		<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
							<input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
					<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
                     		 <input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-6 col-form-label text-right "></label>
						<div class="col-sm-6">
                    		 <input type="file" class="" id="" name="">
						</div>
					</div>
				</div>
			</div> -->
			
			
			
             <div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="btnSave" onclick="">Save &amp; Continue</button>
					<button type="button" class="btn btn-view" id="btnReset" onclick="">Reset</button> 
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
						
		          </div>
		      </div>
		   </div>
		</div>
   </div>
	<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Remarks</label>
								<div class="col-sm-4">
									<textarea class="form-control" style="resize:vertical;max-height:120px;height:40px;"></textarea>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Recommendation</label>
								<div class="col-sm-4">
									 <textarea class="form-control" style="resize:vertical;max-height:120px;height:40px;"></textarea> 
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 text-center" style="margin-top:15px; padding-bottom:10px;">
				<button type="button" class="btn btn-view" onclick="">Save</button>
				<button type="button" class="btn btn-view" onclick="">Reset</button>
			</div>	
		
</div>
  </div> 
    </form>
    </div>
   
</body>
</html>