<%@page import="com.sits.general.General" %>
<%@page import="com.sits.general.QueryUtil" %>
<%@page import="com.sits.general.ReadProps" %>
<%@include file="../myCks.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="../resources/js/affiliation/ques-sub-param-mast.js"></script>
	
	<script type="text/javascript" src="../resources/js/common/common.js"></script>	
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>
	<script type="text/javascript" src="../js/examCommonDropDown.js"></script>
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
<body  onload="getView();" >
<div class="row" style="padding-top:0px;margin:0px;">
					<div class="col-sm-12 errmessage1 text-center"  id="modifyStatus"></div>
				</div>
<div class="page-header-1">
							<div class="col-sm-12 repTitle h5 ">List of Questionnaire
								Sub Parameter Detail(s)</div>
								<div class="col-sm-4 repTitle h6 text-center"></div>
						</div>
						<div id="emp_nominee_detail"
							style="">
							<div id="END1" class="dataEntryDiv">
								<table id="searchTableE" border="1" cellspacing="1" cellpadding="1" width="99.6%" class="tableGrid">
								<thead>
									<tr>
										<th style="text-align: center; width: 3%;">S.No.</th>
										<th style="text-align: center; width: 15%;">Questionnaire Name</th>
										<th style="text-align: center; width: 20%;">Feedback Question Description</th>
										<th style="text-align: center; width: 10%;">Option Value</th>
										<th style="text-align: center; width: 10%;">Order No.</th>
										<th style="text-align: center; width: 10%;">Parameter Flag</th>
										<th style="text-align: center; width: 10%;">Sub Option Value</th>
										<th style="text-align: center; width: 7%;">Edit</th>
										<th style="text-align: center; width: 7%;">Delete</th>
									</tr>
									</thead>
									<tbody id="searchTable">
									</tbody>
								</table>
							</div>
						</div>
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
				  "info": false,
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
   	                	filename: 'Questionnaire_Sub_Parameter',
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