import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======

=======
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
function Square(props) {
    return (
        <button className="square" onClick={props.onClick}>
            {props.value}
        </button>
    );
}

class Board extends React.Component {
    renderSquare(i) {
        return (
            <Square
                value={this.props.squares[i]}
                onClick={() => this.props.onClick(i)}
            />
        );
    }

    render() {
        return (
            <div>
                <div className="board-row">
                    {this.renderSquare(0)}
                    {this.renderSquare(1)}
                    {this.renderSquare(2)}
                </div>
                <div className="board-row">
                    {this.renderSquare(3)}
                    {this.renderSquare(4)}
                    {this.renderSquare(5)}
                </div>
                <div className="board-row">
                    {this.renderSquare(6)}
                    {this.renderSquare(7)}
                    {this.renderSquare(8)}
                </div>
            </div>
        );
    }
}

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
<<<<<<< HEAD
<<<<<<< HEAD
            history: [{
                squares: Array(9).fill(null)
            }],
=======
=======
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
            history: [
                {
                    squares: Array(9).fill(null)
                }
            ],
            stepNumber: 0,
<<<<<<< HEAD
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
=======
            history: [{
                squares: Array(9).fill(null)
            }],
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
            xIsNext: true
        };
    }

    handleClick(i) {
<<<<<<< HEAD
<<<<<<< HEAD
        const history = this.state.history;
=======
        const history = this.state.history.slice(0, this.state.stepNumber + 1);
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
        const history = this.state.history.slice(0, this.state.stepNumber + 1);
=======
        const history = this.state.history;
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
        const current = history[history.length - 1];
        const squares = current.squares.slice();
        if (calculateWinner(squares) || squares[i]) {
            return;
        }
<<<<<<< HEAD
<<<<<<< HEAD
        squares[i] = this.state.xIsNext ? 'X' : 'O';
        this.setState({
            history: history.concat([{
                squares: squares
            }]),
            xIsNext: !this.state.xIsNext,
=======
=======
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
        squares[i] = this.state.xIsNext ? "X" : "O";
        this.setState({
            history: history.concat([
                {
                    squares: squares
                }
            ]),
            stepNumber: history.length,
            xIsNext: !this.state.xIsNext
        });
    }

    jumpTo(step) {
        this.setState({
            stepNumber: step,
            xIsNext: (step % 2) === 0
<<<<<<< HEAD
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
=======
        squares[i] = this.state.xIsNext ? 'X' : 'O';
        this.setState({
            history: history.concat([{
                squares: squares
            }]),
            xIsNext: !this.state.xIsNext,
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
        });
    }

    render() {
        const history = this.state.history;
<<<<<<< HEAD
<<<<<<< HEAD
        const current = history[history.length - 1];
=======
        const current = history[this.state.stepNumber];
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
        const current = history[this.state.stepNumber];
=======
        const current = history[history.length - 1];
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
        const winner = calculateWinner(current.squares);

        const moves = history.map((step, move) => {
            const desc = move ?
                'Go to move #' + move :
                'Go to game start';
            return (
                <li key={move}>
                    <button onClick={() => this.jumpTo(move)}>{desc}</button>
                </li>
            );
        });

        let status;
        if (winner) {
<<<<<<< HEAD
<<<<<<< HEAD
            status = 'Winner: ' + winner;
        } else {
            status = 'Next player: ' + (this.state.xIsNext ? 'X' : 'O');
=======
            status = "Winner: " + winner;
        } else {
            status = "Next player: " + (this.state.xIsNext ? "X" : "O");
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
            status = "Winner: " + winner;
        } else {
            status = "Next player: " + (this.state.xIsNext ? "X" : "O");
=======
            status = 'Winner: ' + winner;
        } else {
            status = 'Next player: ' + (this.state.xIsNext ? 'X' : 'O');
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
        }

        return (
            <div className="game">
                <div className="game-board">
                    <Board
                        squares={current.squares}
<<<<<<< HEAD
<<<<<<< HEAD
                        onClick={(i) => this.handleClick(i)}
=======
                        onClick={i => this.handleClick(i)}
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
                        onClick={i => this.handleClick(i)}
=======
                        onClick={(i) => this.handleClick(i)}
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
                    />
                </div>
                <div className="game-info">
                    <div>{status}</div>
                    <ol>{moves}</ol>
                </div>
            </div>
        );
    }
}

// ========================================

<<<<<<< HEAD
<<<<<<< HEAD
=======
ReactDOM.render(<Game />, document.getElementById("root"));
=======
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
ReactDOM.render(
    <Game />,
    document.getElementById('root')
);
<<<<<<< HEAD
=======
ReactDOM.render(<Game />, document.getElementById("root"));
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc

function calculateWinner(squares) {
    const lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
<<<<<<< HEAD
<<<<<<< HEAD
        [2, 4, 6],
=======
        [2, 4, 6]
>>>>>>> 0cd903ca3c629bf78a6888e533c245323618172b
=======
        [2, 4, 6]
=======
        [2, 4, 6],
>>>>>>> 9af532da818b3b5a1aaeed49127d03b4c12691f4
>>>>>>> 4c392c7b58ef3ec275eca8519b4191e58860b7cc
    ];
    for (let i = 0; i < lines.length; i++) {
        const [a, b, c] = lines[i];
        if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
            return squares[a];
        }
    }
    return null;
}
