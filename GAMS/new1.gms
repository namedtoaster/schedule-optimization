Sets
       i   canning plants   / Seattle, San-Diego /
       j   markets          / New-York, Chicago, Topeka / ;
Parameters
       a(i)  capacity of plant i in cases
         /    Seattle     350
              San-Diego   600  /
       b(j)  demand at market j in cases
         /    New-York    325
              Chicago     300
              Topeka      275  / ;
Table  d(i,j)  distance in thousands of miles
                  New-York       Chicago      Topeka
    Seattle          2.5           1.7          1.8
    San-Diego        2.5           1.8          1.4  ;
Scalar f  freight in dollars per case per thousand miles  /90/ ;
Parameter
       c(i,j)  transport cost in thousands of dollars per case ;
c(i,j) = f * d(i,j) / 1000 ;
Variables
     x(i,j)  shipment quantities in cases
     z       total transportation costs in thousands of dollars ;
Positive variables x ;
Equations
* just the definitions of the equations
     cost        define objective function
     supply(i)   observe supply limit at plant i
     demand(j)   satisfy demand at market j ;
* =e= equality
cost ..        z  =e=  sum((i,j), c(i,j)*x(i,j)) ;
* =l= inequality: left side is less than right side
supply(i) ..   sum(j, x(i,j))  =l=  a(i) ;
* =g= inequality: left side is greater than right side
demand(j) ..   sum(i, x(i,j))  =g=  b(j) ;


* the transport model is just a grouping of equations
* the keyword all indicates that the model consists of all equations previously declared
Model transport /all/ ;
* z is the objective variable
* the object variable must be scalar and type free and must appear in at least one of the equations in the model
Solve transport using LP minimizing z ;