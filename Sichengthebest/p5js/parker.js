function indexToColRow(index) {
    return [ int(index / gridSize) , index % gridSize];
}

function colRowToIndex(col, row) {
    return row * gridSize + col;
}

function containsObject(obj, list) {
    var i;
    for (i = 0; i < list.length; i++) {
        if (list[i] === obj) {
            return true;
        }
    }

    return false;
}

function predict_next_move(direction,head,gridSize){
    let nexthead
    if(direction === "r"){
        nexthead = head+1
    }else if(direction === "l"){
        nexthead = head-1
    }else if(direction === "u"){
        nexthead = head-gridSize
    }else if(direction === "d"){
        nexthead = head+gridSize
    }
    return(nexthead)
}

function move(darray, snake, cdirection, gridSize, head){
    if (containsObject(predict_next_move(cdirection,head,darray[0],gridSize ),snake)){
        if (containsObject(predict_next_move(cdirection,head,darray[1],gridSize),snake)){
            return darray[2]
        }else{
            return darray[1]
        }
    }else{
        return darray[0]
    }
}

function parker_getDirection(gridSize,snake,apples,direction){   
    // Variable Defining
    let head = indexToColRow(snake[0])
    let headidx = snake[0]
    let headrow = head[0] 
    let headcol = head[1]

    
    let apples2 = []

    for (var i = 0; i < apples.length; i++) {
        apples2.push(indexToColRow(apples[i]))
    }
    
    let apple = indexToColRow(apples[0])
    let appleidx = apples[0]
    let applerow = apple[0]
    let applecol = apple[1]
    

    // Variable Print Debugging
    // print(`head: ${head}`)
    // print(`headidx: ${headidx}`)
    // print(`headcol: ${headcol}`)
    // print(`headrow: ${headrow}`)

    // print(`apple: ${apple}`)
    // print(`appleidx: ${appleidx}`)
    // print(`applecol: ${applecol}`)
    // print(`applerow: ${applerow}`)

    // Logic


    // Find apple and don't hit neck
    // if (headrow > applerow){
    //     if (direction !== "d"){
    //         return move(["u","l","l"],snake,direction,gridSize,headidx)
    //     }else{
    //         return move(["r","u","d"],snake,direction,gridSize,headidx)
    //     }
    // }else if (headrow < applerow){
    //     if (direction !== "u"){
    //         return move(["d","l","r"],snake,direction,gridSize,headidx)
    //     }else{
    //         return move(["r","u","d"],snake,direction,gridSize,headidx)
    //     }
    // }else if (headrow === applerow){
    //     if (headcol > applecol){
    //         if (direction !== "r"){
    //             return move(["l","u","d"],snake,direction,gridSize,headidx)
    //         }else{
    //             return move(["u","l","r"],snake,direction,gridSize,headidx)
    //         }
    //     }else{
    //         if (direction !== "l"){
    //             return move(["r","u","d"],snake,direction,gridSize,headidx)
    //         }else{
    //             return move(["u","l","r"],snake,direction,gridSize,headidx)
    //         }
    //     }
    // }
    if (headrow > applerow){
        if (direction !== "d"){
            return "u"
        }else{
            return "r"
        }
    }else if (headrow < applerow){
        if (direction !== "u"){
            return "d"
        }else{
            return "r"
        }
    }else if (headrow === applerow){
        if (headcol > applecol){
            if (direction !== "r"){
                return "l"
            }else{
                return "u"
            }
        }else{
            if (direction !== "l"){
                return "r"
            }else{
                return "u"
            }
        }
    }

    // Don't hit body
    let nexthead = predict_next_move(direction, headidx,gridSize)
    if (containsObject(nexthead, snake)){

    }
}