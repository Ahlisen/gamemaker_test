image_speed = ANIMATION*2;

if(animation_hit_frame(1)){
    var force = 1/(phy_speed+1);
    var newDir = abs(dir + random(60)-30);
    moveX = lengthdir_x(force,newDir);
    moveY = lengthdir_y(force,newDir);
    face = get_face(newDir);
    physics_apply_impulse(phy_position_x, phy_position_y,moveX,moveY);
    if(fear <= 0) {
        state = oldState;
        fear = ceil(fearThreshold/2);
    } else {
        fear -= 0;
    }
}
