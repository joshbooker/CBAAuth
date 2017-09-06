/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.BrowseClients.created = function (screen) {
    // Write code here.
    //setTimeout wrapper should only be required on the home screen due to timing on initial load of app
    //possible alternative to setTimeout may be to put the code in the PostRender method of the first Tab on the screen
    //setTimeout(function ()
    //{
    //    ///////////////////////////////////////////////////////////////
    //   //hide AddUser button based on permissions
        if (myapp.userPermissions && myapp.userPermissions.indexOf("Clients_CanInsert") >= 0)
        {
            screen.findContentItem("AddClient").isEnabled = true;
        }
        else
        {
            screen.findContentItem("AddClient").isEnabled = false;
        }
    //    ///////////////////////////////////////////////////////////////
    //}, 2000);
};