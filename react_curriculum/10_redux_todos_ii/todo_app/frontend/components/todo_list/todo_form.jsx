import React from "react";
import Util from "../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", body: "", done: false };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInput = this.handleInput.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();

    const todo = Object.assign({}, this.state);
    this.props
      .createTodo({ todo })
      .then(() => this.setState({ title: "", body: "" }));
  }

  handleInput(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <input
          className="input"
          type="text"
          value={this.state.title}
          name="title"
          onChange={this.handleInput}
        />
        <textarea
          className="input"
          type="text"
          name="body"
          value={this.state.body}
          onChange={this.handleInput}
        ></textarea>
        <input className="create-button" type="submit" value="Submit Todo" />
      </form>
    );
  }
}

export default TodoForm;
