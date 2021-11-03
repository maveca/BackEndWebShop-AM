/// <summary>
/// Codeunit SOAP Ws (ID 50100).
/// </summary>
codeunit 50100 "SOAPWs-AM"
{
    trigger OnRun()
    begin

    end;

    /// <summary>
    /// Calc.
    /// </summary>
    /// <param name="Name">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure Calc(Name: Text): Text
    begin
        exit('Welcome ' + Name + '.');
    end;
}