
// 1.定义一个Chess,它是一个enum，一种是X，一种是O，还有一种是无，你可以使用这个enmm得到title、颜色
// 2.定义一个Grid，它是一个struct，它有column、row、chess属性
// 3. 使用 bord : [[Grid]] 存储棋盘，你需要写一个showBord帮你随时查看棋盘
// 4. putChess(bord:[[Grid]],chess:Chess,column,row) -> Bool ，返回如果是false，哪就代表这个位置不能下到一个棋
// 5. isGameOver(bord:[[Grid]]) -> Bool检查有没有人赢了比赛或所有的格子都满了
