var react_1 = require('react');
require('./input.less');
var HInput = function () {
    var store, field, rowSpan, colSpan, meta;
    return react_1.createClass({
        displayName: 'HInput',
        render: function () {
            var _this = this;
            return react_1.createElement('td', {
                colSpan: colSpan,
                rowSpan: rowSpan,
                onTouchTap: focusHandler,
                className: 'h_input_td'
            }, function () {
                var $ret = [];
                $ret.push(react_1.createElement('label', {
                    className: [
                        has_focus() || has_value() ? 'h_Input_LabelComValue' : '',
                        !(has_focus() || has_value()) ? 'h_Input_LabelSemValue' : '',
                        has_focus() && !has_error() ? 'focus' : '',
                        has_error() ? 'erro' : ''
                    ].join(' ')
                }, meta.labelText));
                if (!has_value() && has_focus()) {
                    $ret.push(react_1.createElement('label', {
                        className: [
                            true ? 'h_Input_LabelSemValue' : '',
                            has_error() ? 'erro' : ''
                        ].join(' ')
                    }, meta.hintText));
                }
                $ret.push(react_1.createElement('input', {
                    name: field,
                    type: meta.type,
                    value: meta.value,
                    title: meta.disabled || meta.hintText,
                    hintText: meta.hintText,
                    errorText: meta.errorText,
                    ref: 'h_input_' + field,
                    autoFocus: store.focus == meta,
                    disabled: meta.disabled,
                    onFocus: focusHandler,
                    onChange: changeHandler,
                    onBlur: blurHandler,
                    className: 'h_input'
                }));
                $ret.push(react_1.createElement('hr', {
                    className: [
                        true ? 'h_input_hr' : '',
                        has_error() ? 'h_input_hr_error' : ''
                    ].join(' ')
                }));
                if (has_focus()) {
                    $ret.push(react_1.createElement('hr', {
                        className: [
                            true ? 'h_input_hr_focus' : '',
                            has_error() ? 'h_input_hr_focus_error' : ''
                        ].join(' ')
                    }));
                }
                if (has_error()) {
                    $ret.push(react_1.createElement('span', { className: 'h_input_labelError' }, meta.errorText));
                }
                return $ret;
            }());
            function changeHandler(ev) {
                meta.value = ev.target.value;
                _this.setState({});
            }
            function focusHandler() {
                store.focus = meta;
                _this.setState({});
            }
            function blurHandler(ev) {
                if (store.focus == meta)
                    store.focus = null;
                meta.value = ev.target.value;
                meta.validate();
                _this.setState({});
            }
            function has_focus() {
                return store.focus == meta;
            }
            function has_error() {
                return !!meta.errorText;
            }
            function has_value() {
                return !!meta.value;
            }
        },
        componentWillMount: function () {
            store = this.props.store;
            field = this.props.field;
            rowSpan = this.props.rowSpan || 1;
            colSpan = this.props.colSpan || 1;
            meta = store.fields[field];
        }
    });
}();
exports.default = HInput;
