<%@page import="com.sits.affiliation.common_master.questionnaire_master.QuestionnaireMastManager"%>
<%@page import="com.sits.affiliation.common_master.questionnaire_master.QuestionnaireMastModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@include file="../myCks.jsp"%> 
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />
	<title><%=ReadProps.getkeyValue("welcome.header", "sitsResource") %></title>
 	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"  type="text/css">
	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
	<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
	<script type="text/javascript" src="../resources/js/affiliation/questionnaire-master.js"></script>
	
	<script type="text/javascript" src="../resources/js/common/common.js"></script>	
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>
	<script type="text/javascript" src="../resources/js/commonDropDown.js"></script>
	<%
		response.setHeader("Cache-Control","no-store"); //HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setDateHeader ("Expires", -1); //prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<%
	String OPT_TYP = "", OPT_VALUE = "",isActive="",ques_id="",ques_type="" ,sel="" ,status="",ques_name="", ques_sub_type="";
	OPT_TYP = General.checknull(request.getParameter("opt_typ"));
	/* status = General.checknull(request.getParameter("fstatus")); */
	ques_id = General.checknull(request.getParameter("ques_id"));

	if(OPT_TYP.equals("")) {
		OPT_TYP = "N";
		OPT_VALUE = ApplicationConstants.NEW;
	}else if(OPT_TYP.equals("E")) {
		OPT_VALUE = ApplicationConstants.EDIT;
	}
	QuestionnaireMastModel model = QuestionnaireMastManager.getRecordForEdit(ques_id);
	isActive   = General.checknull(model.getIs_active());
	ques_name    = General.checknull(model.getQues_name());
	ques_id    = General.checknull(model.getQues_id());
	ques_type  = General.checknull(model.getQues_type());
	ques_sub_type  = General.checknull(model.getQues_sub_type());
	if(isActive.equals("Y")){
	 	sel="checked";
	}	
	%>
<body onload="<%if(OPT_TYP.equals("E"))%> getQuesSubTypeByType('<%=ques_type%>', 'XQUES_SUB_TYPE', '<%=ques_sub_type%>');">
<div class="container-fluid">
<div id="ftitleHeader" class="page-header">
	<h4><%=ReadProps.getkeyValue("questionnaire_master.header","sitsResource") %>
		<span style="float:right">
			<a href="" data-toggle="modal" data-target=".recomond-btn" style="text-decoration:none;">
				<span><%= ApplicationConstants.ADVANCE_SEARCH %></span>
	 			<i class="fa fa-search"></i>
	  		</a>
		</span> 
	 </h4>
</div>
    	<form class="form-horizontal" name="frmQuestnrMastE" id="frmQuestnrMastE" action="" method="post" autocomplete="off">
    		<div class="panel panel-default">
     			<div class="panel-heading"><h3 class="panel-title text-right"><%=OPT_VALUE %></h3></div>
			<div class="panel-body">
                <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="Questionnaire Name">Questionnaire Name</label>
								<div class="col-sm-4">
									<input type ="text" class="form-control" id="XQUES_NAME" name="XQUES_NAME" maxlength="90" value="<%=ques_name%>" placeholder="Enter Questionnaire Name">
						     	</div>
						  	<label class="col-sm-2 col-form-label" for="">Is Active</label>
								<div class="col-sm-4">
									<input type="checkbox" class="" <%=sel%> id="XIS_ACTIVE" name="XIS_ACTIVE" value="isActive">
						     	</div>
					   	</div>
				   	</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Questionnaire Type</label>
								<div class="col-sm-4" >
									<select class="form-control" id="XQUES_TYPE" name="XQUES_TYPE">
										<option value="">Select Questionnaire Type</option>
										<%=QueryUtil.getComboOption("AF_QUESTIONNAIRE_TYPE_MAST", "QTP_ID", "QTP_NAME", ques_type, "IS_ACTIVE='Y'", "QTP_NAME") %>	
									</select>
				           		</div>
			           		<label class="col-sm-2 col-form-label required-field" for="">Questionnaire Sub Type</label>
								<div class="col-sm-4" >
									<select class="form-control" id="XQUES_SUB_TYPE" name="XQUES_SUB_TYPE">
										<option value="">Select Questionnaire Sub Type</option>
									</select>
				           		</div>
				       	</div>
				    </div>
				 </div>
				<!--  <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage" id="errMsg"></div>
					</div>
				</div> -->
				<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage2" id="errMsg"></div>
					</div>
				</div> 
					<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage1" id="errMsg1"></div>
					</div>
				</div>

				<div class="col-md-12 text-center m-t-20">
				<% if(OPT_TYP.equals("N")){ %>
					<button type="button" class="btn btn-view" id="btnSave" onclick="saveRecord();">Save</button>
				<%} else if(OPT_TYP.equals("E")){%>
				<button type="button" class="btn btn-view" name="btnBack" id="btnBack" >Back</button>
					<button type="button" class="btn btn-view" id="btnUpdate" onclick="saveRecord();">Update</button>
				<%} %>
					
					<button type="button" class="btn btn-view" name="btnReset" id="btnReset" >Reset</button> 
					<input type="hidden" id="fstatus" name="fstatus"  value="<%=OPT_TYP%>" >
					<input type="hidden" id="ques_id" name="ques_id" value="<%=ques_id%>">
					<input type="hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>"/>
				</div>
			</div>
		</div>
	</form>
	<form class="form-horizontal" name="myForm" id="frmQuaterMastD" action="" target="" method="post">
  <div class="modal fade recomond-btn" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:red;">X</button></div>
	  	<div class="modal-body">
	  	<div class="panel panel-default">
     		<div class="panel-heading"><h3 class="panel-title text-right">Searching Criteria</h3></div>
				<div class="panel-body">
			  	 <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="Questionnaire Name">Questionnaire Name</label>
								<div class="col-sm-4">
									<input type ="text" class="form-control" id="ASQUES_NAME" name="ASQUES_NAME" maxlength="90" value="<%=ques_name%>" placeholder="Enter Questionnaire Name">
						     	</div>
						  	<label class="col-sm-2 col-form-label required-field" for="">Questionnaire Type</label>
								<div class="col-sm-4" >
									<select class="form-control" id="ASQUES_TYPE" name="ASQUES_TYPE">
										<option value="">Select Questionnaire Type</option>
										<%=QueryUtil.getComboOption("AF_QUESTIONNAIRE_TYPE_MAST", "QTP_ID", "QTP_NAME", "", "IS_ACTIVE='Y'", "QTP_NAME") %>	
									</select>
				           		</div>
					   	</div>
				   	</div>
				</div>
   	 		  </div>
   	 		    <div class="form-group m-t-25 m-b-5">
			<div class="col-md-12 text-center">
			<div class="row">
   		
    		<button type="button" class="btn btn-view" id="btnSearch" data-dismiss="modal" value="Search" onclick="vldSearch();">Search</button>
	     	<button type="button" class="btn btn-view" id="btnReseTas">Reset</button> 
   </div>
   </div>
   </div>    
   		</div>
   			</div>
   				</div>
 	</div>
   </div>    

</form>
	<iframe class="embed-responsive-item" name="btmfrmQuestnrMastD" id="btmfrmQuestnrMastD" src="questionnaire_master_l.jsp" width="100%" onload="resizeIframe(this)" scrolling="no" height="" frameborder="0" style="overflow-y: hidden;" ></iframe>
</div>
</body>
 <script type="text/javascript">
      function resizeIframe(iframe) {
	    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
	    window.requestAnimationFrame(() => resizeIframe(iframe));
	}
	setTimeout(function() {
		
 	},1000);
 </script>
</html>
 