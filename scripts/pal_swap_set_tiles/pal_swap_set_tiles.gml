function pal_swap_set_tiles(){
var _pal_sprite = argument[0];
var _pal_index = argument[1];
var _low = (argument[2] + 1);
var _high = (argument[3] - 1);
var _is_surface = argument[4];
if (_low < _high)
{
    _low = (argument[3] - 1);
    _high = (argument[2] + 1);
}
var _start_exists = 0;
var _end_exists = 0;
}