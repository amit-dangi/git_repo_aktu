<!-- @author Ashwani kumar  (03-Jan-2024)   -->  
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="com.sits.affiliation.common_master.administrative_configuration.AdministrativeConfigurationModel"%>
<%@page import="com.sits.affiliation.common_master.administrative_configuration.AdministrativeConfigurationManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/administrative-config.js"></script>
<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />


<style>
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
	.col-sm-6{padding: 0px 40px;
    	text-align: right;
    }
    .txtR{text-align: left !important;}
    
</style>


</head>
<script>
	  $( document ).ready(function(){  
	    	  $(".XFDATE1").datepicker({
	    	       format : 'dd/mm/yyyy',
				   autoclose : true,
				   orientation: 'top',
				   todayHighlight: true,
	    	    });
	    	 
	    	 $("#XTDATE1").datepicker({
	    	       format : 'dd/mm/yyyy',
				   autoclose : true,
				   orientation: 'top',
				   todayHighlight: true,
	    	    });
	    	
	    	});
	  </script>
	  <%
	String OPT_VALUE="", OPT_TYP = "",admc_id="",session_id="",req_name="",effective="";
	int cnt=0;
	
 	OPT_TYP = General.checknull(request.getParameter("opt_typ"));
 	admc_id = General.checknull(request.getParameter("admc_id"));
 	//System.out.println("admc_id11-----"+admc_id);
    if(OPT_TYP.equals("")) {
		cnt=1;
		OPT_TYP = "N";
		OPT_VALUE = ApplicationConstants.NEW;
	}else if(OPT_TYP.equals("E")) {
		
		OPT_VALUE = ApplicationConstants.EDIT;
		try {
			AdministrativeConfigurationModel Model =AdministrativeConfigurationManager.EditRecord(admc_id);
			  effective           = Model.getEffective();
			  session_id          = Model.getSession();
			  req_name            = Model.getReq_type();
		}catch(Exception e){System.out.println("Error in administrative_configuration_e.jsp"+e.getMessage());	
		}
	}
%>
<body onload="getLibFacDet();getComputersId();getDetailsId();getInfrastructureDetailsId();getAmenitiesDetailsId(); <%if(OPT_TYP.equals("E")){ %> getAcademicSession('<%=session_id %>');<% }%>">
<div class="container-fluid">
				<div id="ftitleHeader" class="page-header">
					<h4> <%=ReadProps.getkeyValue("administrative_configuration.header","sitsResource") %>
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
									<select id="session_id" class="form-control">
										<option value="">Select Session</option>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Effective From</label>
								<div class="col-sm-4">
									<div class="input-group date" id="">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control XFDATE1" id="XFDATE1"name="XFDATE1" aria-invalid="true" aria-required="true"required="required" placeholder="Enter Date" onclick="" onchange="" value="<%= effective%>">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
							<label for="" class="col-sm-2 col-form-label required-field">Request Type</label>
								<div class="col-sm-4">
									<select id="req_id" name="req_id"class="form-control">
										<option value="">Select Request Type</option>
										  <%=QueryUtil.getComboOption("af_request_type", "req_id", "req_desc ",req_name, "", "req_desc") %>
									</select>
								</div>
								
							</div>
						</div>
					</div>
		
    <div id="accordion" class="accordion">
   <div class="card mb-0">
    <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseOne">
                <a class="card-title">
                    Administrative Details
                </a>
            </div>
            </div>
            <div id="collapseOne" class="panel-body collapse" data-parent="#accordion" >
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Administrative Type</th>
									<th class="text-center">Available Carpet(in Sq.Meter)</th>
									<th class="text-center">Delete</th>
								<tr>
							</thead>	
								<tbody id="AdministrativeDetails_table">
								</tbody>
							</table>
							
						  </div>
					</div> 
					<div class="form-group ">
				    	<div class="row">
						<div class="col-md-12 text-right">
						<button type="button" class="btn btn-view" onclick="addAdministrativeDetails();">Add More</button>
					     </div>
				     	</div>
           		       </div>
           		
             </div><!--  accordian collapseOne div close here -->
           </div>
           
           
           
        </div>
    </div>
<div id="accordionTwo" class="accordion">
    <div class="card mb-0">
    <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseTwo">
            
            
                <a class="card-title">
                  Infrastructure Information
                </a>
            </div>
            </div>
            <div id="collapseTwo" class="panel-body collapse" data-parent="#accordionTwo" >
             
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Infrastructure Type </th>
									<th class="text-center">Available Carpet(in Sq.Meter)</th>
									<th class="text-center">Delete</th>
								<tr>
							</thead>	
								<tbody id="Infrastructure_table">
								 
								</tbody>
							</table>
						  </div>
					</div> 
           		<div class="form-group ">
					<div class="row">
						<div class="col-md-12 text-right">
						<button type="button" class="btn btn-view" onclick="addInfrastructureDetails();">Add More</button>
					  </div>
				  	</div>
           		</div>
             </div><!--  accordian collapseTwo div close here -->
           </div>
        </div>
    </div>	
    
    
   <!--  add new  -->
   
   
     <div class="card mb-0">
    <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseThree">
                <a class="card-title">
                  Amenities Details
                </a>
            </div>
            </div>
            <div id="collapseThree" class="panel-body collapse" data-parent="#accordionThree" >
             
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Amenities Type </th>
									<th class="text-center">Available Carpet(in Sq.Meter) </th>
									<th class="text-center">Delete</th>
									 
								<tr>
							</thead>	
								<tbody id="Amenities_Details">
								</tbody>
							</table>
						  </div>
					</div> 
           		<div class="form-group ">
					<div class="row">
						<div class="col-md-12 text-right">
						<button type="button" class="btn btn-view" onclick="addAmenitiesDetails();">Add More</button>
					  </div>
				  	</div>
           		</div>
             </div><!--  accordian collapseThree div close here -->
           </div>
        </div>
    </div>	
    
    
    
      <div class="card mb-0">
    <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseFour">
                <a class="card-title">
                  Computer Software Internet and Printers Details
                </a>
            </div>
            </div>
            <div id="collapseFour" class="panel-body collapse" data-parent="#accordionThree" >
             
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Computer Peripheral Type </th>
									<th class="text-center">Available</th>
									<th class="text-center">Delete</th>
									 
								<tr>
							</thead>	
								<tbody id="Computer_peripherals">
								</tbody>
							</table>
						  </div>
					</div> 
           		<div class="form-group ">
					<div class="row">
						<div class="col-md-12 text-right">
						<button type="button" class="btn btn-view" onclick="addComputersDetails();">Add More</button>
					  </div>
				  	</div>
           		</div>
             </div><!--  accordian collapseThree div close here -->
           </div>
        </div>
    </div>	
    
    <div class="card mb-0">
    <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseFive">
                <a class="card-title">
                  Library Facility Type
                </a>
            </div>
            </div>
            <div id="collapseFive" class="panel-body collapse" data-parent="#accordionThree" >
             
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Library Facility Type</th>
									<th class="text-center">Available</th>
									<th class="text-center">Delete</th>
									 
								<tr>
							</thead>	
								<tbody id="library_Facility">
								</tbody>
							</table>
						  </div>
					</div> 
           		<div class="form-group ">
					<div class="row">
						<div class="col-md-12 text-right">
						<button type="button" class="btn btn-view" onclick="addLibraryDetails();">Add More</button>
					  </div>
				  	</div>
           		</div>
             </div><!--  accordian collapseThree div close here -->
           </div>
        </div>
    </div> 
    
    
    
    <!-- 	End  -->
    	
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
						<div class="col-md-12 text-center">
						 <%if(OPT_TYP.equals("N")){ %>
							<button type="button" class="btn btn-view" onclick="validateData();">Save</button>
						<%}else if(OPT_TYP.equals("E")){ %>
			            <button type="button" class="btn btn-view" id="updtBtn" name="updtBtn" onClick="validateData();">Update</button>
			 	        <button type="button" class="btn btn-view" id="btnback" >Back</button>		 
		      	     <%} %>
							<button type="button" class="btn btn-view" id="btnReset" onclick="">Reset</button>
		
						</div>
					 <input type="hidden" name="totRow" id="totRow" value="">
				     <input type="hidden" name="totRowDetails" id="totRowDetails" value="">
				     <input type="hidden" name="totRowID" id="totRowID" value="">
				     <input type="hidden" name="totComRowID" id="totComRowID" value="">
				      <input type="hidden" name="totLibRowID" id="totLibRowID" value="">
		             <input type= "hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>" >
					 <input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>"> 
				     <input type= "hidden" id="fstatus" value="<%=OPT_TYP %>"  /> 
					 <input type= "hidden" id="admc_id" value="<%= admc_id%>"  /> 
					</div>
				</div>
				</div>
				</div>
			</form>
   <iframe class="embed-responsive-item" src="administrative_configuration_l.jsp" name="btmStockD" id="btmStockD"  onload="resizeIframe(this)" src="" frameborder="0" scrolling="no" width="100%" height=""></iframe>
			
		</div>
		
</body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
</html>