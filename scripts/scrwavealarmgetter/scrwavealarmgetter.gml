//i was using it for geting waves from btd x

exit;


_timers = []
_numbers = []
_delay = []
_timeov = 0
_timersov = []
_tms = []
_mytypes = []
_ovnums = 0

var _mytimers = []
var _mytimers_types = []

add_spawn = function (_start,_del,_num,_tp = -1){
    array_push(_timers,_start)
    array_push(_numbers,_num)
    array_push(_delay,_del)
    array_push(_timersov,0)
    array_push(_tms,0)
    array_push(_mytypes,_tp)
    _ovnums+=_num
}


/*

stack10/11

1 - stuffed bloon
	layer 1 - orange stuffed
	layer 2 - cyan stuffed 
	layer 3 - lime styffed 
	layer 4 - amber stuffed
	layer 5 - purple stuffed
	
2 - ninja bloon
	(dropped bloons have camo)
	1 - red
	2 - blue
	3 - green
	4 - yellow 
	5 - pink
	10 - rainbow (but drops bloons with layer 8 !!)
	11 - purple ? (idk if used)
	
3 - robo bloon
	(dropped bloons are lead)
	1 - red
	2 - blue
	3 - green
	4 - yellow 
	5 - pink
	10 - rainbow (but drops bloons with layer 8 !!)
	
4 - patrol bloon

5 - barrier bloon
	1-3 - green
	4-6 - pink

6 - planetraium bloon 
	layer = 10 - normal
	layer = 20 - harder 

7 - spectrum bloon

1 - red
1.5 - orange
2 - blue
2.5 - cyan
3 - green
3.5 - lime
4 - yellow
4.5 - amber
5 - pink
5.5 - purple
6 - black
6.1 - white
7 - zebras
8 - rainbow
8.5 - prismatic
18 - ceramic
48 - brick
93 - mini moab
68.5 - HTA
348 - MOAB
1248 - BFB
5248 - ZOMG
351 - DDT
318 - LPZ
593 - BRC
10068.5 - Primsatic HTA
2593 - Mega BRC 
248 - Rocket Blimp
918 - Storm LPZ
3318 - Deadly DDT
17248 - Party Blimp
*/

add_spawn(2,10,1,"Planetarium")
add_spawn(622,30,80,"s-yellow")
add_spawn(622,300,7,"mini moab")
add_spawn(622,15,5,"stuffed amber")
add_spawn(2701,360,1,"s_sh-mini moab")

/*
type 0 - normal
type 1 - tattered 
type 2 - shielded
type 3 - regrow
type 4 - camo
type 5 - lead
type 6 - static
type 7 - camo lead
type 8 - regrow tattered
type 12 - super shielded
type 13 - regrow shielded
*/



anynums = function (_array){
    var _nums = false
    for (var i = 0; i < array_length(_array); i++) {
    	if _array[i]>0{
            _nums = true
            break
        }
    }
    return _nums
}

var _arlen = array_length(_timers)
while (_ovnums>0) {
	
    for (var i = 0; i < _arlen; i++) {
        if _numbers[i]==0
            continue
        
    	if _timers[i]>0{
            _timers[i]--
            _tms[i]++
            _timersov[i]++
            if _timers[i]<=0{
                show_debug_message($"{i}|{_timersov[i]}")
                array_push(_mytimers,_timersov[i])
                
                if _mytypes[i] == -1
                array_push(_mytimers_types,i)
                else {
                	array_push(_mytimers_types,_mytypes[i])
                }
                
                _timers[i] = _delay[i]
                _numbers[i]--
                _ovnums--
            }
        }
    }
    
    
    _timeov++
}


stack1timer = 0
stack1delay = 35
stack1start = 6

stack2timer = 0
stack2delay = 35
stack2start = 11

var _num = 12
var _tm = 0
var _start = true

while (_num>0) {
    
	show_debug_message($"\n{_num}")
    
    if _start==true{
        stack1timer+=stack1start
        stack2timer+=stack2start
        _start = false
    }
    else {
        stack1timer+=stack1delay
        stack2timer+=stack2delay
    }
    show_debug_message($"T : {stack1timer} | {stack2timer}")
    
    _num--
}

moments = _mytimers



var _num = 0
var _old_diff = moments[0]
var _start_moment = moments[0]
var _types = ""
var _start_moment_num = 0

var _texts = ""

for (var i = 0; i < array_length(moments); i++) {
	var _value = moments[i]
    
    if i > 0{
        _value = moments[i] - moments[i-1]
    }
    
    //show_debug_message($"{_value} | {moments[i]}")
    
    if _value!=_old_diff{
        var _last_num = 0
        if _num>1{
            _last_num = -1
        }
        
        
         //_texts += $"\n{_start_moment} - {moments[i+_last_num]}\n{_old_diff} x {_num}\n=========================="
        _texts += $"\n{_num} | {_old_diff} | {_types}"
        
        _start_moment = moments[i]
        _start_moment_num = i
        
        _old_diff = _value
        _num = 0
        _types = ""
    }
    
    _types+=string(_mytimers_types[i])+","
    _num++
}

if moments[array_length(moments)-1] - moments[array_length(moments)-2] == _old_diff{
    var _nnum = array_length(moments)-1
    
    
    //_texts += $"\n{_start_moment} - {moments[_nnum]}\n{_old_diff} x {_num}\n=========================="
    _texts += $"\n{_num} | {_old_diff} | {_types}"
}
else {
    var _nnum = array_length(moments)-1
    
    var _last_num = 0
    if _num>1{
        _last_num = -1
    }
    
    
    //_texts += $"\n{_start_moment} - {moments[_nnum]}\n{_old_diff} x {_num}\n=========================="
    _texts += $"\n{_num} | {_old_diff} | {_types}"
    
}

show_debug_message(_texts)
clipboard_set_text(_texts)

game_end()


/*
var  _files = file_get_list("D://waves//N88",false)


moments = [
]

for (var i = 0; i < array_length(_files); i++) {
	
    if string_count(".yy",_files[i])>0
        continue
    
    var _txt = _files[i]
    
    _txt = string_replace(_txt,"moment_","")
    _txt = string_replace(_txt,".gml","")
    
    array_push(
        
        moments,
        real( _txt )
        
    )
    
}

array_sort(moments, function (current,next){
    return current - next;
} )


var _num = 0
var _old_diff = moments[0]
var _start_moment = moments[0]
var _start_moment_num = 0

var _texts = ""

for (var i = 0; i < array_length(moments); i++) {
	var _value = moments[i]
    
    if i > 0{
        _value = moments[i] - moments[i-1]
    }
    
    //show_debug_message($"{_value} | {moments[i]}")
    
    if _value!=_old_diff{
        var _last_num = 0
        if _num>1{
            _last_num = -1
        }
        
        
         //_texts += $"\n{_start_moment} - {moments[i+_last_num]}\n{_old_diff} x {_num}\n=========================="
        _texts += $"\n{_num} | {_old_diff}"
        
        _start_moment = moments[i]
        _start_moment_num = i
        
        _old_diff = _value
        _num = 0
    }
    
    _num++
}

if moments[array_length(moments)-1] - moments[array_length(moments)-2] == _old_diff{
    var _nnum = array_length(moments)-1
    
    
    //_texts += $"\n{_start_moment} - {moments[_nnum]}\n{_old_diff} x {_num}\n=========================="
    _texts += $"\n{_num} | {_old_diff}"
}
else {
    var _nnum = array_length(moments)-1
    
    var _last_num = 0
    if _num>1{
        _last_num = -1
    }
    
    
    //_texts += $"\n{_start_moment} - {moments[_nnum]}\n{_old_diff} x {_num}\n=========================="
    _texts += $"\n{_num} | {_old_diff}"
    
}

show_debug_message(_texts)
//show_message(_texts)
clipboard_set_text(_texts)

game_end()
*/
/*
var _num = 0
var _last_value = moments[0]
var _start_moment = moments[0]
var _end_moment = 0
for (var i = 0; i < array_length(moments); i++) {
	var _value = moments[i]
    
    if i > 0{
        _value = moments[i] - moments[i-1]
    }


    show_debug_message($"{_value} | {moments[i]}")
      
}
show_debug_message($"NUMBER : {array_length(moments)}")
*/


/*
var _tm = get_timer()

var _dash = 1
var _invincibility = 2

state = _invincibility | _dash
repeat (5000) {
if state & _invincibility and state & _dash{
    show_debug_message("all")
}
}

show_message($"TIMER : {(get_timer()-_tm)/1000}ms")



var _tm = get_timer()

dash = true
invincibility = true

repeat (5000) {
if invincibility==true and dash == true{
    show_debug_message("all")
}
}

show_message($"TIMER : {(get_timer()-_tm)/1000}ms")
*/
/*
var _file = file_text_open_read("upgrades.txt")

var _towers = 24
var _main_upgr = 2
var _left_upgr = 3
var _middle_upgr = 3
var _right_upgr = 3
var _spec_upgr = 3
var _main_text = ""

function get_tower_name(_name){
    
    var _nend_pos = string_pos("//",_name)-2
    _name = string_copy(_name,0,_nend_pos)
    _name = string_replace(_name," ","_")
    _name = string_lower(_name)
    
    return _name
}

function get_name(_name){
    
    var _str_w = string_width(_name)
    var _num_end = string_pos("$",_name)
    
    var _pos = 1
    while (string_copy(_name,_num_end-_pos,1)!=" ") {
    	_pos++
    }
    
    var _repalace = string_copy( _name,_num_end-_pos,_pos+1 )
    _name = string_replace(_name,_repalace,"")
    
    return _name
    
}

var _tower_name = file_text_read_string(_file)
//show_message(_tower_name)
_tower_name = get_tower_name(_tower_name)
for (var i = 0; i < _towers; i++) {

    for (var c = 0; c < _main_upgr; c++) {
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_name = get_name( file_text_read_string(_file) )
        
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_desc = file_text_read_string(_file)

        var _txtname = "\""+_tower_name+$"_main_{c}_name\":"
        var _txtdesc = "\""+_tower_name+$"_main_{c}_desc\":"
        _main_text+= _txtname+"\""+_upg_name+"\""+",\n"
        _main_text+= _txtdesc+"\""+_upg_desc+"\""+",\n"
    }
    
    file_text_readln(_file)
    file_text_readln(_file)
    
    for (var c = 0; c < _left_upgr; c++) {
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_name = get_name( file_text_read_string(_file) )
        
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_desc = file_text_read_string(_file)

        var _txtname = "\""+_tower_name+$"_left_{c}_name\":"
        var _txtdesc = "\""+_tower_name+$"_left_{c}_desc\":"
        _main_text+= _txtname+"\""+_upg_name+"\""+",\n"
        _main_text+= _txtdesc+"\""+_upg_desc+"\""+",\n"
    }
    
    file_text_readln(_file)
    file_text_readln(_file)
    
    for (var c = 0; c < _middle_upgr; c++) {
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_name = get_name( file_text_read_string(_file) )
        
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_desc = file_text_read_string(_file)

        var _txtname = "\""+_tower_name+$"_middle_{c}_name\":"
        var _txtdesc = "\""+_tower_name+$"_middle_{c}_desc\":"
        _main_text+= _txtname+"\""+_upg_name+"\""+",\n"
        _main_text+= _txtdesc+"\""+_upg_desc+"\""+",\n"
    }
    
    file_text_readln(_file)
    file_text_readln(_file)
    
    for (var c = 0; c < _right_upgr; c++) {
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_name = get_name( file_text_read_string(_file) )
        
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_desc = file_text_read_string(_file)

        var _txtname = "\""+_tower_name+$"_right_{c}_name\":"
        var _txtdesc = "\""+_tower_name+$"_right_{c}_desc\":"
        _main_text+= _txtname+"\""+_upg_name+"\""+",\n"
        _main_text+= _txtdesc+"\""+_upg_desc+"\""+",\n"
    }
    
    file_text_readln(_file)
    file_text_readln(_file)
    
    for (var c = 0; c < _spec_upgr; c++) {
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_name = get_name( file_text_read_string(_file) )
        
        file_text_readln(_file)
        file_text_readln(_file)
        
        var _upg_desc = file_text_read_string(_file)

        var _txtname = "\""+_tower_name+$"_spec_{c}_name\":"
        var _txtdesc = "\""+_tower_name+$"_spec_{c}_desc\":"
        _main_text+= _txtname+"\""+_upg_name+"\""+",\n"
        _main_text+= _txtdesc+"\""+_upg_desc+"\""+",\n"
    }
    
    //if i < _towers-1{
        file_text_readln(_file)
        var _numcheck = 50
        var _found = false
        while (_numcheck>0 and _found == false) {
        	
            var _text = file_text_read_string(_file)
            if _text!=""{
                _found = true
                var _tower_name = _text
                //show_message(_tower_name)
                _tower_name = get_tower_name(_tower_name)
                //show_message(_tower_name)
            }
            if _found == false
            file_text_readln(_file)
            _numcheck--
            
        }
    //}
    
}

clipboard_set_text(_main_text)

file_text_close(_file)
*/