/// @desc Performs smooth Hermite interpolation between 0 and 1.
/// @param {Real} minv The value of the lower edge of the Hermite function.
/// @param {Real} maxv The value of the upper edge of the Hermite function.
/// @param {Real} value The source value for interpolation.
/// @returns {Real}
function smoothstep(minv, maxv, value) {
	var t = clamp((value - minv) / (maxv - minv), 0, 1);
	return t * t * (3 - 2 * t);
}