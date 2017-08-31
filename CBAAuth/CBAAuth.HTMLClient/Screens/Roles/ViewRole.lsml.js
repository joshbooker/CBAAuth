/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewRole.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.Role.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.Role." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

