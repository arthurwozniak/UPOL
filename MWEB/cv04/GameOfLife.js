class GameOfLife {

    constructor(size) {
        this.size = size
        //this.board = Array(this.size).fill(0)
        //                             .map(x => Array(this.size).fill(0)
        //                                                       .map(x => Math.round(Math.random())))
        this.board = Array(this.size);
        for (i in this.board){
            this.board[i] = Array(this.size);
            for (var j = 0; j < size; j++){
                this.board[i][j] = Math.round(Math.random())
            }
        }
        console.log(this.board)
    }

    step() {
        var boardNext = Array(this.size).fill(0).map(x => Array(this.size).fill(0))
        var acc, x, y, dx, dy;
        for (x = 0; x < this.size; x++) {
            for (y = 0; y < this.size; y++) {
                acc = 0
                for (dx = (x > 0 ? x - 1 : 0); dx < (x + 1 < this.size ? x + 2 : this.size); dx++) {
                    for (dy = (y > 0 ? y - 1 : 0); dy < (y + 1 < this.size ? y + 2 : this.size); dy++) {
                        if ((dx == x) && (dy == y)) {
                            continue;
                        }
                        acc += this.board[dx][dy]
                    }
                }
                boardNext[x][y] = (acc == 3 ? 1 : (acc == 2 ? this.board[x][y] : 0))
            }
        }
        this.board = boardNext
    }
}

onmessage = function(e) {
    console.log("Received message");
    switch (e.data[0]) {
        case "new":
            console.log("New game")
            a = new GameOfLife(e.data[1]);
            break;
        case "current":
            break
        case "step":
            console.log("new step")
        default:
            a.step();
    }
    postMessage(a.board);
}
