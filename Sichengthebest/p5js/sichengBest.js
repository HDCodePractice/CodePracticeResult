function sichengthebest_getDirection(gridSize,members,memberIndex,apples,direction){
    rows = []
    cols = []
    for (let appleIndex = 0; appleIndex < apples.length; appleIndex++) {
        const apple = apples[appleIndex];
        rows.push(int(apple/gridSize))
        cols.push(apple%gridSize)
    }
    if (direction == 'r') {
        if (members[memberIndex].snake[0]%gridSize < cols[0]) {
            if (sicheng_checkDirection(gridSize,members,memberIndex,apples,'r',direction)) {
                return 'r'
            } else {
                
            }
        } else if (int(members[memberIndex].snake[0]/gridSize) > rows[0]) {
            if (sicheng_checkDirection(gridSize,members,memberIndex,apples,'u',direction)) {
                return 'u'
            }
        }
    } else if (direction == 'l') {

    } else if (direction == 'u') {

    } else if (direction == 'd') {

    }
    return direction;
}

function sicheng_checkDirection(gridSize,members,memberIndex,apples,direction,old_direction) {

}