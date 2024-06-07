<!-- @author Ashwani kumar  (27-Dec-2023)   -->  
<%@page import="com.sits.general.General"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.affiliation.common_master.manage_request_type_sub_type.ManageRequestTypeSubTypeModel"%>
<%@page import="com.sits.affiliation.common_master.manage_request_type_sub_type.ManageRequestTypeSubTypeManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />  
	<meta http-equiv="Expires" content="-1" />
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css"  type="text/css">
  <link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
  <script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/manage-request-type-sub-type.js"></script>
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
	
	
	</head>
</head>
<body>
 <% 
 String act="",isNocReq="",isAutonomos="";
ArrayList<ManageRequestTypeSubTypeModel>                 arrayList=null;
String xrequest                      =General.checknull(request.getParameter("xrequest"));
String xsubrequest                   =General.checknull(request.getParameter("xsubrequest"));
String xdisoder                      =General.checknull(request.getParameter("xdisoder")); 
String xis_active                    =General.checknull(request.getParameter("xis_active")); 


ManageRequestTypeSubTypeModel model=new ManageRequestTypeSubTypeModel();
model.setRequest_id(xrequest);
model.setSub_request_id(xsubrequest);
model.setDis_order(xdisoder);
model.setIs_active(xis_active);
   arrayList=ManageRequestTypeSubTypeManager.getList(model);

%>
 
 
<form name="managerequesttypeL" id="managerequesttypeL" action="" method="post" autocomlete="off">
   <div id="searchingTable1" class="scr0">
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
			<div class="page-header-1">
				<div class="col-sm-4 repTitle h5 ">List of Manage Request Type Sub Type (s)</div>
				<div class="col-sm-4 repTitle h6 text-center">Run Date : <%=General.currdate_time() %></div>
			</div>
    	<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" style="">
			<thead>
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">Request Type</th>
					<th class="text-center">Request Sub Type</th>
					<th class="text-center">Display Order</th>
					<th class="text-center">Is Active</th>
					<th class="text-center">Is noc required</th>
					<th class="text-center">Is autonomous</th>
					<th class="text-center">Edit</th>
					<th class="text-center">Delete</th>
			</thead>	
			<tbody>
			 <% 
	int i=0;
	if(arrayList.size()>0){
	for(ManageRequestTypeSubTypeModel htm: arrayList){
		i++;
		 if(htm.getIs_active().equals("Y")){
			 act="Yes"; 
		 }
		 else{
			 act="No";
		 }
		 
		 if(htm.getIs_noc_req().equals("Y")){
			 isNocReq="Yes"; 
		 }
		 else{
			 isNocReq="No";
		 }
		 
		 if(htm.getIs_autonomos().equals("Y")){
			 isAutonomos="Yes"; 
		 }
		 else{
			 isAutonomos="No";
		 }
		%>
                <tr>
					<td style="text-align:center; width:3%;"><%= i%></td>
					<td style="text-align:center; width:10%;"><%= htm.getRequest_id()%></td>
					<td style="text-align:center; width:10%;"><%= htm.getSub_request_id()%></td>
					<td style="text-align:center; width:10%;"><%= htm.getDis_order()%></td>
					<td style="text-align:center; width:6%;"><%=act%></td>
					<td style="text-align:center; width:10%;"><%=isNocReq%></td>
					<td style="text-align:center; width:10%;"><%=isAutonomos%></td>
					<td style="text-align:center;width:10%;"><a href="#"  id="EDIT_RECORD_" class="" style="color:blue;cursor: pointer;width:20%" onclick="editRecord('<%=htm.getId()%>','E')"><i class="fa fa-edit"></i>Edit</a></td>
		             <td style="text-align:center;width:10%;"><a href="#"  id="DELETE_RECORD_" class="" style="color:red;cursor: pointer;width:20%" onclick="editRecord('<%=htm.getId()%>','D')"><i class="fa fa-trash"></i>Delete</a></td>
				
				 </tr>
				  <%} 
	}%>  
			</tbody>
		</table>
		<input type="hidden" name="mrt_id" id="mrt_id" style="width:0px;" readOnly/>
        <input type="hidden" name="opt_typ" id="opt_typ" style="width:0px;" readOnly/>
	</div>
</form>
	<script src="../resources/sits/DataTable/1.10.15/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
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
    	    var t = $('#searchTable').DataTable( {
    	    	"lengthMenu": [[-1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
    	    	"searching" : false,
       			//"scrollY": "250px",
                "scrollX": true,
                "scrollCollapse": true,
                "paging": true,
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
   	                 	filename: 'Create And Manage Request Type',
   	                	className: 'btn btn-view',
   	               	    title: 'AFFILIATION MANAGEMENT',
   	                	text	:'Download',
   	                	exportOptions: {
   	                    	columns: [ 0,1,2,3,4]
   	                	},
   	           		 }
	        	],
    	        columnDefs: [{ orderable: false, "targets": [0,4,5,6] },
   				  
   				 ],
    	        "order": [[ 1, 'asc' ]]
    	    } );
    	 
    	    t.on( 'order.dt search.dt', function () {
    	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
    	            cell.innerHTML = i+1;
    	            t.cell(cell).invalidate('dom');
    	        } );
    	    } ).draw();
    	} );
      
</script>
</body>
</html>