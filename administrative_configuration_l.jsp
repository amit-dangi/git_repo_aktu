<!-- @author Ashwani kumar  (03-Jan-2024)   -->  
<%@page import="com.sits.general.General"%>
<%@page import="java.util.ArrayList"%>
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
<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/administrative-config.js"></script>
<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />



</head>
<body>
<% 
 String act="",comp="";
ArrayList<AdministrativeConfigurationModel>                 arrayList=null;
String doc_name                          =General.checknull(request.getParameter("xdoc_name"));
String req_name                          =General.checknull(request.getParameter("xreq_name"));
String sub_req_name                      =General.checknull(request.getParameter("xsub_req_name")); 
String is_comp                           =General.checknull(request.getParameter("xis_comp"));
String is_active                         =General.checknull(request.getParameter("xis_active"));

AdministrativeConfigurationModel model=new AdministrativeConfigurationModel();
/* model.setDoc_name(doc_name);
model.setReq_name(req_name);
model.setSub_req_name(sub_req_name);
model.setIs_comp(is_comp);
model.setIs_active(is_active); */
arrayList=AdministrativeConfigurationManager.getList(model);

%>
<form name="frmAdministrativeL" id="frmAdministrativeL" action="" method="post" autocomplete="off">
	<div id="searchingTable" class=" scr0">
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
		    <div class="col-sm-4 repTitle ">List of Administrative Configuration(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date :  <%=General.currdate_time() %>&nbsp;</div>	
	   </div>	
	<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
			<thead class="theadnew" >
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">Session</th>
					<th class="text-center">Request Type</th>
					<th class="text-center">Effective From</th>
					<th class="text-center">Edit</th>
					<th class="text-center">Delete</th>
				</tr>
			</thead>	
			<tbody>
					 <% 
	int i=0;
	if(arrayList.size()>0){
	for(AdministrativeConfigurationModel htm: arrayList){
		i++;
		 
		%> 
				 <tr>
					 <td style="text-align:center;width:5%;"><%=i %></td>
					 <td style="text-align:center;width:15%;"><%=htm.getSession() %></td>
					 <td style="text-align:center;width:12%;"><%=htm.getReq_type() %></td>
					 <td style="text-align:center;width:12%;"><%=htm.getEffective() %> </td>
					 <td style="text-align:center;width:10%;"><a href="#"  id="EDIT_RECORD_" class="" style="color:blue;cursor: pointer;width:20%" onclick="editRecord('<%=htm.getAdmc_id()%>','E')"><i class="fa fa-edit"></i>Edit</a></td>
		             <td style="text-align:center;width:10%;"><a href="#"  id="DELETE_RECORD_" class="" style="color:red;cursor: pointer;width:20%" onclick="editRecord('<%=htm.getAdmc_id()%>','D')"><i class="fa fa-trash"></i>Delete</a></td>
				 </tr> 
				  <%} 
	}%> 
			</tbody>
	</table>
	</div>
	<input type="hidden" name="admc_id" id="admc_id" style="width:0px;" readOnly/>
	<input type="hidden" name="opt_typ" id="opt_typ" style="width:0px;" readOnly/>
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
		
		       var t = $('#searchTable').DataTable({
		  		"searching" : false,
		  		"lengthMenu": [[-1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		  		//"scrollY": "200px",
		         "scrollX": true,
		         "scrollCollapse": true,
		         "paging":true,
		        
		  		"columnDefs": [{
		         	"searchable": false,
		         	"orderable": false,
		         	"targets": 0
		     	}],
		        "order": [[ 1, 'asc' ]],
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
		        	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
		   		  "<'row'<'col-sm-12'tr>>" +
				    	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
				buttons: [
				{	
				extend: 'excelHtml5',
				title: 'Administrative Configuration List',
				filename: 'Administrative Configuration',
				className: 'btn btn-view',
				text	:'Download',
				exportOptions: {
				columns: [ 0,1,2,3]
				},
				},
				],                      	       	
			     	columnDefs: [{ orderable: false, "targets":[0,3,4,5]}  
								],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	    </script>   
	  
	  <form name="actionForm" id="actionForm" method="post" action="" target="_parent"> 
	<input type="hidden" id="id" name="id" value="" >
	<input type="hidden" id="fstatus" name="fstatus"  />
	</form>
</body>
</html>