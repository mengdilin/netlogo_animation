Turtles-own [
  moving-left 
  moving-right 
  index]
Patches-own [next-pcolor]

To background
  Ask patches [
    If pycor >= -32 and pycor <= -16
    [set pcolor pink]
    If pycor > -16 and pycor <= 0
    [set pcolor green]
    If pycor > 0 and pycor <= 16
    [set pcolor sky]
    If pycor > 16 and pycor <= 32
    [set pcolor orange]]
end

To move-right
  ask patches [
    set next-pcolor [pcolor] of patch (pxcor - 1) pycor]
  ask patches [set pcolor next-pcolor]
end

To move-left 
  ask patches [
    set next-pcolor [pcolor] of patch (pxcor + 1) pycor]
  ask patches [set pcolor next-pcolor]
end

To go
  ifelse select = "a little"
  [experiment coke-side-effects]
  [if select = "very tired"
    [ex coffee-side-effect]]
end


;===================================================================================================================================
;COKE EPISODE

To coke-begin
  ca
  background
  crt 3
  ask turtle 0 [
    set xcor -38
    set ycor 10
    set label "If you need a little energy"
    set color orange]
  ask turtle 1 [
    set color sky
    set xcor -43
    set ycor 3
    set label "in the morning, you "]
  ask turtle 2 [
    set color sky
    set xcor -48
    set ycor -4
    set label "should drink this."]
end
   

To coke-setup
  ca
  background
  crt 2
  ask turtle 0 [set xcor 0 set ycor 0 set label " " set shape "person-1" set size 30 set heading 0]
  ask turtle 1 [set index 2 set shape "hand-1" set size 30 set heading 0] 
  repeat 18 [ask turtles [set xcor xcor - 1] wait 0.1]
  ask turtle 0 [set index 3 set shape "person-2"]
  
     crt 1
  ask turtle 2 [
    set shape "coke-1" 
    set size 30 
    set heading 0 
    set xcor 20]
 
  repeat 5 [ask turtle 0 [
    set shape (word "person-" index)set index index + 1 ] wait 0.2]
  repeat 3 [repeat 7 [
      ask turtle 1 [set heading heading - 2 set xcor xcor + 0.05] 
      Ask turtle 2 [set xcor xcor - 1.5]
      wait 0.1]
  ask turtle 1 [set shape (word "hand-" index) set index index + 1]]
  ask turtle 2 [set index 3]
  repeat 3 [
    ask turtle 2 [
      set xcor xcor - 1
      set shape (word "coke-" index) 
      set index index + 1]
       wait 0.1]
  ask turtle 2 [set index 8]
  repeat 3 [
    ask turtle 2
    [set shape (word "coke-" index)
        set index index + 1
        wait 0.1] 
    repeat 3 [ask turtles [set xcor xcor  + 2 ]] wait 0.1 
    repeat 2 [ask turtle 0 [set shape (word "person-" index) set index index + 1 wait 0.1]]]
end

  
To coke-sip
  ask turtles [die]
  import-pcolors "sip.nlogo" wait 0.2
  repeat 10 [move-right wait 0.1]
  repeat 13 [move-left wait 0.1]
  repeat 10 [move-right wait 0.1]
end

To coke
  ca
  background
  crt 4
  ask turtle 0 [set shape "person-9" set size 30]
  ask turtle 1 [set shape "hand-7" set heading 0 set size 30]
  ask turtle 2 [set shape "coke-7" set size 30 set xcor 20 set ycor 23  wait 0.2]
  ask turtle 3 [set shape "hands-1" set heading 0 set size 30]
  repeat 30  [ask turtle 2 [set size size - 1 set ycor ycor - 1 set xcor xcor + 0.3 wait 0.1 ]]
  ask turtle 2 [die]
  import-pcolors "burp.nlogo" 
  repeat 70 [move-right wait 0.05]
  ask turtle 1 [set shape "hand-1"]
  ask turtle 0 [set index 14 ]
  repeat 15 [ask turtle 0 [set shape (word "person-" index) set index index + 1 wait 0.2]]
  ask turtle 1 [set index 8]
  ask turtle 3 [set index 2]
  repeat 3 [
  ask turtle 0 [set shape (word "person-" index) set index index + 1]
  ask turtle 1 [set shape (word "hand-" index) set index index + 1]
  ask turtle 3 [set shape (word "hands-" index) set index index + 1] wait 0.2]
  import-pcolors "oh-yeah.nlogo"
  repeat 5 [
    repeat 2 [move-right]
    ask turtle 0 [set shape "person-32"] 
    ask turtle 1 [set shape "hand-11"]
    ask turtle 3 [set shape "hands-5"]
    wait 0.3
    repeat 2 [move-left]
    ask turtle 0 [set shape "person-33"] 
    ask turtle 1 [set shape "hand-10"]
    ask turtle 3 [set shape "hands-4"]
  wait 0.3]
  background
  crt 1
  ask turtle 4 [set label "THIS FEELS NICE" set xcor 20 set ycor -20]
  wait 3
end

To experiment
 coke-begin coke-setup coke-sip coke
end

To coke-side-effects
  ca
  background
  crt 6
  ask turtle 0 [
    set color orange
    set label "side effects:"
    set xcor -69
    set ycor 27]
  ask turtle 1 [
    set color orange
    set label "Not really that much unless"
    set xcor -35
    set ycor 20]
  ask turtle 2 [
    set color blue
    set label " you drink 10 cans a day for  "
    set xcor -32
    set ycor 13]
  ask turtle 3 [
    set color sky
    set label " 10 years with not much "
    set xcor -42
    set ycor 6]
  ask turtle 4 [
    set color green
    set label "exercise. Then, you may"
    set xcor -40
    set ycor -1]
  ask turtle 5 [
    set color green
    set label "become..."
    set xcor -7
    set ycor -7]
  wait 5
    ca
  background
  crt 1
  ask turtles [set shape "person-34" set size 30]
  crt 1
  ask turtle 1 [set shape "arrow-1" set size 20 set heading 0 set xcor 13 set ycor 13]
  crt 1
  ask turtle 2 [set label "300lb and 3ft tall" set xcor -42 set ycor -16]
  crt 1
  ask turtle 3 [set label "U" set xcor 20 set ycor 18] 
  wait 3
  ca
  import-pcolors "compare.nlogo"
  crt 4
  ask turtle 0 [set shape "new-person" set size 30 set xcor -23]
  ask turtle 1 [set shape "person-34" set size 50 set xcor 13]
  ask turtle 2 [set color orange set label "before" set ycor 30 set xcor -13]
  ask turtle 3 [set color orange set label "after" set ycor 30 set xcor 16]
  wait 3
   ca
  background
  crt 2
  ask turtle 0 [set label "Eventually, you will" set xcor 20 set ycor 10 set color sky]
  ask turtle 1 [set label "realize something..." set xcor 20 set ycor 5 set color sky]
  wait 3
  ca
  background
  crt 3
  ask turtle 0 [set size 40 set heading 0 set shape "person-34"]
  wait 0.2
  ask turtle 1 [set label "Oops, the shoelaces" set xcor 20 set ycor -25 set color pink] 
  ask turtle 2 [set label "are untied~~" set xcor 20 set ycor -30 set color pink]
  repeat 120 [ask turtle 2 [set heading 90 fd 1] wait 0.03]
  wait 1
  ask turtle 2 [die]
  ask turtle 1 [set label "REACH!!"set xcor 0 set ycor -25]
  repeat 10 [
  ask turtle 0 [
    set shape "person-38" wait 0.2
    set shape "person-39" wait 0.2 ]]
  wait 2
  
  ask turtle 1 [set label "AARRRHHH!!"set xcor -3 set ycor -25]
  repeat 3 [
  ask turtle 0 [
    set shape  "person-40" wait 0.2
    set shape "person-41" wait 0.2
    set shape "person-42" wait 0.2]]
  wait 1
  ask turtle 1 [set label "I can't reach my feet..." set xcor 20]
  ask turtle 0 [set index 43]
  repeat 10 [
  ask turtle 0 [set shape (word "person-" index) set index index + 1 wait 0.2]]
end






;==========================================================================================================================================================
;COFFEE EPISODE


To ex
coffee-begin coffee-setup coffee-sip coffee 
end

To coffee-begin
  ca
  background
  crt 3
  ask turtle 0 [
    set xcor -38
    set ycor 10
    set label "If you need some energy"
    set color orange]
  ask turtle 1 [
    set color sky
    set xcor -43
    set ycor 3
    set label "in the morning, you "]
  ask turtle 2 [
    set color sky
    set xcor -48
    set ycor -4
    set label "should drink this."]
end



To coffee-setup
  ca
  background
  crt 3
  ask turtle 0 [set xcor 0 set ycor 0 set label " " set shape "cperson-2" set size 30 set heading 0]
  ask turtle 1 [set index 2 set shape "hand-1" set size 30 set heading 0] 
  ask turtle 2 [set shape "hands-1" set size 30 set heading 0]
  repeat 18 [ask turtles [set xcor xcor - 1] wait 0.1]
  ask turtle 0 [set shape "cperson-2"]
  
     crt 1
  ask turtle 3 [
    set shape "coffee-1" 
    set size 30 
    set heading 0 
    set xcor 20]
 repeat 3[ask turtle 0 [set shape "cperson-3"] wait 0.3
 ask turtle 0 [set shape "cperson-3.1"] wait 0.3]
 ask turtle 0 [set index 3]
 
 repeat 5 [ask turtle 0 [
    set shape (word "person-" index)set index index + 1 ] wait 0.3]
 
  repeat 3 [repeat 7 [
      ask turtle 1 [set heading heading - 2 set xcor xcor + 0.05] 
      Ask turtle 3 [set xcor xcor - 1.5]
      wait 0.1]
  ask turtle 1 [set shape (word "hand-" index) set index index + 1]]
  ask turtle 3 [set index 3]
  repeat 3 [
    ask turtle 3 [
      set xcor xcor - 1
      set shape (word "coffee-" index) 
      set index index + 1]
       wait 0.1]
  ask turtle 3 [set index 8]
  repeat 3 [
    ask turtle 3
    [set shape (word "coffee-" index)
        set index index + 1
        wait 0.1] 
    repeat 3 [ask turtles [set xcor xcor  + 2 ]] wait 0.1 
    repeat 2 [ask turtle 0 [set shape (word "person-" index) set index index + 1 wait 0.1]]] 
end


To coffee-sip
  ask turtles [die]
  import-pcolors "sip.nlogo" wait 0.2
  repeat 10 [move-right wait 0.1]
  repeat 13 [move-left wait 0.1]
  repeat 10 [move-right wait 0.1]
end



To coffee
  ca
  background
  crt 4
  ask turtle 0 [set shape "person-9" set size 30]
  ask turtle 1 [set shape "hand-7" set heading 0 set size 30]
  ask turtle 2 [set shape "coffee-7" set size 30 set xcor 20 set ycor 23  wait 0.2]
  ask turtle 3 [set shape "hands-1" set size 30 set heading 0]
  repeat 30  [ask turtle 2 [set size size - 1 set ycor ycor - 1 set xcor xcor + 0.3 wait 0.1 ]]
  ask turtle 2 [die]
  import-pcolors "burp.nlogo" 
  repeat 70 [move-right wait 0.05]
  background
  ask turtle 1 [set shape "hand-1" set ycor ycor - 1.5]
  ask turtle 3 [set ycor ycor - 1.5]
  ask turtle 0 [set index 14 ]
  repeat 19 [ask turtle 0 [set shape (word "cperson-" index) set index index + 1 wait 0.2]]
  repeat 10 [
    ask turtle 3[set heading heading + 5] wait 0.05
    ask turtle 1 [set heading heading - 5] wait 0.05]
  
  ask turtle 1 [set shape "hand-7" set heading 0] 
  wait 0.1
  ask turtle 3 [set shape "hands-7" set heading 0]
  wait 0.1
  ask turtle 1 [set heading heading - 5 set ycor ycor + 1]
  wait 0.1
  ask turtle 3 [set heading heading + 5 set ycor ycor + 1]
  wait 0.1
  repeat 4[
  ask turtle 1 [set heading heading - 2 set ycor ycor + 0.5]
  ask turtle 3 [set heading heading + 2 set ycor ycor + 0.5]
  wait 0.3
  ask turtle 1 [set heading heading + 2 set ycor ycor - 0.5]
  ask turtle 3 [set heading heading - 2 set ycor ycor - 0.5]
  wait 0.3
  ]
  crt 2
  ask turtle 4 [set label "I feel...I feel..." set xcor 15 set ycor 20 set color orange]
  ask turtle 5 [set label "I feel like..." set xcor 15 set ycor -25 set color pink]
  ask turtle 0 [set index 33]
  repeat 9 [ask turtle 0 [set shape (word "cperson-" index) set index index + 1] wait 0.1]
  ask turtle 1 [set heading heading + 20]
  ask turtle 3 [set heading heading - 20]
  wait 0.3
  ask turtle 1 [set heading heading + 20]
  ask turtle 3 [set heading heading - 20]
  ask turtles [set xcor xcor + 2]
  import-pcolors "saiyan-1.nlogo"
  wait 0.2
  import-pcolors "saiyan-2.nlogo"
  wait 0.2
  import-pcolors "saiyan-3.nlogo"
  wait 0.2
  ask turtle 4 [set label "SUPER SAIYAN!!"]
  wait 2
  ask turtle 5 [set label "but shorter"]
  wait 3
end


To coffee-side-effect
  ca
  background
  crt 3
  ask turtle 0 [
    set color orange
    set label "Side Effects:"
    set xcor -60
    set ycor 23]
  ask turtle 1 [
    set color sky
    set label "Well..."
    set xcor 0
    set ycor 10]
  ask turtle 2 [
    set color green
    set label " Let's see... "
    set xcor 20
    set ycor -3]
  wait 3
    ask turtle 0 [
    set color orange
    set label "Short term:"
    set xcor -60
    set ycor 23]
  ask turtle 1 [
    set color orange
    set label "You may experience"
    set xcor 17
    set ycor 10]
  ask turtle 2 [
    set color green
    set label " this afterward  "
    set xcor 20
    set ycor -3]
  wait 3
  ca
  background
  crt 8
  ask turtle 0 [set shape "crash" set size 30 set heading 0]
  ask turtle 1 [
    set color sky
    set label "Huh?"
    set xcor 30
    set ycor 10]
  ask turtle 2 [
    set color green
    set label "What?"
    set xcor 30
    set ycor 0]
  ask turtle 3 [
    set color green
    set label "Hmmm?"
    set xcor 30
    set ycor -10]
  ask turtle 4 [
    set label "CRASH!"
    set xcor -60
    set ycor 23
    set color orange]
  ask turtle 5 [
    set color sky
    set label "CRASH!"
    set xcor -10
    set ycor 10]
  ask turtle 6 [
    set color green
    set label "CRASH!"
    set xcor -10
    set ycor 0]
  ask turtle 7 [
    set color green
    set label "CRASH!"
    set xcor -10
    set ycor -10]
  repeat 200 [ask turtles with [who != 0] [fd 1] wait 0.02]
   repeat 400 [ask turtles with [who != 0] [fd 1] wait 0.01 
   ask turtle 0 [set shape "crash-1"]
   ]
   ask turtle 0 [set shape "crash-1"]
   wait 0.1
   ask turtle 0 [set shape "crash"]
   wait 0.1
   ask turtle 1 [
    set xcor 30
    set ycor 10]
  ask turtle 2 [
    set xcor 30
    set ycor 0]
  ask turtle 3 [
    set xcor 30
    set ycor -10]
  ask turtle 4 [
    set xcor -60
    set ycor 23]
   ask turtle 5 [
    set xcor -10
    set ycor 10]
  ask turtle 6 [
    set xcor -10
    set ycor 0]
  ask turtle 7 [
    set xcor -10
    set ycor -10]
  wait 3
    ca
  background
  crt 2
 ask turtle 0 [
    set color orange
    set label "Long term:"
    set xcor -60
    set ycor 23]
  ask turtle 1 [
    set color sky
    set label "THIS..."
    set xcor 0
    set ycor 10]
  wait 3
    ca
  background
  crt 3
  ask turtle 0 [
    set color orange
    set xcor -40
    set ycor 23
    set label "COFFEE ADDICTION"]
  ask turtle 1 [
    set shape "addiction"
    set size 20
    set xcor -20
    set index 1]
  ask turtle 2 [
    set shape "coffee-1"
    set size 30
    set heading 0
    set xcor 26]
  wait 0.2
  repeat 4 [
  ask turtle 1 [
    set shape (word "addiction-" index)
    set index index + 1]
  wait 0.2]
  repeat 10 [
  ask turtle 1 [ set heading 90
    set shape "addiction-5"
    fd 1]
  wait 0.1
  ask turtle 1 [
    set shape "addiction-4"
    fd 1]
  wait 0.1]
  crt 1
  ask turtle 3 [
    set label "COFFEE.. I WANT COFFEE..."
    set xcor 15
    set ycor -25]
 repeat 115 [ask turtle 3 [set heading 90 bk 1] wait 0.05]
 ask turtle 1 [
   set shape "addiction-6"]
 wait 0.3
end





@#$#@#$#@
GRAPHICS-WINDOW
531
10
931
431
32
32
6.0
1
30
1
1
1
0
1
1
1
-32
32
-32
32
0
0
1
ticks

BUTTON
27
152
121
185
coke
experiment
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
24
259
91
292
coffee
ex
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
28
195
161
228
coke's side effects
coke-side-effects
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
25
308
163
341
coffee's side effect
coffee-side-effect
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

CHOOSER
26
33
164
78
select
select
"a little" "very tired"
0

BUTTON
27
91
90
124
Go
Go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

@#$#@#$#@
WHAT IS IT?
-----------
This section could give a general understanding of what the model is trying to show or explain.


HOW IT WORKS
------------
This section could explain what rules the agents use to create the overall behavior of the model.


HOW TO USE IT
-------------
This section could explain how to use the model, including a description of each of the items in the interface tab.


THINGS TO NOTICE
----------------
This section could give some ideas of things for the user to notice while running the model.


THINGS TO TRY
-------------
This section could give some ideas of things for the user to try to do (move sliders, switches, etc.) with the model.


EXTENDING THE MODEL
-------------------
This section could give some ideas of things to add or change in the procedures tab to make the model more complicated, detailed, accurate, etc.


NETLOGO FEATURES
----------------
This section could point out any especially interesting or unusual features of NetLogo that the model makes use of, particularly in the Procedures tab.  It might also point out places where workarounds were needed because of missing features.


RELATED MODELS
--------------
This section could give the names of models in the NetLogo Models Library or elsewhere which are of related interest.


CREDITS AND REFERENCES
----------------------
This section could contain a reference to the model's URL on the web if it has one, as well as any other necessary credits or references.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

acoffee-1
true
0
Rectangle -1 true false 118 74 145 90
Polygon -1 true false 141 92 135 152 120 153 117 90 142 89 140 97
Polygon -14835848 true false 141 109 120 108 120 125 140 125 138 109
Polygon -14835848 true false 142 92 120 93 121 97 141 98 141 92
Rectangle -1 true false 93 74 116 89
Polygon -1 true false 98 92 104 152 117 151 115 89 97 89 99 97
Polygon -14835848 true false 101 109 116 109 119 124 103 127 100 110
Polygon -14835848 true false 98 92 114 92 118 98 99 98 99 92

addiction
false
2
Circle -7500403 true false 197 107 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 150 165 150 180 195 210 285 210 300 180 210 180 180 165

addiction-1
false
2
Circle -7500403 true false 197 96 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 150 165 150 180 195 210 285 210 300 180 210 180 180 165

addiction-2
false
2
Circle -7500403 true false 192 88 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 150 165 150 180 195 210 285 210 300 180 210 180 180 165
Circle -16777216 true false 247 110 11
Line -16777216 false 246 95 235 116

addiction-3
false
2
Circle -7500403 true false 192 88 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 155 164 155 179 204 198 291 170 291 171 297 139 215 167 185 164
Circle -16777216 true false 247 110 11
Line -16777216 false 246 95 235 116

addiction-4
false
2
Circle -7500403 true false 192 88 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 155 164 155 179 204 198 293 154 291 171 295 125 215 167 185 164
Circle -16777216 true false 247 110 11
Line -16777216 false 246 95 235 116
Polygon -2674135 true false 275 131 265 132 265 143 273 141 276 130

addiction-5
false
2
Circle -7500403 true false 192 88 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 153 162 153 177 202 196 281 192 282 193 298 164 213 165 183 162
Circle -16777216 true false 247 110 11
Line -16777216 false 246 95 235 116
Polygon -2674135 true false 276 136 266 137 266 148 274 146 277 135

addiction-6
false
2
Circle -7500403 true false 192 88 85
Polygon -7500403 true false 210 166 75 166 75 136 210 136 210 166
Polygon -7500403 true false 180 135 105 90 105 120 135 135
Polygon -7500403 true false 105 165 15 195 15 165 75 150 15 135 15 105 105 135 105 165
Polygon -7500403 true false 153 162 153 177 202 196 281 192 282 193 298 164 213 165 183 162
Line -11221820 false 256 110 234 110
Polygon -2674135 true false 276 136 266 137 266 148 274 146 277 135
Polygon -11221820 true false 240 110 243 134 251 134 249 110

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

arrow-1
true
0
Polygon -1 true false 165 120 135 90 87 209 210 165 180 135
Polygon -1 true false 157 113 187 83 217 113 187 143 157 113

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

coffee-1
true
0
Rectangle -1 true false 120 90 180 105
Polygon -1 true false 128 107 134 167 166 168 173 104 127 104 129 112
Polygon -14835848 true false 130 126 171 126 168 143 132 144 129 127
Polygon -14835848 true false 128 106 174 106 172 111 129 112 129 106

coffee-10
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 157 143 158 161 169 160 171 143
Polygon -7500403 true false 157 143 147 143 150 150 144 154 152 156 150 164 160 159
Polygon -11221820 true false 137 105 120 90 119 94 138 107 131 105

coffee-2
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 163 143 164 160 169 160 171 143

coffee-3
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 163 143 164 160 169 160 171 143

coffee-4
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 157 143 158 161 169 160 171 143

coffee-5
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 157 143 158 161 169 160 171 143
Polygon -7500403 true false 157 143 147 143 150 150 144 154 152 156 150 164 160 159

coffee-7
true
0
Polygon -1 true false 128 107 134 167 166 168 173 104 127 104 129 112
Polygon -14835848 true false 130 126 171 126 168 143 132 144 129 127
Polygon -14835848 true false 128 106 174 106 172 111 129 112 129 106
Polygon -1 true false 154 62 204 83 195 97 152 76 152 61
Polygon -6459832 true false 137 106 140 94 149 94 153 84 161 90 170 90 180 93 173 100 162 103 137 104

coffee-8
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 157 143 158 161 169 160 171 143
Polygon -7500403 true false 157 143 147 143 150 150 144 154 152 156 150 164 160 159
Polygon -11221820 true false 128 104 125 102 131 101 138 107 131 105

coffee-9
true
2
Rectangle -1 true false 120 105 180 120
Polygon -1 true false 128 122 134 182 166 183 173 119 127 119 129 127
Polygon -14835848 true false 130 141 171 141 168 158 132 159 129 142
Polygon -14835848 true false 128 121 174 121 172 126 129 127 129 121
Polygon -7500403 true false 170 143 157 143 158 161 169 160 171 143
Polygon -7500403 true false 157 143 147 143 150 150 144 154 152 156 150 164 160 159
Polygon -11221820 true false 128 104 123 100 124 96 138 107 131 105

coke-1
true
3
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195

coke-10
true
4
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Polygon -7500403 true false 179 140 175 144 175 162 179 158 179 144
Polygon -7500403 true false 175 143 167 148 172 151 167 159 173 163 163 168 180 160 179 144
Polygon -7500403 true false 178 143 167 149 155 146 160 156 155 163 160 166 156 179 166 168 165 169 180 158 180 145
Circle -11221820 true false 135 112 7
Polygon -11221820 true false 138 117 120 91 123 87 140 116 137 116

coke-2
true
9
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Circle -6459832 true false 152 108 14

coke-3
true
3
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Polygon -7500403 true false 179 140 175 144 175 162 179 158 179 144

coke-4
true
3
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Polygon -7500403 true false 179 140 175 144 175 162 179 158 179 144
Polygon -7500403 true false 175 143 167 148 172 151 167 159 173 163 168 170 180 164 179 144

coke-5
true
3
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Polygon -7500403 true false 179 140 175 144 175 162 179 158 179 144
Polygon -7500403 true false 175 143 167 148 172 151 167 159 173 163 163 168 180 160 179 144
Polygon -7500403 true false 178 143 167 149 155 146 160 156 155 163 160 166 156 179 166 168 165 169 180 158 180 145

coke-7
true
7
Polygon -2674135 true false 127 119 124 139 134 160 124 179 135 200 158 200 176 205 190 174 179 148 187 127 177 115 168 128 146 124 141 127 124 124
Polygon -7500403 true false 176 115 156 115 144 116 137 113 128 125 140 126 145 123 168 128 177 117
Polygon -6459832 true false 147 120 140 134 151 134 148 150 155 159 150 173 153 187 159 198 157 206 156 215 164 217 165 207 163 195 164 185 160 175 160 164 166 153 159 145 158 135 152 123
Polygon -6459832 true false 169 123 174 141 169 148 178 167 183 180 197 182 187 175 183 159 181 142 177 132 171 120 162 122
Polygon -6459832 true false 133 122 127 132 131 145 127 158 127 178 134 188 135 176 130 166 131 156 136 150 133 137 133 125

coke-8
true
4
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Polygon -7500403 true false 179 140 175 144 175 162 179 158 179 144
Polygon -7500403 true false 175 143 167 148 172 151 167 159 173 163 163 168 180 160 179 144
Polygon -7500403 true false 178 143 167 149 155 146 160 156 155 163 160 166 156 179 166 168 165 169 180 158 180 145
Circle -11221820 true false 135 112 7

coke-9
true
4
Polygon -7500403 true false 135 105 165 105 180 120 165 135 135 135 120 120 135 105
Polygon -2674135 true false 120 120 135 135 165 135 180 120 180 180 165 195 135 195 120 180 120 120
Line -7500403 false 135 135 135 195
Line -7500403 false 165 135 165 195
Polygon -7500403 true false 179 140 175 144 175 162 179 158 179 144
Polygon -7500403 true false 175 143 167 148 172 151 167 159 173 163 163 168 180 160 179 144
Polygon -7500403 true false 178 143 167 149 155 146 160 156 155 163 160 166 156 179 166 168 165 169 180 158 180 145
Circle -11221820 true false 135 112 7
Polygon -11221820 true false 138 117 127 102 131 98 140 116 137 116

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cperson-13
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 151 84 8

cperson-14
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 20 145 26 145 33 150 30 149 26 150 20 149 19
Polygon -16777216 true false 159 20 165 23 167 27 173 34 165 30 169 34 165 27 159 23 158 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 141 20 135 23 133 27 127 34 135 30 131 34 135 27 141 23 142 20

cperson-15
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 20 145 26 150 30 149 26 150 20 149 19
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 159 20 165 23 167 27 165 30 165 27 159 23 158 20
Polygon -16777216 true false 141 20 135 23 133 27 135 30 135 27 141 23 142 20

cperson-16
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26

cperson-17
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -1184463 true false 109 72 101 70 103 61 101 46 105 41 108 30 119 33 121 22 142 18 150 12 167 18 178 18 179 26 190 31 189 41 199 54 196 63 200 70 189 79 192 66 191 51 184 35 173 24 158 20 143 19 126 27 121 32 114 38 111 48 108 62 110 73

cperson-18
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -1184463 true false 110 75 90 68 100 63 90 48 102 50 100 37 109 38 110 17 119 27 125 14 133 19 138 6 148 15 155 9 162 18 178 7 180 29 194 26 192 38 207 46 198 55 210 65 201 70 208 88 186 83 190 74 193 66 193 56 191 47 186 37 183 32 179 27 173 24 160 19 148 19 131 20 121 29 112 40 106 58 110 74

cperson-19
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -1184463 true false 110 75 90 68 100 63 90 48 102 50 100 37 109 38 110 17 119 27 125 14 133 19 138 6 148 15 155 9 162 18 178 7 180 29 194 26 192 38 207 46 198 55 210 65 201 70 208 88 186 83 190 74 193 66 193 56 191 47 186 37 183 32 179 27 173 24 160 19 148 19 131 20 121 29 112 40 106 58 110 74
Polygon -1184463 true false 146 21 138 24 138 33 137 39 134 33 134 23 136 18 141 18 146 19 147 23
Polygon -1184463 true false 154 21 162 24 162 33 163 39 166 33 166 23 164 18 159 18 154 19 153 23

cperson-2
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Line -16777216 false 171 51 155 50
Line -16777216 false 143 52 130 64
Line -16777216 false 170 64 156 62
Line -16777216 false 126 52 142 51
Line -16777216 false 131 65 145 63
Line -16777216 false 174 52 156 61
Circle -2674135 true false 144 79 10

cperson-20
false
2
Circle -7500403 true false 108 33 85
Polygon -7500403 true false 165 105 166 225 136 225 135 105 165 105
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 62 8
Circle -16777216 true false 133 63 8
Circle -2674135 true false 139 89 26
Polygon -1184463 true false 110 90 90 83 100 78 90 63 102 65 100 52 109 53 110 32 119 42 125 29 133 34 138 21 148 30 155 24 162 33 178 22 180 44 194 41 192 53 207 61 198 70 210 80 201 85 208 103 186 98 190 89 193 81 193 71 191 62 186 52 183 47 179 42 173 39 160 34 148 34 131 35 121 44 112 55 106 73 110 89
Polygon -1184463 true false 146 36 138 39 138 48 137 54 134 48 134 38 136 33 141 33 146 34 147 38
Polygon -1184463 true false 154 36 162 39 162 48 163 54 166 48 166 38 164 33 159 33 154 34 153 38

cperson-21
false
2
Circle -7500403 true false 108 33 85
Polygon -7500403 true false 165 105 166 225 136 225 135 105 165 105
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 62 8
Circle -16777216 true false 133 63 8
Circle -2674135 true false 139 89 26
Polygon -1184463 true false 146 36 138 39 138 48 137 54 134 48 134 38 136 33 141 33 146 34 147 38
Polygon -1184463 true false 154 36 162 39 162 48 163 54 166 48 166 38 164 33 159 33 154 34 153 38
Polygon -1184463 true false 107 88 72 74 92 74 82 50 103 50 103 19 125 29 146 6 157 20 181 9 186 31 220 36 206 50 229 67 214 74 236 87 189 98 192 78 193 67 187 57 180 44 170 39 161 35 134 35 124 42 114 58 108 67 111 90

cperson-22
false
2
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 165 120 166 225 136 225 135 120 165 120
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 77 8
Circle -16777216 true false 133 78 8
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107

cperson-23
false
3
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 77 8
Circle -16777216 true false 133 78 8
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107

cperson-24
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 127 78 10
Circle -16777216 true false 164 77 10

cperson-25
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 127 75 10
Circle -16777216 true false 164 74 10

cperson-26
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 128 71 10
Circle -16777216 true false 165 71 10

cperson-27
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 128 79 10
Circle -16777216 true false 165 78 10

cperson-28
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 127 84 10
Circle -16777216 true false 164 83 10

cperson-29
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 104 26
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 127 87 10
Circle -16777216 true false 163 86 10

cperson-3
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Line -16777216 false 171 51 155 50
Line -16777216 false 143 52 130 64
Line -16777216 false 170 64 156 62
Line -16777216 false 126 52 142 51
Line -16777216 false 131 65 145 63
Line -16777216 false 174 52 156 61
Circle -2674135 true false 144 79 10
Polygon -11221820 true false 151 86 154 91 159 90 162 93 164 89 159 88 158 85 155 85 153 85 151 86

cperson-3.1
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Line -16777216 false 171 51 155 50
Line -16777216 false 143 52 130 64
Line -16777216 false 170 64 156 62
Line -16777216 false 126 52 142 51
Line -16777216 false 131 65 145 63
Line -16777216 false 174 52 156 61
Circle -2674135 true false 140 75 18
Polygon -11221820 true false 151 86 154 91 159 90 162 93 164 89 159 88 158 85 155 85 153 85 151 86

cperson-30
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 142 107 20
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 128 82 10
Circle -16777216 true false 164 82 10

cperson-31
false
6
Circle -7500403 true false 108 48 85
Polygon -7500403 true false 172 121 172 226 128 226 127 121 172 121
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 146 110 14
Polygon -1184463 true false 146 51 138 54 138 63 137 69 134 63 134 53 136 48 141 48 146 49 147 53
Polygon -1184463 true false 154 51 162 54 162 63 163 69 166 63 166 53 164 48 159 48 154 49 153 53
Polygon -1184463 true false 110 102 72 64 101 68 92 38 115 53 110 13 134 43 138 2 155 41 165 14 175 38 195 17 190 39 202 31 197 67 208 57 191 104 191 82 180 61 167 53 151 49 128 54 114 70 107 83 110 107
Circle -1 true false 119 71 26
Circle -1 true false 156 71 26
Circle -16777216 true false 127 79 10
Circle -16777216 true false 165 78 10

cperson-32
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -1 true false 120 78 26
Circle -1 true false 156 77 26
Circle -16777216 true false 128 85 10
Circle -16777216 true false 165 85 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120

cperson-33
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -7500403 true false 180 195 195 285 165 285 150 225 135 285 105 285 120 195 180 195
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -1 true false 120 78 26
Circle -1 true false 156 77 26
Circle -16777216 true false 128 85 10
Circle -16777216 true false 165 85 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120

cperson-34
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -1 true false 120 78 26
Circle -1 true false 156 77 26
Circle -16777216 true false 128 85 10
Circle -16777216 true false 165 85 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210

cperson-35
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 128 85 10
Circle -16777216 true false 165 85 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210

cperson-36
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 137 87 10
Circle -16777216 true false 158 86 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210
Line -16777216 false 154 85 159 80
Line -16777216 false 146 85 141 80

cperson-37
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 137 87 10
Circle -16777216 true false 158 86 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210
Line -16777216 false 154 85 164 76
Line -16777216 false 146 85 136 76

cperson-38
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 137 87 10
Circle -16777216 true false 158 86 10
Polygon -2674135 true false 147 123 152 125 158 124 162 119 163 120
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210
Line -16777216 false 154 85 172 75
Line -16777216 false 148 85 129 76

cperson-39
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 137 87 10
Circle -16777216 true false 158 86 10
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210
Line -16777216 false 154 85 172 75
Line -16777216 false 148 85 129 76
Circle -2674135 true false 148 118 12

cperson-40
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 137 87 10
Circle -16777216 true false 158 86 10
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210
Line -16777216 false 154 85 172 75
Line -16777216 false 148 85 129 76
Circle -2674135 true false 145 114 18

cperson-41
false
6
Circle -7500403 true false 109 58 85
Polygon -7500403 true false 173 136 172 226 128 226 127 135 173 135
Polygon -1184463 true false 148 60 140 63 140 72 139 78 136 72 136 62 138 57 143 57 148 58 149 62
Polygon -1184463 true false 155 60 163 63 163 72 164 78 167 72 167 62 165 57 160 57 155 58 154 62
Polygon -1184463 true false 110 118 87 55 102 78 103 37 116 63 121 15 128 45 148 -9 164 35 173 11 176 48 186 22 191 49 202 37 198 77 209 67 192 114 192 92 181 71 168 63 152 59 129 64 115 80 108 93 111 117
Circle -16777216 true false 137 87 10
Circle -16777216 true false 158 86 10
Polygon -7500403 true false 120 210 180 210 195 285 165 285 165 240 135 240 135 285 105 285 120 210
Line -16777216 false 154 85 172 75
Line -16777216 false 148 85 129 76
Circle -2674135 true false 143 110 22

crash
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 180 210 105 180 105 165 135
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 159 35 8
Circle -16777216 true false 132 35 8
Circle -2674135 true false 142 77 20
Line -16777216 false 167 49 158 49
Line -16777216 false 159 49 155 46
Line -16777216 false 167 49 169 45
Line -16777216 false 133 49 131 45
Line -16777216 false 141 49 145 46
Line -16777216 false 133 49 142 49
Line -16777216 false 171 57 157 56
Line -16777216 false 157 56 155 53
Line -16777216 false 171 58 173 53
Line -16777216 false 129 55 142 56
Line -16777216 false 130 56 128 51
Line -16777216 false 141 56 145 54
Line -16777216 false 129 63 144 62
Line -16777216 false 143 63 146 60
Line -16777216 false 130 64 126 59
Line -16777216 false 158 64 173 63
Line -16777216 false 174 63 174 61
Line -16777216 false 158 64 156 61
Polygon -7500403 true false 135 180 90 105 120 105 135 135

crash-1
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 120 210 195 180 195 165 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 142 77 20
Line -16777216 false 153 45 177 46
Line -16777216 false 171 48 170 69
Line -16777216 false 168 46 167 64
Line -16777216 false 164 45 163 72
Line -16777216 false 160 46 160 61
Line -16777216 false 158 46 157 68
Line -16777216 false 142 46 143 68
Line -16777216 false 140 46 140 61
Line -16777216 false 136 45 137 72
Line -16777216 false 132 46 133 64
Line -16777216 false 129 48 130 69
Line -16777216 false 147 45 123 46
Polygon -7500403 true false 135 120 90 195 120 195 135 165

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

hand-1
true
2
Polygon -7500403 true false 210 195 180 195 165 165 165 120 210 195

hand-10
true
3
Polygon -7500403 true false 165 119 173 134 182 134 186 141 199 137 213 141 246 131 240 158 210 164 187 157 165 153 165 121

hand-11
true
3
Polygon -7500403 true false 162 119 170 134 185 131 199 137 215 130 232 133 255 126 252 151 234 160 214 153 162 153 162 121
Polygon -7500403 true false 212 152 196 160 181 153 163 160 163 152 210 153

hand-12
true
4
Polygon -7500403 true false 164 131 203 120 208 139 164 158 165 129
Polygon -7500403 true false 202 121 203 86 221 86 221 134 202 142
Polygon -955883 true false 164 132 170 122 183 121 187 122 194 117 202 117 221 131 219 142 213 145 203 144 198 152 191 152 184 150 180 156 169 157 163 155 164 129
Line -16777216 false 175 133 177 145
Line -16777216 false 178 131 181 144
Line -16777216 false 193 127 196 140
Line -16777216 false 196 128 200 139

hand-13
true
4
Polygon -7500403 true false 164 131 203 120 208 139 164 158 165 129
Polygon -7500403 true false 202 121 203 86 221 86 221 134 202 142
Polygon -955883 true false 164 132 170 122 183 121 187 122 194 117 202 117 221 131 219 142 213 145 203 144 198 152 191 152 184 150 180 156 169 157 163 155 164 129
Line -16777216 false 175 133 177 145
Line -16777216 false 178 131 181 144
Line -16777216 false 193 127 196 140
Line -16777216 false 196 128 200 139
Polygon -955883 true false 201 115 198 108 199 101 196 94 198 87 211 82 223 88 224 101 222 105 226 114 225 127 220 132
Line -16777216 false 209 111 218 112
Line -16777216 false 210 107 216 109
Line -16777216 false 209 95 214 95
Line -16777216 false 209 91 215 93

hand-2
true
2
Polygon -7500403 true false 210 195 180 195 165 165 165 120 210 195
Polygon -7500403 true false 165 121 161 110 161 153 171 179

hand-3
true
2
Polygon -7500403 true false 210 195 180 195 165 165 165 120 210 195
Polygon -7500403 true false 172 130 156 108 161 153 171 179
Polygon -7500403 true false 156 110 155 111 156 150 172 177

hand-4
true
2
Polygon -7500403 true false 210 195 180 195 165 165 165 120 210 195
Polygon -7500403 true false 165 121 161 110 161 153 171 179
Polygon -7500403 true false 163 117 150 120 156 150 172 177
Polygon -7500403 true false 165 120 150 120 151 141 169 171

hand-5
true
2
Polygon -7500403 true false 210 195 180 195 165 165 165 120 210 195
Polygon -7500403 true false 165 121 161 110 161 153 171 179
Polygon -7500403 true false 163 117 150 120 156 150 172 177
Polygon -7500403 true false 165 120 150 120 151 141 169 171

hand-5.1
true
2
Polygon -7500403 true false 187 163 171 174 164 163 164 118 188 159
Polygon -7500403 true false 165 121 165 120 161 153 171 179
Polygon -7500403 true false 163 117 150 120 156 150 172 177
Polygon -7500403 true false 165 120 150 120 151 141 169 171
Polygon -1 true false 188 160 183 174 165 180 165 165 165 167 185 154 188 161

hand-5.2
true
2
Polygon -7500403 true false 187 163 171 174 164 163 164 118 188 159
Polygon -7500403 true false 165 121 165 120 161 153 171 179
Polygon -7500403 true false 163 117 150 120 156 150 172 177
Polygon -7500403 true false 165 120 150 120 151 141 169 171
Polygon -1 true false 188 160 168 184 152 178 165 165 185 154 188 161

hand-6
true
2
Polygon -1 true false 188 160 183 174 153 194 145 182 165 167 185 154 188 161
Polygon -7500403 true false 152 121 152 138 167 164 185 154 165 115 153 120

hand-7
true
2
Polygon -7500403 true false 164 131 203 120 208 139 164 158 165 129
Polygon -7500403 true false 202 121 203 86 221 86 221 134 202 142

hand-8
true
3
Polygon -7500403 true false 164 120 172 135 181 135 186 149 197 156 195 169 211 183 191 200 181 184 170 179 165 166 164 122

hand-9
true
3
Polygon -7500403 true false 162 118 170 133 179 133 183 140 196 136 208 148 228 150 208 175 186 164 174 153 162 152 162 120

hands-1
true
3
Polygon -7500403 true false 135 120 135 165 120 195 90 195 135 120

hands-2
true
3
Polygon -7500403 true false 136 120 128 135 119 135 114 149 103 156 105 169 89 183 109 200 119 184 130 179 135 166 136 122

hands-3
true
3
Polygon -7500403 true false 138 118 130 133 121 133 117 140 104 136 92 148 72 150 92 175 114 164 126 153 138 152 138 120

hands-4
true
3
Polygon -7500403 true false 135 119 127 134 118 134 114 141 101 137 87 141 54 131 60 158 90 164 113 157 135 153 135 121

hands-5
true
3
Polygon -7500403 true false 138 119 130 134 115 131 101 137 85 130 68 133 45 126 48 151 66 160 86 153 138 153 138 121
Polygon -7500403 true false 88 152 104 160 119 153 137 160 137 152 90 153

hands-7
true
2
Polygon -7500403 true false 136 131 97 120 92 139 136 158 135 129
Polygon -7500403 true false 98 121 97 86 79 86 79 134 98 142

hands-8
true
4
Polygon -7500403 true false 136 131 97 120 92 139 136 158 135 129
Polygon -7500403 true false 98 121 97 86 79 86 79 134 98 142
Polygon -955883 true false 136 132 130 122 117 121 113 122 106 117 98 117 79 131 81 142 87 145 97 144 102 152 109 152 116 150 120 156 131 157 137 155 136 129
Line -16777216 false 125 133 123 145
Line -16777216 false 122 131 119 144
Line -16777216 false 107 127 104 140
Line -16777216 false 104 128 100 139

hands-9
true
4
Polygon -7500403 true false 136 131 97 120 92 139 136 158 135 129
Polygon -7500403 true false 98 121 97 86 79 86 79 134 98 142
Polygon -955883 true false 136 132 130 122 117 121 113 122 106 117 98 117 79 131 81 142 87 145 97 144 102 152 109 152 116 150 120 156 131 157 137 155 136 129
Line -16777216 false 125 133 123 145
Line -16777216 false 122 131 119 144
Line -16777216 false 107 127 104 140
Line -16777216 false 104 128 100 139
Polygon -955883 true false 99 115 102 108 101 101 104 94 102 87 89 82 77 88 76 101 78 105 74 114 75 127 80 132
Line -16777216 false 91 111 82 112
Line -16777216 false 90 107 84 109
Line -16777216 false 91 95 86 95
Line -16777216 false 92 91 86 93

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

new-person
false
2
Circle -7500403 true false 108 18 85
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Polygon -7500403 true false 145 101 147 218 155 218 154 102 154 87 145 101 142 89 147 121
Polygon -7500403 true false 150 150 188 125 191 130 153 155
Polygon -7500403 true false 147 150 115 126 112 131 147 157
Polygon -7500403 true false 151 205 128 264 133 268 152 210
Polygon -7500403 true false 153 213 175 265 183 263 148 199

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

person-1
false
2
Circle -7500403 true false 107 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 137 21 129 31 127 39 123 52 121 68 124 75 126 61 128 47 134 28 142 18 137 23
Polygon -16777216 true false 163 20 171 30 173 38 177 51 179 67 176 74 174 60 172 46 166 27 158 17 163 22
Polygon -16777216 true false 148 88 142 90 140 94 140 97 143 91
Polygon -16777216 true false 152 88 158 90 160 94 160 97 157 91
Polygon -16777216 true false 149 17 151 24 152 34 153 46 152 57 152 67 149 69 149 55 149 46 149 34 149 16

person-10
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 142 77 20

person-11
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 144 79 16

person-12
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 147 82 10

person-13
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 151 84 8

person-14
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 20 145 26 145 33 150 30 149 26 150 20 149 19
Polygon -16777216 true false 159 20 165 23 167 27 173 34 165 30 169 34 165 27 159 23 158 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 141 20 135 23 133 27 127 34 135 30 131 34 135 27 141 23 142 20

person-15
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 20 145 26 150 30 149 26 150 20 149 19
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 159 20 165 23 167 27 165 30 165 27 159 23 158 20
Polygon -16777216 true false 141 20 135 23 133 27 135 30 135 27 141 23 142 20

person-16
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26

person-17
false
2
Circle -7500403 true false 107 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -1 true false 161 22 166 25 165 30 160 19
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 150 21 149 27 152 28 150 21
Polygon -1 true false 141 23 136 26 137 31 142 20

person-18
false
2
Circle -7500403 true false 107 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 138 28 140 20 138 13 136 18 137 28
Polygon -1 true false 152 27 150 23 150 14 154 21 153 30
Polygon -1 true false 162 28 160 20 162 13 164 18 163 28

person-19
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 46 11
Circle -16777216 true false 128 47 11

person-2
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 88 142 90 140 94 140 97 143 91
Polygon -16777216 true false 152 88 158 90 160 94 160 97 157 91
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 164 49 8
Circle -16777216 true false 128 49 8

person-20
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 44 11
Circle -16777216 true false 128 45 11

person-21
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 139 74 26
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 41 11
Circle -16777216 true false 127 43 11

person-22
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 143 77 20
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 41 11
Circle -16777216 true false 127 43 11

person-23
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 146 81 12
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 41 11
Circle -16777216 true false 127 43 11

person-24
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Circle -2674135 true false 148 83 8
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 41 11
Circle -16777216 true false 127 43 11

person-25
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 41 11
Circle -16777216 true false 127 43 11
Polygon -2674135 true false 143 83 149 86 157 86 158 82 155 85 147 83 145 83

person-26
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 41 11
Circle -16777216 true false 127 43 11
Polygon -2674135 true false 143 83 149 86 157 86 158 82 155 85 147 83 145 83

person-27
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 43 11
Circle -16777216 true false 127 45 11
Polygon -2674135 true false 143 83 149 86 157 86 158 82 155 85 147 83 145 83

person-28
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 45 11
Circle -16777216 true false 128 46 11
Polygon -2674135 true false 143 83 149 86 157 86 158 82 155 85 147 83 145 83

person-29
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 176 195 195 285 165 285 150 225 135 285 105 285 128 196 164 197
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 45 11
Circle -16777216 true false 128 46 11
Polygon -2674135 true false 145 80 149 85 158 85 161 79 162 85 159 87 155 90 151 90 147 88 145 81

person-3
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 88 142 90 140 94 140 97 143 91
Polygon -16777216 true false 152 88 158 90 160 94 160 97 157 91
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 166 49 8
Circle -16777216 true false 129 49 8

person-30
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 165 210 165 225 150 225 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 45 11
Circle -16777216 true false 128 46 11
Polygon -2674135 true false 144 81 150 81 155 80 160 80 165 80 158 88 154 91 150 91 140 81 144 82
Polygon -7500403 true false 135 195 120 195 105 285 135 285 135 225 165 225 165 285 195 285 180 195 150 195

person-31
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 165 210 165 225 150 225 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 160 45 11
Circle -16777216 true false 128 46 11
Polygon -2674135 true false 144 81 150 81 155 80 160 80 165 80 158 88 154 91 150 91 140 81 144 82
Polygon -7500403 true false 135 195 120 195 90 285 120 285 135 225 165 225 180 285 210 285 180 195 150 195

person-32
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 165 210 165 225 150 225 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 163 45 11
Circle -16777216 true false 131 46 11
Polygon -2674135 true false 144 81 150 81 155 80 160 80 165 80 158 88 154 91 150 91 140 81 144 82
Polygon -7500403 true false 135 195 105 180 90 285 120 285 135 225 165 225 180 285 210 285 180 210 150 195

person-33
false
2
Circle -7500403 true false 106 17 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 165 195 165 210 165 225 150 225 135 195 165 195
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 139 33 137 29 136 22 137 11 141 17 140 23 141 30 142 35
Polygon -1 true false 163 32 167 27 167 20 168 11 166 10
Polygon -1 true false 151 29 150 26 149 21 150 15 151 8 153 13 153 18 155 26 151 35 151 30
Circle -1 true false 154 41 22
Circle -1 true false 123 42 22
Circle -16777216 true false 155 44 11
Circle -16777216 true false 124 46 11
Polygon -2674135 true false 144 81 150 81 155 80 160 80 165 80 158 88 154 91 150 91 140 81 144 82
Polygon -7500403 true false 165 195 195 180 210 285 180 285 165 225 135 225 120 285 90 285 120 210 150 195

person-34
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -7500403 true false 230 140 267 126 267 132 235 145
Polygon -7500403 true false 71 139 30 124 28 130 67 145
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247

person-35
false
4
Circle -7500403 true false 127 29 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 138 48 4
Circle -7500403 true false 54 68 198
Polygon -1 true false 210 148 247 134 247 140 215 153
Polygon -1 true false 99 152 58 137 56 143 95 158
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -16777216 true false 158 48 4
Circle -16777216 true false 138 48 4

person-36
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 223 167 247 134 247 140 229 169
Polygon -1 true false 80 170 58 137 56 143 74 176
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Circle -16777216 true false 159 51 4
Circle -16777216 true false 137 51 4

person-37
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Polygon -1 true false 82 179 58 137 56 143 78 186
Circle -16777216 true false 160 54 4
Circle -16777216 true false 137 55 4

person-38
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Polygon -1 true false 82 179 58 137 56 143 78 186
Line -16777216 false 162 45 157 48
Line -16777216 false 138 45 143 48

person-39
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -1 true false 201 169 246 135 248 141 207 175
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Polygon -1 true false 101 169 58 137 56 143 94 177
Line -16777216 false 164 43 157 48
Line -16777216 false 136 43 143 48

person-4
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 148 88 142 90 140 94 140 97 143 91
Polygon -16777216 true false 152 88 158 90 160 94 160 97 157 91
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 170 49 8
Circle -16777216 true false 134 49 8
Line -16777216 false 139 50 131 50
Line -16777216 false 175 50 167 51

person-40
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Polygon -1 true false 277 102 247 133 249 139 279 110
Line -16777216 false 166 41 157 48
Line -16777216 false 134 40 143 48
Polygon -1 true false 28 106 58 137 56 143 26 114

person-41
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Polygon -1 true false 285 123 247 133 249 139 287 130
Line -16777216 false 166 41 157 48
Line -16777216 false 134 40 143 48
Polygon -1 true false 20 123 58 137 56 143 16 129

person-42
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Circle -2674135 true false 145 57 10
Polygon -1 true false 277 102 247 133 249 139 279 110
Line -16777216 false 166 41 157 48
Line -16777216 false 134 40 143 48
Polygon -1 true false 28 106 58 137 56 143 26 114

person-43
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -16777216 true false 136 49 4
Circle -16777216 true false 160 49 4
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63

person-44
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49

person-45
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 57
Rectangle -11221820 true false 141 49 145 57

person-46
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 66
Rectangle -11221820 true false 141 49 145 65

person-47
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 81
Rectangle -11221820 true false 141 49 145 81

person-48
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 135
Rectangle -11221820 true false 141 49 145 135

person-49
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 181
Rectangle -11221820 true false 141 49 145 178

person-5
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 171 49 8
Circle -16777216 true false 139 49 8
Line -16777216 false 144 50 132 49
Line -16777216 false 176 50 163 49
Circle -2674135 true false 149 84 6

person-50
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 219
Rectangle -11221820 true false 141 49 145 216

person-51
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 49 161 257
Rectangle -11221820 true false 141 49 145 255

person-52
false
4
Circle -7500403 true false 127 33 46
Polygon -16777216 true false 162 23 164 25 164 28 161 20
Polygon -1 true false 140 40 138 36 137 29 138 9 141 5 141 30 142 37 143 42
Polygon -1 true false 162 40 166 35 166 28 169 10 166 8
Polygon -1 true false 151 36 150 33 149 28 150 6 153 6 153 20 153 25 155 33 151 42 151 37
Circle -7500403 true false 54 68 198
Polygon -1 true false 219 183 246 135 248 141 223 188
Polygon -7500403 true false 113 249 101 289 109 290 119 252
Polygon -7500403 true false 184 253 191 288 199 288 187 247
Polygon -1 true false 82 179 58 137 56 143 78 186
Polygon -2674135 true false 158 63 143 64 143 61 148 58 153 58 159 63
Line -11221820 false 162 49 154 49
Line -11221820 false 138 49 146 49
Rectangle -11221820 true false 157 48 162 288
Rectangle -11221820 true false 141 49 145 288

person-6
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 171 49 8
Circle -16777216 true false 139 49 8
Line -16777216 false 144 50 128 46
Line -16777216 false 176 50 159 46
Circle -2674135 true false 146 81 12

person-7
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 171 49 8
Circle -16777216 true false 139 49 8
Line -16777216 false 176 50 159 46
Circle -2674135 true false 139 74 26
Line -16777216 false 146 50 129 46

person-8
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 171 49 8
Circle -16777216 true false 139 49 8
Circle -2674135 true false 139 74 26

person-9
false
2
Circle -7500403 true false 108 18 85
Polygon -7500403 true false 166 90 166 225 136 225 136 90 166 90
Polygon -7500403 true false 135 120 90 195 120 195 135 165
Polygon -7500403 true false 165 195 195 285 165 285 150 225 135 285 105 285 135 195 165 195
Polygon -16777216 true false 159 20 165 23 167 27 173 34 173 43 169 34 165 27 159 23 158 20
Polygon -16777216 true false 148 20 145 26 145 33 147 41 148 44 149 39 149 26 150 20 149 19
Polygon -16777216 true false 141 20 135 23 133 27 127 34 127 43 131 34 135 27 141 23 142 20
Circle -16777216 true false 161 47 8
Circle -16777216 true false 133 48 8
Circle -2674135 true false 139 74 26

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 4.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
