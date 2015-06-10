// Store location of start in register
write r10 START

START:

// Set conditions 
// Acceleration y (-10/10)
write r4 -1

// Start position x (0)
write r30 0

//Start position y (400)
write r31 100
write r28 4
mul r31 r28 r31

// Edge x (640)
write r11 160
mul r11 r28 r11

// Edge y (400)
add r31 r0 r12

// Timer setting (5000000)
write r20 125
write r21 32
write r22 10
mul r20 r21 r20
mul r20 r22 r20

write r17 TIMER

// Increment for time (1)
write r13 1

write r14 WAIT

// Decrement (-1)
write r16 -1

write r29 LOOP

WAIT:
// Wait for starting conditions
bgt r1 r0 r14




// Begin loop
LOOP:

// Increment time
add r1 r13 r1

// Find delta v y
mul r4 r1 r5
// Add delta v y and current v y
add r5 r3 r3
// Add v y and current position to find next position
add r31 r3 r31

// Add v x and current position to find next position
add r30 r2 r30


// Check if out of bounds
bgt r30 r11 r10
bgt r31 r12 r10

// Wait for fraction of a second (5000000 cyles)
add r20 r0 r15
TIMER:

// Decrement 
add r16 r15 r15
// Branch while countdown still going
bgt r15 r0 r17

// Return to next loop
jmp r29



















//r0 = 0;
//r1 = time
//r2 = vx
//r3 = vy
//r4 = ay
//r5 = dvy
//r11 = maxx = 640
//r12 = maxy = 400
//r30 = x
//r31 = y


//vx = constant
//vy = vy + ay*time
//x = x + vx
//y = y + vy