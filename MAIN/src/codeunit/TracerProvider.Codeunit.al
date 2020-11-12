codeunit 70254095 "TracerProvider_OT_TSL"
{
    SingleInstance = true;

    var
        [NonDebuggable]
        Tracers: array[20] of Codeunit Tracer_OT_TSL;
        [NonDebuggable]
        TracersIndex: Dictionary of [Text, Integer];

    [NonDebuggable]
    procedure TryGetTracer(Name: Text[1024]; Processor: Interface ISpanProcessor_OT_TSL; var Tracer: Codeunit Tracer_OT_TSL): Boolean
    begin
        exit(TryGetTracer(Name, Processor, '', Tracer))
    end;

    [NonDebuggable]
    procedure TryGetTracer(Name: Text[1024]; Processor: Interface ISpanProcessor_OT_TSL; ProcessorKey: Text; var Tracer: Codeunit Tracer_OT_TSL): Boolean
    var
        TracerKey: Text;
        TracerIndex: Integer;
    begin
        Name := LowerCase(Name);
        TracerKey := Name + ProcessorKey;
        if TracersIndex.Get(TracerKey, TracerIndex) then
            Tracer := Tracers[TracerIndex]
        else
            if Processor.IsKeyValid(ProcessorKey) then begin
                TracerIndex := TracersIndex.Count() + 1;
                Tracer := Tracers[TracerIndex];
                Tracer.Init(Name, Processor);
                TracersIndex.Add(TracerKey, TracerIndex);
            end;
        exit(Tracer.IsEnabled())
    end;
}