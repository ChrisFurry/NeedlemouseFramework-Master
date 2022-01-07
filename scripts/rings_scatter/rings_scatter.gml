function rings_scatter(x,y,amount){
	var ring_counter = 0;
	var ring_angle = 101.25;  // assuming 0=right, 90=up, 180=left, 270=down
	var flip = false;
	var speedvar = 4;
 
	// perform loop while the ring counter is less than number of lost rings
	while(ring_counter < amount)
	{
	    // create the ring
		var ring = instance_create_depth(x,y,depth,objRing);
		ring.xspeed = cosine[ring_angle] * speedvar;
		ring.yspeed = -sine[ring_angle] * speedvar;
		ring.movementActive = true;
		ring.collActive = true;
		ring.lifeTimerActive = true;
    
	    // ever ring created will moving be at the same angle as the other in the current pair, but flipped the other side of the circle
		 if flip == true
		{
			ring.xspeed = ring.xspeed * -1  // reverse ring's x speed
			ring_angle += 22.5  // we increment angle on every other ring which makes 2 even rings either side
		}
    
	    // toggle flip
	    flip = !flip  // if flip is false, flip becomes true and vice versa
    
	    // increment counter
	    ring_counter += 1
    
	    // if we are halfway, start second "circle" of rings with lower speed
		if(ring_counter mod 17 == 16){
			speedvar /= 2
			ring_angle = 101.25 // reset the angle
		}
	}
}