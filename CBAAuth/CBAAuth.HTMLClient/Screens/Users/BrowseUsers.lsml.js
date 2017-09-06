/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.BrowseUsers.created = function (screen)
{
    // Write code here.
    /////////////////////////////////////////////////////////////////
    //load client-side userPermissons array - happens once at startup
    ////myapp.userPermissions = [];
    ////myapp.activeDataWorkspace.ApplicationData.UserPermissions().execute()
    ////    .then(function (p)
    ////    {
    ////        p.data.forEach(function (p)
    ////        {
    ////            myapp.userPermissions.push(p.Name);
    ////        })
    ////    });
    /////////////////////////////////////////////////////////////////
    //setTimeout wrapper should only be required on the home screen due to timing on initial load of app
    //possible alternative to setTimeout may be to put the code in the PostRender method of the first Tab on the screen
    //setTimeout(function ()
    //{
    //    /////////////////////////////////////////////////////////////////
    //    // hide AddUser button based on permissions
    //    if (myapp.userPermissions && myapp.userPermissions.indexOf("Users_CanInsert") >= 0)
    //    {
    //        screen.findContentItem("AddUser").isEnabled = true;
    //    }
    //    else
    //    {
    //        screen.findContentItem("AddUser").isEnabled = false;
    //    }
    //    /////////////////////////////////////////////////////////////////
    //}, 1000);
    
};
