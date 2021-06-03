let columns = [ 0 , 1 , 2 , 3 , 4 ]
for currentColumn in columns {
    world. place ( Gem (), atColumn : currentColumn, row : 1 )
    world. place ( Switch (), atColumn : currentColumn, row : 1 )
}
