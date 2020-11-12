codeunit 70254103 "LogToThetaTest_OT_TSL"
{
    // [FEATURE] []

    Subtype = Test;
    TestPermissions = Disabled;

    var
        TracerProvider: Codeunit TracerProvider_OT_TSL;
        Assert: Codeunit Assert;
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        LibraryRandom: Codeunit "Library - Random";
        LibraryUtility: Codeunit "Library - Utility";

    [Test]
    procedure Given_ProcessorExtended_When_CallingSpanStart_Then_Message();
    var
        Tracer: Codeunit Tracer_OT_TSL;
    begin
        // [Scenario]
        // [Given]
        TracerProvider.TryGetTracer('OpenTelemetry (TEST)', SpanProcessor_OT_TSL::LogToTheta, '12da7648-2ce3-4f2c-8898-dd4e2fbb081b', Tracer);
        // [When]
        Tracer.StartSpan('Given_ProcessorExtended_When_CallingSpanStart_Then_Message');
        Sleep(1000);
        Tracer.EndSpan();
        // [Then]
    end;
}