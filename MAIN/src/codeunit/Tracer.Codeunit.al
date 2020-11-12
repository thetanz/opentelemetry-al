codeunit 70254096 "Tracer_OT_TSL"
{
    var
        Span: Record Span_OT_TSL;
        Name: Text[1024];
        Processor: Interface ISpanProcessor_OT_TSL;
        Enabled: Boolean;

    internal procedure Init(NewName: Text[1024]; NewProcessor: Interface ISpanProcessor_OT_TSL)
    begin
        Name := NewName;
        Processor := NewProcessor;
        Enabled := true;
    end;

    internal procedure IsEnabled(): Boolean
    begin
        exit(Enabled)
    end;

    procedure StartSpan(Name: Text[1024])
    var
        SpanBuffer: Record Span_OT_TSL;
    begin
        SpanBuffer.StartDateTime := CurrentDateTime();
        if Enabled then begin
            Evaluate(SpanBuffer.SpanId, GenerateId(MaxStrLen(SpanBuffer.SpanId)));
            SpanBuffer.Name := LowerCase(Name);
            SpanBuffer.ParentSpanId := Span.SpanId;
            if Span.TraceId = '' then
                Evaluate(SpanBuffer.TraceId, GenerateId(MaxStrLen(SpanBuffer.TraceId)));
            SpanBuffer.TraceId := Span.TraceId;
            Processor.OnStart(SpanBuffer);
            Span.Init();
            Span := SpanBuffer;
            Span.Insert()
        end
    end;

    procedure EndSpan()
    var
        SpanBuffer: Record Span_OT_TSL;
    begin
        SpanBuffer := Span;
        SpanBuffer.EndDateTime := CurrentDateTime();
        if Enabled then begin
            Processor.OnEnd(SpanBuffer);
            Span := SpanBuffer;
            Span.Delete();
            if not Span.Get(SpanBuffer.ParentSpanId) then
                Clear(Span);
        end
    end;

    local procedure GenerateId(MaxLength: Integer): Text
    begin
        exit(LowerCase(CopyStr(DelChr(Format(CreateGuid()), '=', '{}-'), 1, MaxLength)))
    end;
}