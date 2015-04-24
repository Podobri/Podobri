//  Author: Louis Holladay
//  Website: AdminDesigns.com
//  Last Updated: 01/01/14 
// 
//  This file is reserved for changes made by the user 
//  as it's often a good idea to seperate your work from 
//  the theme. It makes modifications, and future theme
//  updates much easier 
// 

//  Place custom styles below this line 
///////////////////////////////////////
$(document).ready(function() {
    $('.datepicker').datepicker();
    $('.hidden').prop('disabled', true);

    $("[type=checkbox]").on("click", function() {
        if ($(this).attr("checked") == undefined) {
            $(this).attr("checked", "checked");
        } else {
            $(this).attr("checked", false);
        }
    });
        // Add Placeholder text to datatables filter bar
    $('.dataTables_filter input').attr("placeholder", "������ ���....");
    // Manually Init Chosen on Datatables Filters
    $("select[name='datatable_length']").chosen();	
    // Init Xeditable Plugin
    $.fn.editable.defaults.mode = 'popup';
    $('.xedit').editable();
});

    fillAll = function() {
	$('input, textarea').each(function() {
	    name = $(this).attr('name');
	    $(this).val(name);
	});
	$('select').each(function() {
	    if ($(this).find('option').eq(0).val().length > 0)
	    {
		$(this).val($(this).find('option').eq(0).val());
	    }
	    else
	    {
		$(this).val($(this).find('option').eq(1).val());
	    }
	});
	$('checkbox').each(function() {
	    $(this).prop('checked', true);
	});
    };




function setDataTable(id, aTargets, displayLenght)
{
	if(typeof  displayLenght == 'undefined')
	{
        
		displayLenght = 5;
	}

    $('#'+id).dataTable( {
	"aoColumnDefs": [{ 'bSortable': false, 'aTargets': aTargets }],
	"oLanguage": {  "sUrl": base_url+"vendor/plugins/datatables/extras/TableTools/media/Bulgarian.txt" },
	"iDisplayLength": displayLenght,
	"aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
	"sDom": 'T<"clear">lfrtip',
	"oTableTools": {
	    "sSwfPath": base_url+"vendor/plugins/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf",
	    'aButtons': [
		{
		    'sExtends': 'copy',
		    'sButtonText': '�������',
		    'mColumns': 'all'},
		{
		    'sExtends': 'print',
		    'sButtonText': '�����',
		    'mColumns': 'all'}
	    ]
	}
    });
}

function setTagsManager(id)
{
    var container = id+'container';
    $('#'+id).tagsManager({
	tagsContainer: '#'+container,
	hiddenTagListName: '#'+id,
	tagClass: 'tm-tag-info',
	preventSubmitOnEnter: true
    }); 
}


/**** Get values of select field , seperated by coma  ****/
function checkAllSelectOptions(selectBox) {
    allDropDwonOptions = '';
    $(selectBox).find('option').each(function() {
	allDropDwonOptions += ($(this).val()) + ',';
    });
    return allDropDwonOptions;
}

/**** Remove option get it by value from select field  ****/
function removeFromSelectOptions(valueToDelete, selectBox) {
    $(selectBox).find('option').each(function() {
	if ($(this).val() === valueToDelete)
	{
	    $(this).remove();
	}
    });
}

function autoCompleter(autoCompleteFild , returnField, method){
    if(typeof(method)==='undefined') method = 'contact/autocomplete';
    var cache = {};
    $(autoCompleteFild).autocomplete({
	minLength: 2,
	messages: {
	    noResults: '',
	    results: ''
	},
	source: function(request, response) {
	    var term = request.term;
	    if (term in cache) {
		response(cache[ term ]);
		return;
	    }

	    $.getJSON(base_url+method, request, function(data, status, xhr) {
		cache[ term ] = data;
		response(data);
	    });
	},
	select: function(event, ui) {
	    var url = ui.item.id;
	    document.getElementById(returnField).value = url;
	}
    });
}

function custumAutoCompleter(name,value,obj){
    var data = $.map(obj, function(el) { return el; });
    $(name).autocomplete({
	source: data,
	select: function(event, ui) {
	    event.preventDefault();
	    $(name).val(ui.item.label);
	    $(value).val(ui.item.value);
	},
	focus: function(event, ui) {
	    event.preventDefault();
	    $(name).val(ui.item.label);
	},
	messages: {
	       noResults: '22',
	       results: function() {}
	   }
    });
}

function ajaxSendRequest(button,formID,functionName)
{
    $ (button).click(function () {
	var data = $(formID).serialize();
	$.ajax ({
	    type: "POST",
	    url: base_url+"ajax",
	    data: { function: functionName, data: data },
	    success: function(data) {
                //console.log(data);
		location.reload();
	    }
	}); 
    });
}