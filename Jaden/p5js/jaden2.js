function indexToColRow(index) {
    return [ int(index / gridSize) , index % gridSize];
}
function jaden2_getDirection(gridSize,snake,apples,direction){
    let smallest = 0
    let appleDistance = gridSize * 2
    for (let i = 0; i < apples.length; i++) {
        let applerow = int(apples[i] / gridSize)
        let applecol = apples[i] % gridSize
        let snakerow = int(snake[0] / gridSize)
        let snakecol = snake[0] % gridSize
        let tempAppleDistance = abs(snakerow - applerow) + abs(snakecol - applecol)
        if (tempAppleDistance< appleDistance){
            smallest = i
            appleDistance = tempAppleDistance
        }
    }  
    
    let apple = indexToColRow(apples[smallest]);
    let snakeHead = indexToColRow(snake[0]);
    if (apple[0] < snakeHead[0]){
        if ( snake.includes( snake[0] - gridSize) ){
            if (direction === "r"){
                return "r";
            }
            return "l";
        }
        return 'u';
    }else if (apple[0] > snakeHead[0]){
        if ( snake.includes( snake[0] + gridSize) ){
            if (direction === "r"){
                return "r";
            }
            return "l";
        }
        return 'd';
    }else if (apple[1] < snakeHead[1]){
        if ( snake.includes( snake[0] - 1) ){
            if (direction === "d"){
                return "d";
            }
            return "u";
        }
        return 'l';
    }else if (apple[1] > snakeHead[1]){
        if ( snake.includes( snake[0] + 1) ){
            if (direction === "d"){
                return "d";
            }
            return "u";
        }
        return 'r';
    }else{
        return direction;
    }
}
function jaden2_newGame(){

    return;
}
