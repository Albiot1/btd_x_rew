/// @desc This is the inverse lerp. lerp() returns a blend between a and b, based on a fraction t. Inverse lerp returns a fraction t, based on a value between a and b.
/// @param {Real} minv The value of the lower edge
/// @param {Real} maxv The value of the upper edge
/// @param {Real} value he source value for interpolation.
function linearstep(minv, maxv, value) {
	return (value - minv) / (maxv - minv);
}