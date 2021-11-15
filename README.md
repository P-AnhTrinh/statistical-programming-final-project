# statistical-programming-final-project

## 🏃‍♀️ Olympic Games
Given a data set ```speed.txt```. It contains the times in seconds recorded by the winners in the finals of various men’s running events (200, 400, 800 and 1500 metres) at each of the 21 Olympic Games from 1900 to 2004, along with the heights above sea level of the different venues. 

Create a plot that shows both the data and the best fitting line. 

According to the average speed predicted best fitting linear model, in what year will the 100 meters race be likely to be run in less than 7 seconds? 

How close are the residuals (difference between the actual average speed and the speed predicted by the best fitting line) to being normally distributed?

Investigate if there is any relation between the altitude of the venue and the average speed. 

## 🥼 Modified Newton's method
The objective of this problem is to implement an efficient root finding technique for polynomials. 

In this problem, a polynomial with coefficients c<sub>1</sub>, . . . , c<sub>n+1</sub> is defined as:

<p align="center">
  <i> P(x) = c<sub>n+1</sub>x<sup>n</sup> + c<sub>n</sub>x<sup>n-1</sup> + ... + c<sub>2</sub>x + c<sub>1</sub></i>
</p>

## :mag: Ada's Walk
The goal is to simulate a random walk of an agent called Ada (in honor of Ada Lovelace) over
an infinite two-dimensional grid, i.e. the set of all pairs <i>(i, j)</i>, where <i>i</i>, <i>j</i> are integers. The random walk is defined as follows:

- The random walk is composed of a sequence of positions A<sub>0</sub>, A<sub>1</sub>, A<sub>2</sub>, ..., where each A<sub>k</sub> is a 2D point
with integer coordinates.

- At time t = 0, Ada is in position A<sub>0</sub> = (0, 0).

- Assume Ada to be in position A<sub>t</sub> at time t. At time t + 1, she will move up, down, left or right with
equal probability. For example, if A<sub>3</sub> = (3,−1), then A<sub>4</sub> can be either (4,−1), (3, 0), (2,−1), or (3,−2)
with equal probability.

- Ada always moves (A<sub>t</sub> ≠ A<sub>t+1</sub> for all t)

- The random walk stops when Ada is back in position (0, 0) or if she has already done more than 100
steps (in that case, her final position will be A<sub>100</sub>, which might or might not be (0, 0)).

## :nerd_face: Gradient Descent
The idea of the gradient descent algorithm is the following. Assume to have an initial approximation x<sub>0</sub> of
x<sub><i>min</i></sub>. Let <i>h > 0</i> be a certain step size (usually, a very small positive number). Define the gradient descent
iterations as

<p align="center">
  <i> x<sub>k+1</sub> = x<sub>k</sub> − h∇f(x<sub>k</sub>) </i>
</p>

We keep computing new iterations x<sub>k</sub> until a certain stopping criterion is met. For example, given a certain
tolerance TOL > 0, we can stop when
<p align="center">
  <i> ||x<sub>k+1</sub> − x<sub>k</sub>||<sub>2</sub> ≤ TOL </i>
</p>
where ||x||<sub>2</sub> is the Euclidean norm of x.

          
          
