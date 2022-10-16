///@func use_controls()
///@dependecies: none
function use_controls(){
	return new Controls();
}

function Controls() constructor {
	left = new Button(vk_left);
	right = new Button(vk_right);
	up = new Button(vk_up);
	down = new Button(vk_down);
	
	action = new Button(vk_space);
	confirm = new Button(vk_space);
	cancel = new Button(vk_escape);
		
	option1 = new Button(ord("Z"));
	option2 = new Button(ord("X"));
	
  ///Update this list with all buttons defined above.
	list = [left, right, up, down, action, confirm, cancel, option1, option2];
		
	update = function() {
		for(var _i = 0; _i < array_length(list); _i++) {
			list[_i].update();	
		}
	}
  
  zero = function(){
    for(var _i = 0; _i < array_length(list); _i++) {
			list[_i].reset();	
		}
  }
	
	getHori = function() {
		return right.held - left.held;	
	}
	getVert = function() {
		return down.held - up.held;	
	}
}

function Button(_key) constructor {
	key = _key;
	doubleTapGap = 10;
	reset = function() {
		pressed = false;
		doubleTapped = false;
		released = false;
		releasedTimer = 0;
		held = false;
		heldTimer = 0;
	}
	reset();
	
	update = function(){
		pressed = keyboard_check_pressed(key);
		released = keyboard_check_released(key);
		if(released) 
			releasedTimer = 0;
		else
			releasedTimer++;
			
		//This may seem out of order, but it allows you to
		//check how long a button was held after it was released.
		heldTimer = held ? heldTimer + 1 : 0;	
		held = keyboard_check(key);
		
		//Double Tap
		doubleTapped = pressed && releasedTimer < doubleTapGap;
	}
}
 