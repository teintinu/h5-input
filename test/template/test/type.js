this.InputBlur = function (driver) {
    GalenPages.extendPage(this, driver, {
        input: ".h_input"
    });
};
var page = new InputBlur(driver);
page.input.typeText('xx');
