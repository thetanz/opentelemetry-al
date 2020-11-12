table 70254095 "Span_OT_TSL"
{
    TableType = Temporary;

    fields
    {
        field(1; SpanId; Text[8])
        {
            DataClassification = SystemMetadata;
        }
        field(2; ParentSpanId; Text[8])
        {
            DataClassification = SystemMetadata;
        }
        field(3; TraceId; Text[32])
        {
            DataClassification = SystemMetadata;
        }
        field(4; Name; Text[1024])
        {
            DataClassification = SystemMetadata;
        }
        field(5; StartDateTime; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        field(6; EndDateTime; DateTime)
        {
            DataClassification = SystemMetadata;
        }
    }
}