using System
using System.Collections.Generic
using System.Linq
using System.Text

function Start() as void strict
    
    // Initialze the Runner for a DaySolver. To run the Solver for the 1 day, use the Day01Sovler
    var runner := SolverConsoleRummer<Day01Solver>{}
    
    // Execute the Solver
    runner.Run()
    
    