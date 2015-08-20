multiple = false
branches =! stmts.length = 1 && expression
return ce('div');

root ok
child ok

--------------------

multiple = false
branches = true

if x 
  return ce('div');
else 
  return ce('li');

root ok
chield function

--------------------
if x
  li
else 
  div
p

multiple = true
var $ret=[]
if x 
  $ret.push(ce('li'))
else 
  $ret.push(ce('div'))
$ret.push(ce('p'))
return $ret;

no root
children fn
-----------------------

var $ret=[];
while (n<1)
  $ret.push(ce('li'))
return $ret;

no root 
child function




