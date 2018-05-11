/*
Tables - {t1, t2, t3}
Boxes - {b1, b2, b3, b4}
Ham - {h1, h2}
Freezer - {f1}
Milk - {m1}
Egg - {e1}
Sue - p1 
Tom - p2, drinks milk
Box 1 is blue and black, contains tables 1,2,3, egg 1, and ham 1,  belongs to Tom 
Box 2 is black, contains tables 1,2,3,  belongs to Tom 
Box 3 is yellow, contains tables 1,2,3, and ham 2,  belongs to Sue 
Box 4 is white,  belongs to Sue 
Freezer 1 contains box 4
*/
model(
    [t1, t2, t3, b1, b2, b3, b4, h1, h2, f1, p1, p2, m1, e1],
    [
        [table,[t1, t2, t3]],
        [box,[b1, b2, b3, b4]],    
        [ham,[h1, h2]],    
        [milk,[m1]],    
        [freezer,[f1, f2]],
        [egg, [e1]],    
        [sue,[p1]],    
        [tom,[p2]],    
        [blue, [b1]],
        [black, [b1, b2]],  
        [yellow, [b3]],
        [white, [b4]],
        [contain, [
                    [b1, t1], [b1,t2], [b1,t3], [b1, h1], [b1, e1],
                    [b2, t1], [b2,t2], [b2,t3], 
                    [b3, t1], [b3,t2], [b3,t3], [b3, h2],
                    [f1, b4] 
                  ]
        ],
        [belong, [
                    [b1, p2],[b2,p2],
                    [b3, p1],[b4,p1]
                 ]
        ] ,
        [drink, [
                   [p2, m1]
                ]
        ]  

    ]
).