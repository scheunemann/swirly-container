/*
    A simple swirly container / by Marcus Scheunemann
*/

/* [Base] */

size                = 40;

// (0 equals a square)
rounded_corners     = 15;

/* [Container] */ 

height          = 100;

bottom_height   = 5;

//Dependent of Height
twists          = 150;

direction       = 1; // [1:Left, -1:Right]

//thickness of wall
wall_thickness  = 1.6;

roundness = 100; // [1:100] 

//in relation to Base
opening_ratio   = 1.5;

/* [Hidden] */
scale = opening_ratio;
$fn     = roundness;

module round_square(l, r){
        minkowski()
        {
            if (r > 0)
                circle(r);
            
            //resize square so the quadratic hull remains the same
            square(l- 2*r, center = true);
        }
}

module make_base() {
    
    difference() {
        linear_extrude(height = height, twist = twists*direction, slices = height * 10, scale = scale, convexity = 100) { 
        
        round_square(size, rounded_corners);
        }
    
        // Hack
        translate([0,0, bottom_height+height/2])
            cube([size*scale*2,size*scale*2, height], center=true);
    }
       
}

module make_container() {
    
    linear_extrude(height = height, twist = twists*direction, slices = height * 10, scale = scale, convexity = 100) { 
        difference() {
        
        round_square(size, rounded_corners);
        
         offset(r = -wall_thickness)
            round_square(size, rounded_corners);
        
    }
    }
    
}

union() {
    make_base();  
    make_container();
}