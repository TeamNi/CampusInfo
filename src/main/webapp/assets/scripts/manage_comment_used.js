var TableEditable = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" id="save0" class="form-control" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" id="save1" class="form-control" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="text" id="save2" class="form-control" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" id="save3" class="form-control" value="' + aData[3] + '" readonly="true">';
                jqTds[4].innerHTML = '<a class="edit" href="">Save</a>';
                jqTds[5].innerHTML = '<a class="cancel" href="">Cancel</a>';
            }
            
            function editRowUpdate(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" id="update0" class="form-control" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" id="update1" class="form-control" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="text" id="update2" class="form-control" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" id="update3" class="form-control" value="' + aData[3] + '" readonly="true">';
                jqTds[4].innerHTML = '<a class="update" id="update" href="">Update</a>';
                jqTds[5].innerHTML = '<a class="cancel" href="">Cancel</a>';
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 4, false);
                oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
                oTable.fnDraw();
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 4, false);
                oTable.fnDraw();
            }

            var oTable = $('#sample_editable_1').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 5,
                
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
            jQuery('#sample_editable_1_wrapper .dataTables_length select').select2({
                showSearchInput : false //hide search box with special css class
            }); // initialize select2 dropdown

            var nEditing = null;
            //获取项目名(项目的绝对位置)
            var pathName = window.location.pathname;
    		var projectName = pathName.substr(0,pathName.substr(1).indexOf('/') + 1);

            $('#sample_editable_1_new').click(function (e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData(['', '', '', '',
                        '<a class="edit" href="">Edit</a>', '<a class="cancel" data-mode="new" href="">Cancel</a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                editRow(oTable, nRow);
                nEditing = nRow;
            });

            $('#sample_editable_1 a.delete').live('click', function (e) {
                e.preventDefault();

                var replyid = $(this).attr("del-id");
        		//alert("window.location====="+window.location)
        		//alert("pathName====="+pathName)
        		//alert("pathName.substr(1)====="+pathName.substr(1));
        		//alert(pathName.substr(1).indexOf('/') + 1);
        		//alert(projectName+"======"+projectName);
                
                if (confirm("Are you sure to delete this row ?") == false) {
                    return;
                }
                
                //ajax
                $.ajax({
                	url : projectName + "/usedReply/" + replyid,
                	async : false,
                	type : "DELETE",
                	success : function(result){
                		alert(result.msg);
                		console.log(result.msg);
                	}
                });

                var nRow = $(this).parents('tr')[0];
                oTable.fnDeleteRow(nRow);
            });

            $('#sample_editable_1 a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            $('#sample_editable_1 a.edit').live('click', function (e) {
                e.preventDefault();

                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];

                if (nEditing !== null && nEditing != nRow) {
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    restoreRow(oTable, nEditing);
                    editRowUpdate(oTable, nRow);
                    nEditing = nRow;
                    $("#sample_editable_1 a.update").attr("update-id",$(this).attr("edit-id"));
                } else if (nEditing == nRow && this.innerHTML == "Save") {
                    /* Editing this row and want to save it */
                	//ajax
                	var usedid = $("#save0").val();
                	var userid = $("#save1").val();
                	var content = $("#save2").val();
                	$.ajax({
                		url : projectName + "/usedReply/",
                		type : "POST",
                		async : false,
                		data : {
                			"usedid" : usedid,
                			"userid" : userid,
                			"content" : content
                		},
                		success : function(result){
                			alert(result.msg);
                			console.log(result.msg);
                		},
                		error : function(XMLHttpRequest, textStatus, errorThrown){
                  		   console.log("readyState===========" + XMLHttpRequest.readyState);
                  		   console.log("status===========" + XMLHttpRequest.status);
                  		   console.log("statusText===========" + XMLHttpRequest.statusText);
                  		   console.log("responseText===========" + XMLHttpRequest.responseText);
                  		   if(XMLHttpRequest.status == 500) {
                  			   alert("失败！服务器内部错误：500，请检查你输入的数据");
                  		   }else if(XMLHttpRequest.status == 404){
                  			   alert("失败！未找到页面：404");
                  		   }else if(XMLHttpRequest.status == 200){
                  			   alert("成功！请刷新页面");
                  		   }
                  	   }
                	});
                	
                    saveRow(oTable, nEditing);
                    nEditing = null;
                } else {
                    /* No edit in progress - let's start one */
                	editRowUpdate(oTable, nRow);
                    nEditing = nRow;
                    $("#sample_editable_1 a.update").attr("update-id",$(this).attr("edit-id"));
                }
            });
            
            //修改
 		    $("#sample_editable_1 a.update").live("click", function(){
 		    	//ajax
 		    	var replyid = $(this).attr("update-id");
            	var usedid = $("#update0").val();
            	var userid = $("#update1").val();
            	var content = $("#update2").val();
            	$.ajax({
            		url : projectName + "/usedReply/" + replyid,
            		type : "PUT",
            		async : false,
            		data : {
            			"usedid" : usedid,
            			"userid" : userid,
            			"content" : content
            		},
            		success : function(result){
            			alert(result.msg);
            			console.log(result.msg);
            		},
            		error : function(XMLHttpRequest, textStatus, errorThrown){
              		   console.log("readyState===========" + XMLHttpRequest.readyState);
              		   console.log("status===========" + XMLHttpRequest.status);
              		   console.log("statusText===========" + XMLHttpRequest.statusText);
              		   console.log("responseText===========" + XMLHttpRequest.responseText);
              		   if(XMLHttpRequest.status == 500) {
              			   alert("失败！服务器内部错误：500，请检查你输入的数据");
              		   }else if(XMLHttpRequest.status == 404){
              			   alert("失败！未找到页面：404");
              		   }else if(XMLHttpRequest.status == 200){
              			   alert("成功！请刷新页面");
              		   }
              	   }
            	});
 		    });
        }

    };

}();