import { h, Component } from "preact"

class Button extends Component {
  render (props, state) {
    return (
      <button className="button" type={props.type}>{props.label}</button>
    );
  }
}

export default Button
