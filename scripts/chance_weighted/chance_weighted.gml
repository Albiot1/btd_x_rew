///@desc Returns random item from first argument based on items weights
///@arg {Array} Items
///@arg {Array} Weights
///@return {Any}
function chance_weighted(_items, _weights) {
	var _isize = array_length(_items);
	var _wsize = array_length(_weights);
	// sum weights
	var _weights_sum = 0;
	var i = 0;
	repeat(_wsize) {
		_weights_sum += abs(_weights[i]);
		++i;
	}
	// randomize
	var _val = random(_weights_sum);
	i = 0;
	repeat(_isize) {
		_val -= abs(_weights[i]);
		if (_val < 0) return _items[i];
		++i;
	}
	return _items[0];
}