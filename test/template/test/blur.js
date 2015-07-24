this.InputBlur = function (driver) {
    GalenPages.extendPage(this, driver, {
        btn_blur: ".btn_blur"
    });
};
var page = new InputBlur(driver);
page.btn_blur.click();
