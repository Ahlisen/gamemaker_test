if(!dead) {
    part_particles_create(obj_particle_controller.partSystem,x,y,obj_particle_controller.bloodParticle,150);
    state = dying;
    image_index = 0;
}
