/*
Tables - {t1, t2, t3}
fridge = {fr1}
Boxes - {b1, b2, b3, b4} also containers
Ham - {h1, h2} also meat
Chicken - {c1, c2} also meat
Freezer - {f1}
Milk - {m1, m2}
Egg - {e1}
watermelon - {w1, w2} inside fridge
Sue - p1 
Tom - p2, drinks milk
Sam - p3, drinks almond, skim milk m2
Box 1 is blue and black and green, contains tables 1,2,3, egg 1, and ham 1,  belongs to Tom on bottom shelf
Box 2 is black and yellow, contains tables 1,2,3,  belongs to Tom on middle shelf
Box 3 is yellow, contains tables 1,2,3, and ham 2,  belongs to Sue on top shelpf
Box 4 is white,  belongs to Sue on top shelf
bowl - bo
Freezer 1 contains box 4
Inside is inverse of contain -lazy here havent defined all
/* Sunflower is Dirty hack for handling is there, wil always goive true*/
*/
model(
    [t1, t2, t3, b1, b2, b3, b4, h1, h2, f1, p1, p2, p3, m1, m2, e1, e2, e3, c1, c2, ba1, s1, s2, s3, w1, w2, fr1, bo],
    [
        [table,[t1, t2, t3]],
        [box,[b1, b2, b3, b4]],    
        [container,[b1, b2, b3, b4]],    
        [shelf, [s1, s2, s3]],
        [ham,[h1, h2]],
        [chicken,[c1, c2]],
        [bowl,[bo]],
        [meat,[h1, h2, c1, c2]],
        [milk,[m1, m2]],    
        [freezer,[f1, f2]],
        [fridge,[fr1]],
        [egg, [e1, e2 , e3]],
        [banana,[ba1]],
        [watermelon, [w1, w2]],
        [thing,[b1, b2, b3, b4, h1, h2, c1, c2, m1, m2, f1, f2, fr1, e1, e2, e3, ba1, w1, w2]],    
        [sue,[p1]],    
        [tom,[p2]],    
        [sam,[p3]],
        [bottom,[s1]],
        [middle,[s2]],
        [top,[s3]],
        [person,[p1, p2, p3]],    
        [blue, [b1]],
        [green, [b1]],
        [black, [b1, b2]],  
        [yellow, [b3, b2, bo]],
        [white, [b4]],
        [almond, [m2]],
        [skim, [m2]],
        [sunflower,[sunflower]], 
        [in, [w1, fr1],[w2, fr1]],
        [on, [
                [b1, s1],
                [b2, s2],
                [b4, s1],
                [b3, s3], 
                [bo, s2]
             ]
        ],
        [inside, [
                    [e1,b1], [ e1, fr1], 
                    [e2,b1], [e2,fr1], 
                    [t1,b1], [t1,b2], [t1,b3], [t1,fr1], 
                    [t2,b1], [t2,b2], [t2,b3], [t2,fr1],  
                    [t3,b1], [t3,b2], [t3,b3], [t3,fr1], 
                    [f1, fr1],
                    [f2, fr1],
                    [h1, b1],  [h1, fr1],
                    [h2, fr1], [h2, b3],
                    [b4, f1],[b4, fr1], 
                    [c1, f1],[c1, fr1],
                    [c2, f1],[c2, fr1],
                    [m1, b1], [m1, fr1]

                  ]
        ],
        [contain, [
                    [b1, t1], [b1,t2], [b1,t3], [b1, h1], [b1, e1], [b1, m1],
                    [b2,e1],[b2, t1], [b2,t2], [b2,t3], [b2, m2],
                    [b3, t1], [b3,t2], [b3,t3], [b3, h2],
                    [f1, b4], [f1, c1],[f1, c2], 
                    [bo, ba1],

                    [fr1, t1], [fr1,t2], [fr1,t3], [fr1, h1], [fr1, e1], [fr1,e1],
                    [fr1, t1], [fr1,t2], [fr1,t3], 
                    [fr1, t1], [fr1,t2], [fr1,t3], [fr1, h2],
                    [fr1, b4], [fr1, c1],[fr1, c2], [fr1, m1] , [fr1, m2] 

                  ]
        ],
        [belong, [
                    [b1, p2],[b2,p2],
                    [b3, p1],[b4,p1]
                 ]
        ] ,
        [drink, [
                   [p2, m1],[p3, m2]

                ]
        ],
        [drank, [
                   [p2, m1],[p3, m2]

                ]
        ]  

    ]
).