using System
using System.Collections.Generic
using System.Text
using System.IO
using System.Linq


/// <summary>
/// The SolverBase class.
/// </summary>
class DayGenerator

    private BaseDir as string
    private SolverSourceCode as string

    


    private method GenerateDay(day as string) as void
        var DayDirectory := Path.Combine(BaseDir, day)
        var dayCode := SolverSourceCode.Replace("Day01", day)
        Directory.CreateDirectory(DayDirectory)
        
        
        var sourceFileName := path.Combine(DayDirectory, day + "Solver.prg")

        if !File.Exists(sourceFileName)
            File.WriteAllText(sourceFileName, dayCode)
        endif
        
        File.WriteAllText(path.Combine(DayDirectory, "input.txt"), "")
        File.WriteAllText(path.Combine(DayDirectory, "output1.txt"), "")
        File.WriteAllText(path.Combine(DayDirectory, "output2.txt"), "")
        return
        
    public method Generate() as void
        BaseDir := AppContext.BaseDirectory.Substring(0, AppContext.BaseDirectory.IndexOf("bin"))
        SolverSourceCode := FIle.ReadAllText(Path.Combine(BaseDir, "Day01", "Day01Solver.prg"))
        
        for var i := 2 to 25
            self:GenerateDay("Day" + i.ToString("00"))
        next
        return
        
    
end class
