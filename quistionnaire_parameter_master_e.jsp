<%@page import="com.sits.general.QueryUtil" %>
<%@include file="../myCks.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
  <meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />

	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />	
	
	<script type="text/javascript" src="../resources/js/affiliation/ques-param-mast.js"></script>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>	
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>
</head>
<style>
	.chkAlign{
		margin: 5px 0 0 !important;
		margin-right: 5px !important;
	  }
	.multiLine{
		height: 85px; 
		padding-top:0px;
		overflow: auto; 
		border: 1px solid #B2BABB; 
		border-radius: 9px !important; 
		list-style-type: none;
	}
	table.tableGrid th {
      background-color: #ffcc33;
      border: 1px solid #439653 !important;
      color:#0c426f;
    }
    .m-b-20{
     margin-bottom:20px;
    }
</style>
<%
String fstatus=General.checknull(request.getParameter("fstatus"));
if(General.checknull(fstatus).equals("")){
	fstatus="N";
}
String ques_name = General.checknull(request.getParameter("ques_name"));
String ques_type = General.checknull(request.getParameter("ques_type"));
//String q_n[]=null;
/* String ques_name=""; 
if(fstatus.equals("E")){
 ques_name = General.checknull(request.getParameter("ques_name"));
 q_n = ques_name.split("~");
}*/
%>
<body <%-- onload="<%if(fstatus.equals("E")){ %> disabledParamFlag('<%=q_n[1]%>'); disableIsSubQues('<%=q_n[1]%>'); editView('<%=q_n[0]%>','<%=fstatus%>');setQues_type('<%=q_n[1] %>') <%} %>" --%>>
<div class="container-fluid">
   <div id="" class="page-header"><h4><%=ReadProps.getkeyValue("ques_param_mast.header","sitsResource") %></h4></div>
    <form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off">
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right"><%if(fstatus.equals("N")){ %>New Record<%}else{ %>Update Record<%} %></h3></div>
			<div class="panel-body">
                <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Questionnaire Name</label>
							 <div class="col-sm-4">
								<select class="form-control" id="ques_name" name="ques_name">
									<option value="">Select Questionnaire Name</option>
									<%=QueryUtil.getComboOption("af_questionnaire_mast", "QUES_ID", "QUES_DESC", ques_name , "IS_ACTIVE='Y' " ,"") %>
								</select>
							</div>
							<label class="col-sm-2 col-form-label" for="">Questionnaire Type</label>
							 <div class="col-sm-4">
							 <input class="form-control" id="ques_type" name="ques_type" readonly="readonly" value="" placeholder="Questionnaire Type">
							 <input type="hidden" class="form-control" id="ques_type_id" name="ques_type_id" readonly="readonly" value="">
								<!-- <select class="form-control" id="ques_type" name="ques_type" disabled>
									<option value="">Select Questionnaire Type</option>
								</select> -->
						</div>
					   </div>
				   </div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Questionnaire Sub Type</label>
								<div class="col-sm-4" >
									<input class="form-control" id="ques_sub_type" name="ques_sub_type" readonly="readonly" value="" placeholder="Questionnaire Sub Type">
									<input type="hidden" class="form-control" id="ques_sub_type_id" name="ques_sub_type_id" readonly="readonly" value="">
				           		</div>
				       	</div>
				    </div>
				 </div>
				<div class="form-group">
				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="btnView" onclick="view('','');">View</button>
					<!-- <button type="button" class="btn btn-view" id="btnBack1" onclick=''>Back</button> -->
					<button type="button" class="btn btn-view" id="btnReset1" onclick=''>Reset</button>
				</div>
				</div>
				  <div class="com-course-sem-map"> 
				    <div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Feedback Question Description</label>
							  <div class="col-sm-4">
								 <textarea rows="5" class="col-sm-12" id="ques_desc" name="ques_desc" placeholder="Enter Feedback Question Description" style=" resize:vertical;max-height:120px;" maxlength="255"></textarea>		
						     </div>
						     <label class="col-sm-2 col-form-label" for="">Has Sub Question Option ?</label>
							  <div class="col-sm-4">
								 <input type="checkbox" class="" id="is_sub_ques" name="is_sub_ques" value="">
						     </div>
						     
					   </div>
				   </div>
				</div>
				 
			<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Order No.</label>
							  <div class="col-sm-4">
								<input type="text" class="form-control" id="order_no" name="order_no" maxlength="3" placeholder="Enter Order No.">
						     </div>
						 <label class="col-sm-2 col-form-label required-field" for="">Parameter Flag</label>
						     <div class="col-sm-4">
								<select class="form-control" id="param_flag" name="param_flag">
									<option value="">Select Parameter Flag</option>
									<option value="C">Check box</option>
									<option value="D">Drop Down</option>
									<option value="A">Alpha Numeric Text box</option>
									<option value="N">Numeric Text box</option>
									<option value="T">Text</option>
									<option value="M">Multiline Text box</option>
								</select>
						     </div>
					   </div>
				   </div>
				</div>
			    <div class="form-group option_value">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label required-field" for="">Option Value</label>
							<div class="cover  input_fields_wrap">
							  <div class="col-sm-4" style="margin-bottom: 3px;">
								<input type="text" class="form-control" id="opt1" maxlength="150" placeholder="Enter Option Value">
								<input type="hidden" name="opt_hide1" id="opt_hide1" value=""/>
						     </div>
							  <div class="col-sm-2 text-left" style="padding:0px;">
							     <span class="col-sm-4"><button type="button" class="btn btn-view add_field_button" id="" onclick=''>Add</button></span>				     
							    <!--  <span class="col-sm-2"><i class="fa fa-times-circle fa-2x remove_field" id="" aria-hidden="true" style="color:red;"></i></span> -->
							        
						     </div>
						     </div>
				        </div>
				   </div>
				</div>
				
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
							<label class="col-sm-2 col-form-label" for="">Is Active</label>
							  <div class="col-sm-4">
								 <input type="checkbox" class="is_active" id="is_active" value="">
						     </div>
				       </div>
				     </div>
				 </div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="row">
									<div class="row">
										<label class="col-sm-12 col-form-label">
											<font color="red">&ensp;&ensp;
												<b>Note :</b>
												For Parameter Flag: Alpha Numeric Text box, Numeric Text box or 
												Multline Text Box the Option Value is not mandatory for entering!
											</font>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="padding-top:0px;margin:0px;">
					<div class="col-sm-12 errmessage1 text-center"  id="modifyStatus"></div>
				</div>
				<div class="col-md-12 text-center m-t-20">
					<button type="button" class="btn btn-view" id="btnAddRow" onclick='addRow();'>Add Feedback Question</button>
					<!-- <button type="button" class="btn btn-view" id="btnReset2" onclick='vldReset();'>Reset</button> -->
					<button type="button" class="btn btn-view" id="btnModifyRow" onclick="modifyGrid();" style="display:none;">Modify</button>
					<input type="hidden" name="flag" id="flag" value="N" readOnly>
				</div>

					<div class="page-header-1">
						<div class="col-sm-4 repTitle h5 ">List of Questionnaire
							Parameter Detail(s)</div>
							<div class="col-sm-4 repTitle h6 text-center"></div>
					</div>
					<div id="emp_nominee_detail" style="">
						<div id="END1" class="dataEntryDiv">
							<table border="1" cellspacing="1" cellpadding="1" width="99.6%" class="tableGrid">
							<thead>
								<tr>
									<th style="text-align: center; width: 5%;">S.No.</th>
									<th style="text-align: center; width: 15%;">Questionnaire Name</th>
									<th style="text-align: center; width: 20%;">Feedback Question Description</th>
									<th style="text-align: center; width: 10%;">Has Sub Question Option ?</th>
									<th style="text-align: center; width: 10%;">Order No.</th>
									<th style="text-align: center; width: 10%;">Parameter Flag</th>
									<th style="text-align: center; width: 10%;">Option Value</th>
									<th style="text-align: center; width: 10%;">Edit</th>
									<th style="text-align: center; width: 10%;">Delete</th>
								</tr>
								</thead>
								<tbody id="searchTable">
								</tbody>
							</table>
						</div>
					</div>
				<!-- 	<div class="col-sm-12">
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
				
				<input type="hidden" name="ques_name_hide" id="ques_name_hide" value=""/> 
				<%-- <%if(fstatus.equals("E")){ %>value="<%=q_n[0]%>"<%} %>/> --%> 
				<input type="hidden" name="count" id="count" value="1"/>
				<input type="hidden" class="form-control" name="tot_row_count" id="tot_row_count" value="0" readOnly/>
				<input type="hidden" name="modRec" id="modRec" value="0" readOnly>
				<input type="hidden" name="fstatus" id="fstatus" value="<%=fstatus %>" readOnly>
				
				<div class="col-md-12 text-center m-t-20">				
					<button type="button" class="btn btn-view" id="btnSaveUpdate" onclick="saveRecord('E');" style="display:none;">Update</button>
					<%if(fstatus.equals("N")){ %>
					<button type="button" class="btn btn-view" id="btnSave" onclick="saveRecord('N');">Save</button>
					<%}else if(fstatus.equals("E")){ %>
					<button type="button" class="btn btn-view" id="btnSave" onclick="saveRecord('E');">Update</button>
					<%} %> 
					<button type="button" class="btn btn-view" id="btnBack" onclick=''>Back</button>
					<!-- <button type="button" class="btn btn-view" id="btnReset" onclick=''>Reset</button> -->
				</div>
			  </div>
			</div>
		 </div>
      </form>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../resources/sits/DataTable/1.10.15/js/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
<script src="../resources/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
<script src="../resources/sits/DataTable/1.4.2/js/jszip.min.js"></script>
 <script>
      $(document).ready(function() {
    	    var t = $('#searchTableE').DataTable( {
    	    	"searching" : false,
				//"scrollY": "500px",
				"ordering": false,
				"scrollX": true,
				"scrollCollapse": true,
				"paging": true,
				//"lengthMenu": [[10, 25, 50,100,200,500, -1], [10, 25, 50,100,200,500, "All"]],
				"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
				"columnDefs": [ {
				"searchable": false,
				"orderable": false,
				"targets": 0
				} ],
    	         dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
            	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
       		    "<'row'<'col-sm-12'tr>>" +
        	    "<'row'<'col-sm-5'i><'col-sm-7'p>>",   
	        	buttons: [
	            	{	
   	                	extend: 'excelHtml5',
   	                	filename: '',
   	                	className: 'btn btn-view',
   	                	text	:'Download',
   	                	exportOptions: {
   	                    	columns: [ 0,1,2,3,4,5,6]
   	                	},
   	           		 }
	        	],
    	        columnDefs: [{ orderable: false, "targets": [0,2,3] },
   				  
   				 ],
    	        "order": [[ 1, 'asc' ]]
    	    } );
    	 
    	    t.on( 'order.dt search.dt', function () {
    	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
    	            cell.innerHTML = i+1;
    	        } );
    	    } ).draw();
    	} );
      
</script>
   </body>
</html>
 