interface "ISpanProcessor_OT_TSL"
{
    procedure IsKeyValid(ProcessorKey: Text): Boolean;
    procedure OnStart(var Span: Record Span_OT_TSL);
    procedure OnEnd(var Span: Record Span_OT_TSL);
}