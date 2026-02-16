/// @desc This function moves linearly one angle to another by the specified amount.
/// @param {Real} angle Current angle.
/// @param {Real} dir Facing point direction.
/// @param {Real} amount The amount to move.
/// @returns {real} Description
function angle_towards(angle, dir, amount) {
	return median(-amount, amount, angle_difference(-dir, -angle));
}