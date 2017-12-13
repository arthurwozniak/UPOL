class Board {

    constructor(canvas, size) {
        this.size = size;
        this.canvas = oCanvas.create({
            canvas: "#" + canvas,
            background: "#D3D3D3",
            fps: 30
        });
        var cell_w = this.canvas.width / this.size
        var prototype_cell = this.canvas.display.rectangle({
            x: 0,
            y: 0,
            width: cell_w,
            height: cell_w,
            fill: "#FFFFFF",
            stroke: (this.size < 50 ? "inside 1px #000000" : "")
        });
        var cell;
        var cells = new Array(this.size * this.size)
        for (var i = 0; i < this.size; i++) {
            for (var j = 0; j < this.size; j++) {
                cell = prototype_cell.clone({
                    x: i * cell_w,
                    y: j * cell_w
                })
                cells[i * this.size + j] = cell
            }
        }
        this.canvas.children = cells
        this.canvas.redraw()
    }

    draw(board) {
        var cell;
        for (var i = 0; i < this.size; i++) {
            for (var j = 0; j < this.size; j++) {
                cell = this.canvas.children[i * this.size + j];
                if (board[i][j] == 1) {
                    cell.fill = "#FF0000"
                } else {
                    cell.fill = "#FFFFFF"
                }
            }
        }
        this.canvas.redraw();
    }
}

function start() {
    console.log("start")
    sizeInput.disabled = true
    resetButton.disabled = true
    stopButton.disabled = false
    startButton.disabled = true
    running = true;

}

function stop() {
    console.log("stop")
    resetButton.disabled = false
    stopButton.disabled = true
    startButton.disabled = false
    running = false;
}

function reset() {
    console.log("reset")
    startButton.disabled = false
    stopButton.disabled = true
    sizeInput.disabled = false
    sizeChanged()

}

function sizeChanged() {
    sizeInput.disabled = true
    console.log("Size changed: " + sizeInput.value)
    board = new Board("canvas", Number(sizeInput.value))
    worker.postMessage(["new", board.size])
    console.log("bar")
    sizeInput.disabled = false
}



if (window.Worker) {
    var startButton = document.getElementById("startBtn")
    var stopButton = document.getElementById("stopBtn")
    var resetButton = document.getElementById("resetBtn")
    var sizeInput = document.getElementById("sizeInput")
    var worker = new Worker('./GameOfLife.js')
    var board = new Board("canvas", Number(sizeInput.value))
    var running = false;

    stopButton.disabled = true;

    worker.onmessage = function(e) {
        console.log(e.data)
        board.draw(e.data)
    }
    worker.postMessage(["new", board.size])

    setInterval(function() {
        if (running) {
            worker.postMessage(["step"])
        }
    }, 100)

}
