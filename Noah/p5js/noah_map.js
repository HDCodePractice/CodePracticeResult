let onTop = false;
let twirling = false;
let end = true;
let twirls = 0;

let constantApples;
let apple;

function noah_indexToColRow(index) {
    return [int(index/gridSize), index%gridSize];
}

function applesInRow(row,array,gridSize) {
    apple = 0;
    for (let each = row * gridSize; each < (row+1) * gridSize; each++) {
        if (array.includes(each)) {
            apple += 1
        }
    }
    return apple;
}

function noah_getDirection(gridSize,snake,apples,direction,snakes){
    
    print(direction)
    let head = noah_indexToColRow(snake[0])
    let headidx = snake[0]
    let headrow = head[0]
    let headcol = head[1]

    let apple = noah_indexToColRow(apples[0])
    let appleidx = apples[0]
    let applerow = apple[0]
    let applecol = apple[1]

    if (applesInRow(headrow,constantApples,gridSize) >= 2 || twirling == true || onTop == true || end == false) {
        end = false;
        if (twirling == false) {
            if (direction == "l") {
                if (headidx == 0 || onTop == true) {
                    onTop = true;
                    return "d"
                } 
                if (headidx % gridSize == 1 && headidx > gridSize - 1 && onTop == false){
                    end = true;
                    return "u"; 
                } 
                return direction;

            } else if (direction == "d") {
                if (headidx === (gridSize * (gridSize-1))){
                    onTop = false;
                    return "r";
                } 
                return direction;

            } else if (direction == "r") {
                if (headidx % gridSize == gridSize - 1 && onTop == false){
                    return "u";
                } 
                return direction;

            } else if (direction == "u") {
                if (headidx % gridSize == gridSize - 1 && headidx != (gridSize * 2) - 1){
                    return "l";
                } else if (headidx % gridSize == gridSize - 1) {
                    twirling = true;
                    twirls = 0
                } 
                return "r";
            } 
        } else {
            if (headidx != 1) {
                if (twirls == 0) {
                    twirls = 1
                    return "l";
                } else if (twirls == 1) {
                    twirls = 2
                    return "d";
                } else if (twirls == 2) {
                    twirls = 3
                    return "l";
                } else if (twirls == 3) {
                    twirls = 0
                    return "u";
                }
            } else {
                twirling = false;
                return "l"
            }  
        }
    } else {
        if (headrow == 1) {
            twirling = true;
            onTop = true;
            return direction;
        } else {
            return "u"
        }
    }
}

function noah_newGame(){
    constantApples = apples;
    onTop = false;
    twirling = false;
    end = true;

    twirls = 0;
    apple = 0;
    
    return;
}

ais['noah'] = {
    getDirection: noah_getDirection,
    newGame: noah_newGame
};

