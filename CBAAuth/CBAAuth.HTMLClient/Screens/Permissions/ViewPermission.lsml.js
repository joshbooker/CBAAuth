/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewPermission.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.Permission.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.Permission." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

