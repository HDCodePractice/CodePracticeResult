function sicheng_getDirection(gridSize,snake,apples,direction){
    rows = []
    cols = []
    for (let appleIndex = 0; appleIndex < apples.length; appleIndex++) {
        const apple = apples[appleIndex];
        rows.push(int(apple/gridSize))
        cols.push(apple%gridSize)
    }
    if (snake[0]%gridSize < cols[0]) {
        if (direction != 'l' && !snake.includes(snake[0]+1)) {
            return 'r';
        } else {
            if (int(snake[0]/gridSize) > rows[0] && !snake.includes(snake[0]-gridSize) && direction != 'd' && !snake.includes(snake[0]-gridSize)) {
                return 'u';
            } else if (int(snake[0]/gridSize) < rows[0] && direction != 'u' && !snake.includes(snake[0]+gridSize)) {
                return 'd';
            } else if (snake[0]%gridSize-1 < 0 && direction != 'r' && !snake.includes(snake[0]-1)) {
                return 'l';
            }
        }
    } else if (snake[0]%gridSize > cols[0]) {
        if (direction != 'r' && !snake.includes(snake[0]-1)) {
            return 'l';
        } else {
            if (int(snake[0]/gridSize) > rows[0] && !snake.includes(snake[0]-gridSize) && direction != 'd' && !snake.includes(snake[0]-gridSize)) {
                return 'u';
            } else if (int(snake[0]/gridSize) < rows[0] && direction != 'u' && !snake.includes(snake[0]+gridSize)) {
                return 'd';
            } else if (snake[0]%gridSize+1 >= gridSize && direction != 'l' && !snake.includes(snake[0]+1)) {
                return 'r';
            }
        }
    } else if (int(snake[0]/gridSize) > rows[0]) {
        if (direction != 'd' && !snake.includes(snake[0]-gridSize)) {
            return 'u';
        } else {
            if (snake[0]%gridSize < cols[0] && direction != 'r' && !snake.includes(snake[0]-1)) {
                return 'l';
            } else if (snake[0]%gridSize > cols[0] && direction != 'l' && !snake.includes(snake[0]+1)) {
                return 'r';
            }  else if (int(snake[0]/gridSize)+1 >= gridSize && direction != 'u' && !snake.includes(snake[0]+gridSize)) {
                return 'd';
            }
        }
    } else if (int(snake[0]/gridSize) < rows[0]) {
        if (direction != 'u' && !snake.includes(snake[0]+gridSize)) {
            return 'd';
        } else {
            if (snake[0]%gridSize < cols[0] && direction != 'r' && !snake.includes(snake[0]-1)) {
                return 'l';
            } else if (snake[0]%gridSize > cols[0] && direction != 'l' && !snake.includes(snake[0]+1)) {
                return 'r';
            } else if (int(snake[0]/gridSize)-1 < 0 && direction != 'd' && !snake.includes(snake[0]-gridSize)) {
                return 'u';
            }
        }
    }
    return direction;
}