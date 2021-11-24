using System
using System.Collections.Generic
using System.Text
using System.IO
using System.Linq


/// <summary>
/// The SolverBase class.
/// </summary>
abstract class SolverBase

    public property DayDirectory as string get Path.Combine(AppContext.BaseDirectory.Substring(0, AppContext.BaseDirectory.IndexOf("bin")), self:GetType().Name.Substring(0, 5))

    private method Load(inputFileName as string) as List<string>
        var fileName := Path.Combine(DayDirectory, inputFileName)
        var content := File.ReadAllLines(fileName).ToList()
        return content

    private method Save(outputFileName as string, data as string) as string
        var fileName := Path.Combine(DayDirectory, outputFileName)
        File.WriteAllText(fileName, data)
        return data

    private method ExecutePuzzle(inputFileName as string, outputFileName as string, solveAction as System.Func<object>) as string
        self:Parse(self:Load(inputFileName))
        return self:Save(outputFileName, solveAction()?.ToString())


    protected abstract method Parse(data as List<string>) as void

    protected abstract method Solve1() as object

    protected abstract method Solve2() as object


    public method ExecutePuzzle1(inputFileName := "input.txt" as string, outputFileName := "output1.txt" as string) as string
        return self:ExecutePuzzle(inputFileName, outputFileName, { => self:Solve1()})

    public method ExecutePuzzle2(inputFileName := "input.txt" as string, outputFileName := "output2.txt" as string) as string
        return self:ExecutePuzzle(inputFileName, outputFileName, { => self:Solve2()})


    constructor()
    return
    
end class
