
// 0807 HomeWork
// 定义struce叫 Grid 和 Chess
// Chess 有 颜色:String、类型:String（N、A、B） 属性
// Chess 有一个方法 showString()->String，用于把这个Chess里的信息变成一个String方便你print
// Grid 有 chess:Chess、row:Int、column:Int 属性
// Grid 有一个方法 showString()->String，用于把这个Grid里的信息变成一个String方便你print

// 写一个函数, putChess(board:[[Grid]],chess: Chess,columNumber:Int)->[[Grid]] 用于在board指定的columnNumber里放入一个chess，它应该被放在最后一个不是空的地方，如果这个columNumber里被填满了，哪么返回一个[]空数组代表不能被放进去，如果放成功，返回放入后的board

// 写一个函数， isGameOver(board:[[Grid]],grid:Grid)->Bool，它用于计算最后一颗子放到了grid里时是否结束了游戏
// isGameOver分别会再调用 计算横、竖、左上右下、右上左下检查的四个函数数
// 写程序生成你想要的board，再看看isGameOver计算的是否正确
//写一个show函数showboard([[Grid]])用于将boardshow
