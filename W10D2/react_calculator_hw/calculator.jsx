import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { res: 0, num1: "", num2: "", operation: " "};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    // this.clear = this.clear.bind(this); // can also use a fat arrow function in render
  }

  setNum1(e) {
    e.preventDefault();
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num1})
  }

  setNum2(e) {
    e.preventDefault();
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num2})
  }

  add(e) {
    e.preventDefault();
    const res = this.state.num1 + this.state.num2;
    const operation = "+";
    this.setState({ res });
    this.setState({ operation });
  }
  
  subtract(e) {
    e.preventDefault();
    const res = this.state.num1 - this.state.num2;
    const operation = "-";
    this.setState({ res });
    this.setState({ operation });
  }

  multiply(e) {
    e.preventDefault();
    const res = this.state.num1 * this.state.num2;
    const operation = "*";
    this.setState({ res });
    this.setState({ operation });
  }

  divide(e) {
    e.preventDefault();
    const res = +(Math.round((this.state.num1 / this.state.num2) + "e+2") + "e-2");
    const operation = "/";
    this.setState({ res });
    this.setState({ operation });
  }

  clear(e) {
    e.preventDefault();
    this.setState({num1: "", num2: "", res: 0, operation: " "});
  }

  render(){
    const {num1, num2, res, operation} = this.state;
    return (
      <div>
        <h1>{`The result of a ${this.state.operation} b is ${res}`}</h1>
        <label htmlFor="num1">a</label>
        <input onChange={this.setNum1} type="number" name="num1" value={num1} />
        <label htmlFor="num2">b</label>
        <input onChange={this.setNum2} type="number" name="num2" value={num2} />
        <button onClick={(e)=> this.clear(e)}> Clear </button>
        <br />
        <button onClick={this.add}> + </button>
        <button onClick={this.subtract}> - </button>
        <button onClick={this.multiply}> x </button>
        <button onClick={this.divide}> / </button>
      </div>
    );
  }
}

export default Calculator;
