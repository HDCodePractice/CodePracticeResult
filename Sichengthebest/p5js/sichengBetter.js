function sicheng_getDirection(gridSize,members,memberIndex,apples,direction){
    rows = []
    cols = []
    for (let appleIndex = 0; appleIndex < apples.length; appleIndex++) {
        const apple = apples[appleIndex];
        rows.push(int(apple/gridSize))
        cols.push(apple%gridSize)
    }
    if (members[memberIndex].snake[0]%gridSize < cols[0]) {
        if (direction != 'l' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+1)) {
            return 'r';
        } else {
            if (int(members[memberIndex].snake[0]/gridSize) > rows[0] && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-gridSize) && direction != 'd' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-gridSize)) {
                return 'u';
            } else if (int(members[memberIndex].snake[0]/gridSize) < rows[0] && direction != 'u' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+gridSize)) {
                return 'd';
            } else if (members[memberIndex].snake[0]%gridSize-1 < 0 && direction != 'r' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-1)) {
                return 'l';
            }
        }
    } else if (members[memberIndex].snake[0]%gridSize > cols[0]) {
        if (direction != 'r' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-1)) {
            return 'l';
        } else {
            if (int(members[memberIndex].snake[0]/gridSize) > rows[0] && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-gridSize) && direction != 'd' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-gridSize)) {
                return 'u';
            } else if (int(members[memberIndex].snake[0]/gridSize) < rows[0] && direction != 'u' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+gridSize)) {
                return 'd';
            } else if (members[memberIndex].snake[0]%gridSize+1 >= gridSize && direction != 'l' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+1)) {
                return 'r';
            }
        }
    } else if (int(members[memberIndex].snake[0]/gridSize) > rows[0]) {
        if (direction != 'd' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-gridSize)) {
            return 'u';
        } else {
            if (members[memberIndex].snake[0]%gridSize < cols[0] && direction != 'r' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-1)) {
                return 'l';
            } else if (members[memberIndex].snake[0]%gridSize > cols[0] && direction != 'l' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+1)) {
                return 'r';
            }  else if (int(members[memberIndex].snake[0]/gridSize)+1 >= gridSize && direction != 'u' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+gridSize)) {
                return 'd';
            }
        }
    } else if (int(members[memberIndex].snake[0]/gridSize) < rows[0]) {
        if (direction != 'u' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+gridSize)) {
            return 'd';
        } else {
            if (members[memberIndex].snake[0]%gridSize < cols[0] && direction != 'r' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-1)) {
                return 'l';
            } else if (members[memberIndex].snake[0]%gridSize > cols[0] && direction != 'l' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]+1)) {
                return 'r';
            } else if (int(members[memberIndex].snake[0]/gridSize)-1 < 0 && direction != 'd' && !members[memberIndex].snake.includes(members[memberIndex].snake[0]-gridSize)) {
                return 'u';
            }
        }
    }
    return direction;
}