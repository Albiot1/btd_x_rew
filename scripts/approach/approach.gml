/// @desc Move linearly value 1 to value 2 in the specified amount.
/// @param {Real} a First value.
/// @param {Real} b Second value.
/// @param {Real} amount Amount to move.
/// @returns {Real} 
function approach(a, b, amount) {
	//return a - clamp(a-b, -amount, amount);
	if (a < b) {
		return min(a + amount, b);
	} else {
		return max(a - amount, b);
	}
}