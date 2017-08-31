/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewProvider.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.Provider.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.Provider." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

