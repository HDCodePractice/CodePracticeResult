var cellSize = 80;
var gridSize = 4;
var scoreHeight = 200;
var grid;
var score;
var black = "rgb(0,0,0)"
var white = "rgb(250,250,250)"

function newGame() {
	grid = new Array(gridSize * gridSize).fill(0);
	gameOver = false;
	score = 0;
	addNumber();
	addNumber();
}

function setup() {
	createCanvas(cellSize * gridSize + 2, cellSize * gridSize + 2 + scoreHeight);
	newGame();
	updateCanvas();
}

function updateCanvas() {
	background(255);
	noStroke();
	drawText('Score:' + score,black, 20, width / 2, scoreHeight / 2);
	drawGrid();
}


function drawText(msg, color, size, x, y) {
	textSize(size);
	fill(color);
	text(msg, x, y);
}

function keyPressed() {
	if (keyCode === UP_ARROW || keyCode === DOWN_ARROW){
		verticalSlide(keyCode);
		updateCanvas();
	} else if (keyCode === LEFT_ARROW || keyCode === RIGHT_ARROW){
        horizontalSlide(keyCode);
		updateCanvas();
    }	
}
function verticalSlide(direction) {
	let past = [];
	arrayCopy(grid, past);
	for (let c = 0; c < gridSize; c++) {
		let column = getVerticalRow(c);
		column = combine(column, direction);
		column = column.filter(x => x > 0);
		var z = new Array(gridSize - column.length).fill(0);
		column = direction === UP_ARROW ? column.concat(z) : z.concat(column);
		setVerticalRow(column, c);
	}
	checkSlide(past);
}

function horizontalSlide(direction) {
	let past = [];
	arrayCopy(grid, past);
	for (let i = 0; i < gridSize; i++) {
		let row = grid.slice(i * gridSize, i * gridSize + gridSize);
		row = combine(row, direction);
		row = row.filter(x => x > 0);
		var z = new Array(gridSize - row.length).fill(0);
		row = direction === LEFT_ARROW ? row.concat(z) : z.concat(row);
		grid.splice(i * gridSize, gridSize);
		grid.splice(i * gridSize, 0, ...row);
	}
	checkSlide(past);
}

function checkSlide(past) {
	if (somethingMoved(past)) {
		addNumber();
	}
	if (!movesLeft()) {
		gameOver = true;
	}
}

function movesLeft() {
	for (let row = 0; row < gridSize; row++) {
		for (let col = 0; col < gridSize; col++) {
			var current = grid[row * gridSize + col];
			if (current === 0) {
				return true;
			}
			var right = (col < gridSize - 1) ? grid[row * gridSize + col + 1] : 0;
			var bottom = (row < gridSize - 1) ? grid[(row + 1) * gridSize + col] : 0;
			if (current === right || current === bottom) {
				return true;
			}
		}
	}
	return false;
}

function somethingMoved(past) {
	return !(grid.every((x, i) => x === past[i]));
}

function setVerticalRow(column, c) {
	for (let i = 0; i < column.length; i++) {
		var val = column[i];
		var idx = i * gridSize + c;
		grid[idx] = val;
	}
}

function getVerticalRow(c) {
	var result = [];
	for (let i = 0; i < gridSize; i++) {
		var val = grid[i * gridSize + c];
		result.push(val);
	}
	return result;
}

function combine(row, direction) {
	switch (direction) {
		case DOWN_ARROW:
		case RIGHT_ARROW:
			return combineDownRight(row);
		case UP_ARROW:
		case LEFT_ARROW:
			return combineUpLeft(row);
	}
}

function combineUpLeft(row) {
	var forStart = 0;
	return combineRow(row, forStart, (i, x) => i < x - 1, i => i + 1);
}

function combineDownRight(row) {
	var forStart = row.length - 1;
	return combineRow(row, forStart, (i, x) => i > 0, i => i - 1);
}

function combineRow(row, forStart, forCond, forIncr) {
	for (let i = forStart; forCond(i, row.length); i = forIncr(i)) {
		var a = row[i];
		let idx = forIncr(i);
		let b = row[idx];
		while (b === 0 && forCond(idx, row.length)) {
			idx = forIncr(idx);
			b = row[idx];
		}
		if (a === b && a !== 0) {
			row[i] = a + b;
			score += row[i];
			row[idx] = 0;
		}
	}
	return row;
}

function addNumber() {
	var opts = [];
	grid.forEach((x, i) => {
		if (x === 0) {
			opts.push(i);
		}
	});
	if (opts.length > 0) {
		var idx = opts[floor(random(opts.length))];
		var seed = random(1);
		grid[idx] = seed > 0.5 ? 4 : 2;
	}
}

function drawGrid() {
	for (let row = 0; row < gridSize; row++) {
		for (let col = 0; col < gridSize; col++) {
			var idx = row * gridSize + col;
            fill(white)

			strokeWeight(2);
			stroke(black)
			rect(col * cellSize + 1, row * cellSize + 1 + scoreHeight, cellSize, cellSize, 10);
			if (grid[idx] !== 0) {
				var msg = `${grid[idx]}`;
				var size = floor(map(sqrt(msg.length), 1, 3, 64, 14))-30;

				drawText(msg,black, size,col * cellSize + cellSize / 2, row * cellSize + cellSize / 2 + scoreHeight);
            }
		}
	}
} 