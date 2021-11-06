function sicheng2_getDirection(gridSize,snake,apples,direction){
    let row = int(snake[0]/gridSize);
    let col = snake[0]%gridSize;
    if (gridSize%2 === 0) {
        if (col === gridSize-1) {
            if (row == gridSize-1) {
                return 'l'
            } else {
                return 'd'
            }
        } else {
            if (row%2 !== 0 && col != 0) {
                return 'l'
            } else if ((row%2 === 0 &&  col < gridSize-2) || (row === 0 &&  col === gridSize-2)) {
                return 'r'
            } else {
                return 'u'
            }
        }
    } else {
        if (col === 0) {
            if (row === gridSize-1) {
                return 'r';
            } else {
                return 'd';
            }
        } else if (row < gridSize-3 && col > 0 && col < gridSize-1) {
            if ((row%2 === 0 && col !== 1) || (row === 0 && col === 1)) {
                return 'l';
            } else if (row%2 != 0) {
                return 'r';
            } else {
                return 'u';
            }
        } else if (row > gridSize-3 && row < gridSize && col > 0) {
            if ((direction === 'r' && row%2 === 0) || (row === gridSize-2 && col === gridSize-1)) {
                return 'u';
            } else if (direction === 'r' && row%2 !== 0) {
                return 'd';
            } else {
                return 'r';
            }
        } else {
            if (row%2 === 0 && col !== 1) {
                return 'l';
            } else {
                return 'u';
            }
        }
    }
}