function importGmail(service)
{
	document.getElementById("addressSelectionDiv").style.display = 'none';
	document.getElementById("import" + service + "Logo").style.display = 'block';
	jQuery("#importText").html("<b>Please Wait...</b>");
	jQuery("#importDiv").html("");
	document.getElementById("importText").style.display = 'block';
	document.getElementById("importDiv").style.display = 'block';
	jQuery.ajax("/importGmail/?service=" + service, {
		complete:function(jqXHR, textStatus) {
			jQuery("#importDiv").html(jqXHR.responseText);
		}
	})		
}
function showAOLLogin(){
	document.getElementById("addressSelectionDiv").style.display = 'none';
	document.getElementById("importAOLLogo").style.display = 'block';
	jQuery("#importText").html("<b>Please Enter Your Username and Password:</b><br/><small><i>powered by</i></small> <a target='new' href='http://www.cloudsponge.com'>Cloudsponge</a>");
	jQuery("#importDiv").html("<b>Username</b>: <input type='text' size='20' id='username'><br/><b>Password</b>: <input type='password' size='25' id='password'><br/><br/><input type='button' value='Get Contacts' onclick='importAOL()'>&nbsp; &nbsp;<input type='button' value='Cancel' onclick='hideAOLLogin()'>");
	document.getElementById("importText").style.display = 'block';
	document.getElementById("importDiv").style.display = 'block';
}
function hideAOLLogin(){
	document.getElementById("addressSelectionDiv").style.display = 'block';
	document.getElementById("importAOLLogo").style.display = 'none';
	document.getElementById("importText").style.display = 'none';
	document.getElementById("importDiv").style.display = 'none';
}
function importAOL()
{
	username = document.getElementById('username').value;
	password = document.getElementById('password').value;
	if ((username == '') || (password == ''))
	{
		alert('You must enter a username and password to proceed!');
	}
	else
	{
		document.getElementById("importAOLLogo").style.display = 'block';
		jQuery("#importText").html("<b>Please Wait...</b>");
		jQuery("#importDiv").html("");
		document.getElementById("importText").style.display = 'block';
		document.getElementById("importDiv").style.display = 'block';
		jQuery.ajax("/importAOL/?service=AOL&username=" + username + "&password=" + password, {
			complete:function(jqXHR, textStatus) {
				jQuery("#importDiv").html(jqXHR.responseText);
			}
		});
	}

}
function importOutlook()
{
	document.getElementById("addressSelectionDiv").style.display = 'none';
	document.getElementById("importOutlookLogo").style.display = 'block';
	jQuery("#importText").html("<b>Please Wait...</b>");
	jQuery("#importDiv").html("");
	document.getElementById("importText").style.display = 'block';
	document.getElementById("importDiv").style.display = 'block';
	jQuery.ajax("/importOutlook/", {
		complete:function(jqXHR, textStatus) {
			jQuery("#importDiv").html(jqXHR.responseText);
		}
	});	
}
function importOSX()
{
	document.getElementById("addressSelectionDiv").style.display = 'none';
	document.getElementById("importOSXLogo").style.display = 'block';
	jQuery("#importText").html("<b>Please Wait...</b>");
	jQuery("#importDiv").html("");
	document.getElementById("importText").style.display = 'block';
	document.getElementById("importDiv").style.display = 'block';
	jQuery.ajax("/importOSX/", {
		complete:function(jqXHR, textStatus) {
			jQuery("#importDiv").html(jqXHR.responseText);
		}
	});		
}