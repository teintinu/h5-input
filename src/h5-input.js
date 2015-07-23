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
            focus: false
        };
    },
    render: function () {


        var field = this.props.store.fields[this.props.field];
        var h_focus = this.props.store.fields._focus;

        var propsInput = {};
        propsInput.errorText = field.error ? field.error : ''
        propsInput.name = this.props.field;
        propsInput.value = field.value;
        propsInput.onFocus = this.focus;
        propsInput.hintText = field.hintText;
        propsInput.className = 'h_input';
        propsInput.ref = 'h_input_' + this.props.field;
        propsInput.autoFocus = h_focus == this.props.field ? true : false

        propsInput.onChange = this.changed;
        if (field.validations && field.validations.length)
            propsInput.onBlur = this.blur;

        var propstd = {
            colSpan: this.props.colSpan ? this.props.colSpan : null,
            rowSpan: this.props.rowSpan ? this.props.rowSpan : null,
            className: 'h_input_td',
            onTouchTap: this.focus
        };

        var classNameLabel = this.state.focus || propsInput.value || propsInput.value != '' ?
            'h_Input_LabelComValue ' + (this.state.focus ? propsInput.errorText ? 'erro' : 'focus' : propsInput.errorText ? 'erro' : '') :
            'h_Input_LabelSemValue ' + (propsInput.errorText ? 'erro' : '');


        return (
            React.createElement('td', propstd, [
                React.createElement('label', {
                    className: classNameLabel
                }, [field.labelText]),

                !propsInput.value && this.state.focus || propsInput.value == '' && this.state.focus ?
                React.createElement('label', {
                    className: ('h_Input_LabelSemValue ' + (propsInput.errorText ? 'erro' : ''))
                }, [field.hintText]) : null,

                React.createElement('input', propsInput),

                React.createElement('hr', {
                    className: 'h_input_hr ' + (propsInput.errorText ? 'h_input_hr_error' : '')
                }),

                this.state.focus ? React.createElement('hr', {
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
        this.props.store.fields[editing].value = ev.target.value;
        this.setState({});
    },
    focus: function (e) {
        this.setState({
            focus: true
        })
        var input = React.findDOMNode(this.refs['h_input_' + this.props.field]);
        input.focus();
    },
    blur: function (ev) {
        var editing = this.props.field;
        this.props.store.fields[editing].value = ev.target.value;
        this.props.store.fields[editing].validate(this.props.field, ev.target.value);
        this.setState({
            focus: false
        });
    }

});

module.exports = HInput;
