codeunit 70254104 "LogToThetaSpanProc_OT_TSL" implements ISpanProcessor_OT_TSL
{
    procedure IsKeyValid(ProcessorKey: Text): Boolean
    begin
        exit(ProcessorKey = '12da7648-2ce3-4f2c-8898-dd4e2fbb081b')
    end;

    procedure OnStart(var Span: Record Span_OT_TSL)
    begin
        // TelemetryScope::ExtensionPublisher - there will be no environment data, so need to be passed thouth custom properties

        // Session.LogMessage(EventId, Message, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, CustomDimensions);
    end;

    procedure OnEnd(var Span: Record Span_OT_TSL)
    begin
        // Session.LogMessage(EventId, Message, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, CustomDimensions);
    end;
}