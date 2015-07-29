var React = require('react');
require('./input.less');
//require('./style.less');

var HInput = React.createClass({
    propTypes: {
        store: React.PropTypes.object.isRequired,
        field: React.PropTypes.string.isRequired,
        rowSpan: React.PropTypes.array.isRequired,
        colSpan: React.PropTypes.array.isRequired
    },
    getInitialState: function () {
        return {
            focused: false
        };
    },
    render: function () {


        var field = this.props.store.fields[this.props.field];
        var h_autofocus = this.props.store.fields._autofocus;

        var propsInput = {};
        propsInput.errorText = field.error ? field.error : ''
        propsInput.name = this.props.field;
        propsInput.type = field.type;
        propsInput.value = field.value;
        propsInput.onFocus = this.focusHandler;
        propsInput.hintText = field.hintText;
        propsInput.className = 'h_input';
        propsInput.ref = 'h_input_' + this.props.field;
        propsInput.autoFocus = h_autofocus == this.props.field ? true : false
        propsInput.disabled = field.disabled;
        propsInput.title = field.disabled || (field.value && field.hintText);


        propsInput.onChange = this.changed;
        if (field.validations && field.validations.length)
            propsInput.onBlur = this.blurHandler;

        var propstd = {
            colSpan: this.props.colSpan ? this.props.colSpan : null,
            rowSpan: this.props.rowSpan ? this.props.rowSpan : null,
            className: 'h_input_td',
            onTouchTap: this.focusHandler
        };

        var classNameLabel = this.state.focused || propsInput.value || propsInput.value != '' ?
            'h_Input_LabelComValue ' + (this.state.focused ? propsInput.errorText ? 'erro' : 'focus' : propsInput.errorText ? 'erro' : '') :
            'h_Input_LabelSemValue ' + (propsInput.errorText ? 'erro' : '');


        return (
            React.createElement('td', propstd, [
                React.createElement('label', {
                    className: classNameLabel
                }, [field.labelText]),

                !propsInput.value && this.state.focused || propsInput.value == '' && this.state.focused ?
                React.createElement('label', {
                    className: ('h_Input_LabelSemValue ' + (propsInput.errorText ? 'erro' : ''))
                }, [field.hintText]) : null,

                React.createElement('input', propsInput),

                React.createElement('hr', {
                    className: 'h_input_hr ' + (propsInput.errorText ? 'h_input_hr_error' : '')
                }),

                this.state.focused ? React.createElement('hr', {
                    className: 'h_input_hr_focus ' + (propsInput.errorText ? 'h_input_hr_focus_error' : '')
                }) : null,

                propsInput.errorText ?
                React.createElement('span', {
                    className: 'h_input_labelError'
                }, [propsInput.errorText]) : null
            ])
        );
    },
    changed: function (ev) {
        var editing = this.props.field;
        var ok = this[this.props.store.fields[editing].type](ev.target.value);
        this.props.store.fields[editing].value =
            ok ?
            ev.target.value :
            ev.target.value.substr(0, ev.target.value.length - 1);
        this.setState({});
    },
    focusHandler: function (e) {
        this.setState({
                focused: true
            })
            //        var input = React.findDOMNode(this.refs['h_input_' + this.props.field]);
            //        input.focus();
    },
    blurHandler: function (ev) {
        var editing = this.props.field;
        this.props.store.fields[editing].value = ev.target.value;
        var validations = this.props.store.fields[editing].validations;
        validations.forEach(function (func) {
            func(this.props.field, ev.target.value)
        }.bind(this));
        this.setState({
            focused: false
        });
    },
    numbers: function (value) {
        var ret = false;
        for (var i = 0; i < 10; i++) {
            if (value.charAt(value.length - 1).indexOf(i) != -1) {
                ret = true;
                break;
            }
        }
        return ret;
    }
});

module.exports = HInput;
