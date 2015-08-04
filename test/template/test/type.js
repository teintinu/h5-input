this.InputType = $page('type', {
    input: ".h_input"
});
var page = new InputType(driver);
page.input.typeText('___text___');
