/*
    A simple swirly box / by Marcus Scheunemann
*/

// paramters
length  = 40;
height  = 100;
bHeight = 5;
rc      = 15;
scale   = 1.5;
twists  = 150;
wall    = 1.6;
$fn     = 120;

module round_square(l, r){
        minkowski()
        {
            circle(r);
            
            //resize square so the quadratic hull remains the same
            square(l- 2*r, center = true);
        }
}

module make_base() {
    
    linear_extrude(height = bHeight) { 
 
         offset(r = -wall)
        round_square(length, rc);

    }
       
}

module make_box() {
    
    linear_extrude(height = height, twist = twists, slices = height * 10, scale = scale, convexity = 100) { 
        difference() {
        
        round_square(length, rc);
        
         offset(r = -wall)
            round_square(length, rc);
        
    }
    }
    
}

union() {
    make_base();  
    make_box();
}