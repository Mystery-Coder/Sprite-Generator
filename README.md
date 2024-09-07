# Sprite Generator
Generating block sprites using a simple algorithm. 
Written in Java using Processing 4

# Algorithm
The algorithm is simple, consider the canvas divied into nxn squares and there are cases for handling
odd-even 'n'
First random colors are selected and then if 'n' is even, left half squares are coloured randomly and then symmetry is repeated is 
accross to the right half, it is similar for odd 'n', just the middle column is excluded and coloured different.

# Results
Even though the algorithm is not complex, there are many possible images,
For even 'n', there are $$2^{\frac{n^2}{2}}$$ possibilities for the left half to be coloured
For odd, there are $$2^{\frac{(n-1)*n}{2}}$$

8x8 Sprite<br>
![sprite-#13](https://github.com/user-attachments/assets/143b222a-b77c-4b77-969b-6054cc08b5b2)


9x9 Sprite<br>
![sprite-#51](https://github.com/user-attachments/assets/f77535a4-5fec-4d2f-81ef-69962eb71f30)


